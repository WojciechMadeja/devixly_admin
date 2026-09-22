import 'package:devixly_admin/core/network/http_json_client.dart';
import 'package:devixly_admin/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:devixly_admin/features/auth/data/models/admin_user_model.dart';
import 'package:devixly_admin/features/auth/data/models/auth_session_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/fake_xano_api.dart';

/// Kontrakt z backendem Xano: te same metody, ścieżki i pola co w wersji
/// FlutterFlow (lib/backend/api_requests/api_calls.dart).
void main() {
  const host = 'https://xxiz-mxuj-zpyz.n7e.xano.io';
  late FakeXanoApi api;
  late AuthRemoteDataSource dataSource;

  setUp(() {
    api = FakeXanoApi();
    dataSource = AuthRemoteDataSourceImpl(HttpJsonClient(api.client));
  });

  const session = AuthSessionModel(
    accessToken: 'auth-token-1',
    refreshToken: 'refresh-token-1',
    refreshTokenId: 7,
    user: AdminUserModel(
      id: 1,
      email: 'admin@devixly.com',
      firstName: 'Jan',
      lastName: 'Kowalski',
      phoneNumber: '+48 600 100 200',
      company: 'Crowd Empire',
    ),
  );

  test('login: POST auth/admin/login z e-mailem i hasłem', () async {
    final result =
        await dataSource.login(email: 'admin@devixly.com', password: 'tajne');

    final request = api.requests.single;
    expect(request.method, 'POST');
    expect(request.url.toString(), '$host/api:Q_aNNNvL/auth/admin/login');
    expect(request.headers.containsKey('Authorization'), isFalse);
    expect(request.json, {'email': 'admin@devixly.com', 'password': 'tajne'});
    expect(result.accessToken, 'auth-token-1');
    expect(result.refreshToken, 'refresh-token-1');
    expect(result.refreshTokenId, 7);
    expect(result.accessTokenExpiresAt, 4102444800000);
    expect(result.sessionExpiresAt, 4102444800000);
    expect(result.user, session.user);
  });

  test('refresh: POST auth/refresh z refresh tokenem, jego id i id admina',
      () async {
    final result = await dataSource.refresh(session);

    final request = api.requests.single;
    expect(request.method, 'POST');
    expect(request.url.toString(), '$host/api:Q_aNNNvL/auth/refresh');
    expect(request.json, {
      'refreshToken': 'refresh-token-1',
      'refreshTokenId': 7,
      'userId': 1,
    });
    expect(result.accessToken, 'auth-token-2');
    expect(result.refreshToken, 'refresh-token-2');
    expect(result.refreshTokenId, 8);
    expect(result.user, session.user);
  });

  test('revoke: POST auth/revoke_token z id refresh tokenu', () async {
    await dataSource.revoke(7);

    final request = api.requests.single;
    expect(request.url.toString(), '$host/api:Q_aNNNvL/auth/revoke_token');
    expect(request.json, {'refreshTokenId': 7});
  });

  test('reset hasła: POST auth/reset_password z e-mailem', () async {
    await dataSource.requestPasswordReset('admin@devixly.com');

    final request = api.requests.single;
    expect(request.url.toString(), '$host/api:Q_aNNNvL/auth/reset_password');
    expect(request.json, {'email': 'admin@devixly.com'});
  });
}
