import '../errors/exceptions.dart';
import 'auth_token_provider.dart';
import 'http_json_client.dart';

/// Klient endpointów wymagających logowania: dodaje nagłówek `Bearer`, a gdy
/// backend odrzuci token, odświeża sesję i ponawia żądanie jeden raz.
class AuthorizedApiClient {
  AuthorizedApiClient(this._http, this._tokens);

  final HttpJsonClient _http;
  final AuthTokenProvider _tokens;

  Future<Object?> get(String path, {Map<String, String>? query}) =>
      _authorized((headers) => _http.get(path, query: query, headers: headers));

  Future<Object?> delete(String path, {Map<String, String>? query}) =>
      _authorized(
        (headers) => _http.delete(path, query: query, headers: headers),
      );

  Future<Object?> post(String path, {Object? body}) =>
      _authorized((headers) => _http.post(path, body: body, headers: headers));

  Future<Object?> put(String path, {Object? body}) =>
      _authorized((headers) => _http.put(path, body: body, headers: headers));

  Future<Object?> patch(String path, {Object? body}) =>
      _authorized((headers) => _http.patch(path, body: body, headers: headers));

  Future<Object?> multipart(
    String method,
    String path, {
    Map<String, String> fields = const {},
    List<MultipartFileData> files = const [],
  }) => _authorized(
    (headers) => _http.multipart(
      method,
      path,
      fields: fields,
      files: files,
      headers: headers,
    ),
  );

  Future<Object?> _authorized(
    Future<Object?> Function(Map<String, String> headers) send,
  ) async {
    final token = await _tokens.validAccessToken();
    if (token == null) throw const UnauthorizedException();
    try {
      return await send(_bearer(token));
    } on UnauthorizedException {
      final refreshed = await _tokens.refreshAfterUnauthorized();
      if (refreshed == null) rethrow;
      return send(_bearer(refreshed));
    }
  }

  static Map<String, String> _bearer(String token) => {
    'Authorization': 'Bearer $token',
  };
}
