import 'package:devixly_admin/app/di/injection.dart';
import 'package:devixly_admin/features/settings/data/datasources/profile_remote_data_source.dart';
import 'package:devixly_admin/features/settings/data/models/admin_profile_mapper.dart';
import 'package:devixly_admin/features/settings/domain/entities/admin_profile.dart';
import 'package:devixly_admin/features/settings/domain/entities/profile_drafts.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/fake_backend.dart';
import '../../../helpers/test_dependencies.dart';

/// Kontrakt z backendem (`AccountEndpoint`, `AppUserEndpoint.update`).
void main() {
  const profile = AdminProfile(
    id: 1,
    email: 'admin@devixly.com',
    firstName: 'Jan',
    lastName: 'Kowalski',
    phoneNumber: '+48 600 100 200',
    companyId: 4,
    companyName: 'Devixly Sp. z o.o.',
  );

  late FakeBackend api;
  late ProfileRemoteDataSource dataSource;

  setUp(() async {
    api = await setUpTestDependencies();
    dataSource = getIt<ProfileRemoteDataSource>();
  });
  tearDown(getIt.reset);

  test('account.me zwraca dane konta razem z firmą', () async {
    final result = (await dataSource.getProfile()).toProfile();

    final call = api.calls.single;
    expect(call.route, 'account.me');
    expect(call.arguments, isEmpty);
    expect(call.headers['authorization'], 'Bearer auth-token-1');
    expect(result.fullName, 'Jan Kowalski');
    expect(result.email, 'admin@devixly.com');
    expect(result.phoneNumber, '+48 600 100 200');
    expect(result.companyId, 1);
    expect(result.companyName, 'Crowd Empire');
  });

  test('appUser.update zachowuje e-mail i firmę administratora', () async {
    await dataSource.updateProfile(
      profile,
      const ProfileUpdate(
        firstName: 'Janusz',
        lastName: 'Kowalik',
        phoneNumber: '+48 600 100 300',
      ),
    );

    expect(api.calls.map((call) => call.route), [
      'appUser.update',
      'account.me',
    ]);
    expect(api.calls.first.arguments, {
      'id': 1,
      'input': {
        'email': 'admin@devixly.com',
        'companyId': 4,
        'lastName': 'Kowalik',
        'firstName': 'Janusz',
        'phoneNumber': '+48 600 100 300',
      },
    });
  });

  test('account.changePassword wysyła oba hasła', () async {
    await dataSource.updatePassword(
      const PasswordChange(oldPassword: 'stare', newPassword: 'nowe'),
    );

    final call = api.calls.single;
    expect(call.route, 'account.changePassword');
    expect(call.arguments, {'oldPassword': 'stare', 'newPassword': 'nowe'});
  });
}
