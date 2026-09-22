import 'dart:convert';

import 'package:devixly_admin/app/di/injection.dart';
import 'package:devixly_admin/features/auth/data/models/admin_user_model.dart';
import 'package:devixly_admin/features/auth/data/models/auth_session_model.dart';
import 'package:devixly_admin/features/auth/domain/repositories/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'fake_xano_api.dart';

/// Sesja zalogowanego administratora z fixture'ów (ważna do 2100 r.).
const testSession = AuthSessionModel(
  accessToken: 'auth-token-1',
  refreshToken: 'refresh-token-1',
  refreshTokenId: 7,
  accessTokenExpiresAt: 4102444800000,
  sessionExpiresAt: 4102444800000,
  user: AdminUserModel(
    id: 1,
    email: 'admin@devixly.com',
    firstName: 'Jan',
    lastName: 'Kowalski',
    phoneNumber: '+48 600 100 200',
    company: 'Crowd Empire',
  ),
);

/// Rejestruje prawdziwe zależności aplikacji z atrapą backendu Xano
/// i zalogowanym administratorem. Po teście wywołaj `getIt.reset()`.
Future<FakeXanoApi> setUpTestDependencies({FakeXanoApi? api}) async {
  final fakeApi = api ?? FakeXanoApi();
  SharedPreferences.setMockInitialValues({
    'admin_session': json.encode(testSession.toJson()),
  });
  await setupDependencies(httpClient: fakeApi.client);
  await getIt<AuthRepository>().restoreSession();
  return fakeApi;
}
