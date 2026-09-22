import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

import 'fixtures.dart';

/// Fałszywe API Xano oparte na plikach z test/fixtures/api. Odpowiada tak jak
/// produkcyjny backend (gołe tablice, JSON w UTF-8) i zapisuje otrzymane
/// żądania, żeby testy mogły sprawdzić kontrakt.
class FakeXanoApi {
  FakeXanoApi({Map<String, FakeResponse>? overrides, this.responseDelay})
      : _routes = {..._defaultRoutes, ...?overrides};

  /// Opóźnienie odpowiedzi — pozwala uchwycić stany ładowania (szkielety).
  final Duration? responseDelay;

  static final Map<String, FakeResponse> _defaultRoutes = {
    'POST /api:Q_aNNNvL/auth/admin/login': const FakeResponse('admin_login.json'),
    'POST /api:Q_aNNNvL/auth/refresh': const FakeResponse('refresh_token.json'),
    'POST /api:Q_aNNNvL/auth/revoke_token': const FakeResponse(null),
    'GET /api:iiXsTPtO/news': const FakeResponse('news.json'),
    'GET /api:Qct1TYOV/categories': const FakeResponse('categories.json'),
    'GET /api:lUs0VlvB/companies': const FakeResponse('companies.json'),
    'GET /api:om78GTVu/user': const FakeResponse('users.json'),
    'GET /api:om78GTVu/user/1': const FakeResponse('user.json'),
  };

  final Map<String, FakeResponse> _routes;
  final List<http.BaseRequest> requests = [];

  http.Client get client => MockClient.streaming(_handle);

  Future<http.StreamedResponse> _handle(
    http.BaseRequest request,
    http.ByteStream bodyStream,
  ) async {
    await bodyStream.drain<void>();
    requests.add(request);
    if (responseDelay != null) await Future<void>.delayed(responseDelay!);
    final stub = _routes['${request.method} ${request.url.path}'];
    if (stub == null) {
      return _response(404, {'message': 'Brak fixture dla ${request.url}'});
    }
    final body =
        stub.fixture == null ? <String, Object?>{} : readJsonFixture('api/${stub.fixture}');
    return _response(stub.statusCode, body);
  }

  http.StreamedResponse _response(int statusCode, Object? body) {
    final bytes = utf8.encode(json.encode(body));
    return http.StreamedResponse(
      Stream.value(bytes),
      statusCode,
      contentLength: bytes.length,
      headers: {'content-type': 'application/json; charset=utf-8'},
    );
  }
}

/// Odpowiedź endpointu: plik fixture (lub puste `{}`) i kod statusu.
/// Testy mogą nadpisać odpowiedź przez `FakeXanoApi(overrides: {...})`.
class FakeResponse {
  const FakeResponse(this.fixture, {this.statusCode = 200});

  final String? fixture;
  final int statusCode;
}

