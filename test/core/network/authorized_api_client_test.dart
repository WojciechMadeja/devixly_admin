import 'package:devixly_admin/core/errors/exceptions.dart';
import 'package:devixly_admin/core/network/auth_token_provider.dart';
import 'package:devixly_admin/core/network/authorized_api_client.dart';
import 'package:devixly_admin/core/network/http_json_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:mocktail/mocktail.dart';

class _MockTokens extends Mock implements AuthTokenProvider {}

void main() {
  late _MockTokens tokens;
  late List<String?> sentTokens;

  AuthorizedApiClient clientWith(List<int> statuses) {
    var call = 0;
    return AuthorizedApiClient(
      HttpJsonClient(
        MockClient((request) async {
          sentTokens.add(request.headers['Authorization']);
          return http.Response('{}', statuses[call++]);
        }),
        baseUrl: 'https://xano.test',
      ),
      tokens,
    );
  }

  setUp(() {
    tokens = _MockTokens();
    sentTokens = [];
  });

  test('dodaje nagłówek Bearer z aktualnym tokenem', () async {
    when(tokens.validAccessToken).thenAnswer((_) async => 'token-1');

    await clientWith([200]).get('api:grp/news');

    expect(sentTokens, ['Bearer token-1']);
    verifyNever(tokens.refreshAfterUnauthorized);
  });

  test('po 401 odświeża token i ponawia żądanie raz', () async {
    when(tokens.validAccessToken).thenAnswer((_) async => 'token-1');
    when(tokens.refreshAfterUnauthorized).thenAnswer((_) async => 'token-2');

    await clientWith([401, 200]).get('api:grp/news');

    expect(sentTokens, ['Bearer token-1', 'Bearer token-2']);
  });

  test('gdy odświeżenie się nie uda, rzuca UnauthorizedException', () async {
    when(tokens.validAccessToken).thenAnswer((_) async => 'token-1');
    when(tokens.refreshAfterUnauthorized).thenAnswer((_) async => null);

    expect(
      clientWith([401]).get('api:grp/news'),
      throwsA(isA<UnauthorizedException>()),
    );
  });

  test('bez sesji nie wysyła żądania', () async {
    when(tokens.validAccessToken).thenAnswer((_) async => null);

    await expectLater(
      clientWith([200]).get('api:grp/news'),
      throwsA(isA<UnauthorizedException>()),
    );
    expect(sentTokens, isEmpty);
  });
}
