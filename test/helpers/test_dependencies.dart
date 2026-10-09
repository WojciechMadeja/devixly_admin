import 'dart:convert';

import 'package:devixly_admin/app/di/injection.dart';
import 'package:devixly_admin/core/network/backend_client.dart';
import 'package:devixly_admin/features/auth/data/datasources/session_local_data_source.dart';
import 'package:devixly_admin/features/auth/data/models/admin_user_model.dart';
import 'package:devixly_admin/features/auth/domain/repositories/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'fake_backend.dart';
import 'fixtures.dart';

/// Zalogowany administrator z fixture'ów.
const testAdmin = AdminUserModel(
  id: 1,
  email: 'admin@devixly.com',
  firstName: 'Jan',
  lastName: 'Kowalski',
  phoneNumber: '+48 600 100 200',
  company: 'Crowd Empire',
);

/// Zapisana sesja klienta backendu i dane administratora — stan
/// SharedPreferences zalogowanego panelu.
Map<String, Object> signedInPreferences() => {
  PreferencesAuthStorage.key: readFixture('api/auth_success.json'),
  SessionLocalDataSourceImpl.key: json.encode(testAdmin.toJson()),
};

/// Rejestruje prawdziwe zależności aplikacji z atrapą backendu
/// i zalogowanym administratorem. Po teście wywołaj `getIt.reset()`.
Future<FakeBackend> setUpTestDependencies({FakeBackend? api}) async {
  final fakeApi = api ?? FakeBackend();
  SharedPreferences.setMockInitialValues(signedInPreferences());
  await setupDependencies(
    httpClient: fakeApi.client,
    uploadFile: fakeApi.uploadFile,
  );
  await getIt<AuthRepository>().restoreSession();
  return fakeApi;
}
