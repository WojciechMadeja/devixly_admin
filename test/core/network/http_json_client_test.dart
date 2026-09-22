import 'dart:convert';

import 'package:devixly_admin/core/errors/exceptions.dart';
import 'package:devixly_admin/core/network/http_json_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

void main() {
  const baseUrl = 'https://xano.test';

  HttpJsonClient clientReturning(
    http.Response Function(http.Request request) handler,
  ) =>
      HttpJsonClient(
        MockClient((request) async => handler(request)),
        baseUrl: baseUrl,
      );

  test('wysyła body jako JSON z nagłówkiem Content-Type', () async {
    late http.Request sent;
    final client = clientReturning((request) {
      sent = request;
      return http.Response('{}', 200);
    });

    await client.post(
      'api:grp/categories',
      body: {'name': 'Inwestycje', 'admin_email': 'admin@devixly.com'},
      headers: {'Authorization': 'Bearer t'},
    );

    expect(sent.method, 'POST');
    expect(sent.url.toString(), '$baseUrl/api:grp/categories');
    expect(sent.headers['Content-Type'], startsWith('application/json'));
    expect(sent.headers['Authorization'], 'Bearer t');
    expect(
      jsonDecode(sent.body),
      {'name': 'Inwestycje', 'admin_email': 'admin@devixly.com'},
    );
  });

  test('dekoduje odpowiedź jako UTF-8 także bez charset w nagłówku', () async {
    final client = clientReturning(
      (_) => http.Response.bytes(
        utf8.encode('[{"name": "Łódzkie Nieruchomości"}]'),
        200,
        headers: {'content-type': 'application/json'},
      ),
    );

    final body = await client.get('api:grp/companies');

    expect(body, [
      {'name': 'Łódzkie Nieruchomości'},
    ]);
  });

  test('dokleja parametry zapytania', () async {
    late http.Request sent;
    final client = clientReturning((request) {
      sent = request;
      return http.Response('[]', 200);
    });

    await client.get('api:grp/user', query: {'email': 'admin@devixly.com'});

    expect(sent.url.queryParameters, {'email': 'admin@devixly.com'});
  });

  test('401 zamienia na UnauthorizedException', () async {
    final client = clientReturning(
      (_) => http.Response('{"message": "Invalid token"}', 401),
    );

    expect(
      client.get('api:grp/news'),
      throwsA(
        isA<UnauthorizedException>()
            .having((e) => e.message, 'message', 'Invalid token'),
      ),
    );
  });

  test('inne kody błędów zamienia na ServerException z komunikatem', () async {
    final client = clientReturning(
      (_) =>
          http.Response.bytes(utf8.encode('{"message": "Brak dostępu"}'), 403),
    );

    expect(
      client.delete('api:grp/news/1'),
      throwsA(
        isA<ServerException>()
            .having((e) => e.statusCode, 'statusCode', 403)
            .having((e) => e.message, 'message', 'Brak dostępu'),
      ),
    );
  });

  test('błąd połączenia zamienia na NetworkException', () async {
    final client = HttpJsonClient(
      MockClient((_) async => throw http.ClientException('offline')),
      baseUrl: baseUrl,
    );

    expect(client.get('api:grp/news'), throwsA(isA<NetworkException>()));
  });

  test('pusta odpowiedź 2xx zwraca null', () async {
    final client = clientReturning((_) => http.Response('', 200));

    expect(await client.delete('api:grp/news/1'), isNull);
  });
}
