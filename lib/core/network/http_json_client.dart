import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';

import '../config/api_config.dart';
import '../errors/exceptions.dart';

/// Plik wysyłany w żądaniu multipart.
final class MultipartFileData {
  const MultipartFileData({
    required this.field,
    required this.bytes,
    this.filename,
  });

  final String field;
  final Uint8List bytes;
  final String? filename;
}

/// Klient HTTP backendu Xano bez autoryzacji: buduje adresy, koduje JSON,
/// dekoduje odpowiedzi jako UTF-8 i zamienia błędy na wyjątki warstwy danych.
/// Zwraca zdekodowane ciało odpowiedzi (mapa, lista albo `null`).
class HttpJsonClient {
  HttpJsonClient(
    this._client, {
    this.baseUrl = ApiConfig.baseUrl,
    this.timeout = const Duration(seconds: 30),
  });

  final http.Client _client;
  final String baseUrl;
  final Duration timeout;

  static const _jsonHeaders = {'Content-Type': 'application/json'};

  Future<Object?> get(
    String path, {
    Map<String, String>? query,
    Map<String, String> headers = const {},
  }) =>
      _send(http.Request('GET', _uri(path, query))..headers.addAll(headers));

  Future<Object?> delete(
    String path, {
    Map<String, String>? query,
    Map<String, String> headers = const {},
  }) =>
      _send(http.Request('DELETE', _uri(path, query))..headers.addAll(headers));

  Future<Object?> post(
    String path, {
    Object? body,
    Map<String, String> headers = const {},
  }) =>
      _sendJson('POST', path, body, headers);

  Future<Object?> put(
    String path, {
    Object? body,
    Map<String, String> headers = const {},
  }) =>
      _sendJson('PUT', path, body, headers);

  Future<Object?> patch(
    String path, {
    Object? body,
    Map<String, String> headers = const {},
  }) =>
      _sendJson('PATCH', path, body, headers);

  /// Żądanie multipart/form-data (np. aktualność z obrazkiem).
  Future<Object?> multipart(
    String method,
    String path, {
    Map<String, String> fields = const {},
    List<MultipartFileData> files = const [],
    Map<String, String> headers = const {},
  }) {
    final request = http.MultipartRequest(method, _uri(path, null))
      ..headers.addAll(headers)
      ..fields.addAll(fields);
    for (final file in files) {
      request.files.add(
        http.MultipartFile.fromBytes(
          file.field,
          file.bytes,
          filename: file.filename,
          contentType: _mediaType(file.filename),
        ),
      );
    }
    return _send(request);
  }

  Future<Object?> _sendJson(
    String method,
    String path,
    Object? body,
    Map<String, String> headers,
  ) {
    final request = http.Request(method, _uri(path, null))
      ..headers.addAll({..._jsonHeaders, ...headers})
      ..body = jsonEncode(body ?? const <String, Object?>{});
    return _send(request);
  }

  Uri _uri(String path, Map<String, String>? query) {
    final uri = Uri.parse('$baseUrl/$path');
    return query == null ? uri : uri.replace(queryParameters: query);
  }

  Future<Object?> _send(http.BaseRequest request) async {
    final http.Response response;
    try {
      final streamed = await _client.send(request).timeout(timeout);
      response = await http.Response.fromStream(streamed).timeout(timeout);
    } on TimeoutException {
      throw const NetworkException('Przekroczono czas oczekiwania.');
    } on http.ClientException catch (e) {
      throw NetworkException(e.message);
    }

    final body = _decode(response);
    final status = response.statusCode;
    if (status >= 200 && status < 300) return body;
    final message = _errorMessage(body);
    if (status == 401) throw UnauthorizedException(message);
    throw ServerException(status, message);
  }

  Object? _decode(http.Response response) {
    if (response.bodyBytes.isEmpty) return null;
    try {
      return jsonDecode(utf8.decode(response.bodyBytes, allowMalformed: true));
    } on FormatException {
      if (response.statusCode >= 200 && response.statusCode < 300) {
        throw const ParsingException('Odpowiedź serwera nie jest JSON-em.');
      }
      return null;
    }
  }

  static String? _errorMessage(Object? body) =>
      body is Map<String, dynamic> ? body['message'] as String? : null;

  static MediaType? _mediaType(String? filename) {
    final type = filename == null ? null : lookupMimeType(filename);
    return type == null ? null : MediaType.parse(type);
  }
}
