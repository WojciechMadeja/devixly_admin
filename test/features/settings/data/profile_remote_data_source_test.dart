import 'package:devixly_admin/app/di/injection.dart';
import 'package:devixly_admin/features/settings/data/datasources/profile_remote_data_source.dart';
import 'package:devixly_admin/features/settings/domain/entities/admin_profile.dart';
import 'package:devixly_admin/features/settings/domain/entities/profile_drafts.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/fake_xano_api.dart';
import '../../../helpers/test_dependencies.dart';

/// Kontrakt z Xano (grupa api:om78GTVu) — te same ścieżki i pola co
/// w wersji FlutterFlow.
void main() {
  const base = 'https://xxiz-mxuj-zpyz.n7e.xano.io/api:om78GTVu/user';
  const profile = AdminProfile(
    id: 1,
    email: 'admin@devixly.com',
    firstName: 'Jan',
    lastName: 'Kowalski',
    phoneNumber: '+48 600 100 200',
    companyId: 4,
    companyName: 'Devixly Sp. z o.o.',
  );

  late FakeXanoApi api;
  late ProfileRemoteDataSource dataSource;

  setUp(() async {
    api = await setUpTestDependencies();
    dataSource = getIt<ProfileRemoteDataSource>();
  });
  tearDown(getIt.reset);

  test('GET user/{id} zwraca dane konta razem z firmą', () async {
    final result = (await dataSource.getProfile()).toEntity();

    final request = api.requests.single;
    expect(request.method, 'GET');
    expect(request.url.toString(), '$base/1');
    expect(request.headers['Authorization'], 'Bearer auth-token-1');
    expect(result.fullName, 'Jan Kowalski');
    expect(result.email, 'admin@devixly.com');
    expect(result.phoneNumber, '+48 600 100 200');
    expect(result.companyId, 1);
    expect(result.companyName, 'Crowd Empire');
  });

  test('PUT user/{id} wysyła firmę administratora, a nie stałe 1', () async {
    await dataSource.updateProfile(
      profile,
      const ProfileUpdate(
        firstName: 'Janusz',
        lastName: 'Kowalik',
        phoneNumber: '+48 600 100 300',
      ),
    );

    final request = api.requests.single;
    expect(request.method, 'PUT');
    expect(request.url.toString(), '$base/1');
    expect(request.json, {
      'admin_email': 'admin@devixly.com',
      'email': 'admin@devixly.com',
      'companies': 4,
      'last_name': 'Kowalik',
      'first_name': 'Janusz',
      'phone_number': '+48 600 100 300',
    });
  });

  test('PATCH user/update_password/{id} wysyła oba hasła', () async {
    await dataSource.updatePassword(
      const PasswordChange(oldPassword: 'stare', newPassword: 'nowe'),
    );

    final request = api.requests.single;
    expect(request.method, 'PATCH');
    expect(request.url.toString(), '$base/update_password/1');
    expect(request.json, {'old_password': 'stare', 'new_password': 'nowe'});
  });
}
