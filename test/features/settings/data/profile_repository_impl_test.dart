import 'package:devixly_admin/app/di/injection.dart';
import 'package:devixly_admin/features/auth/domain/repositories/auth_repository.dart';
import 'package:devixly_admin/features/settings/domain/entities/admin_profile.dart';
import 'package:devixly_admin/features/settings/domain/entities/profile_drafts.dart';
import 'package:devixly_admin/features/settings/domain/repositories/profile_repository.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/fake_xano_api.dart';
import '../../../helpers/test_dependencies.dart';

void main() {
  tearDown(getIt.reset);

  test('po zapisie danych sesja zna nowe imię, nazwisko i telefon', () async {
    await setUpTestDependencies(
      api: FakeXanoApi(
        overrides: {
          'PUT /api:om78GTVu/user/1': const FakeResponse('user_updated.json'),
        },
      ),
    );
    final auth = getIt<AuthRepository>();
    final profile = (await getIt<ProfileRepository>().getProfile()).getOrElse(
      (_) => throw StateError('brak profilu'),
    );

    final saved = await getIt<ProfileRepository>().updateProfile(
      profile,
      const ProfileUpdate(
        firstName: 'Janusz',
        lastName: 'Kowalik',
        phoneNumber: '+48 600 100 300',
      ),
    );

    expect(saved.isRight(), isTrue);
    final user = auth.currentSession!.user;
    expect(user.fullName, 'Janusz Kowalik');
    expect(user.phoneNumber, '+48 600 100 300');
    // Firma i e-mail pochodzą z sesji i nie giną przy zapisie.
    expect(user.company, 'Crowd Empire');
    expect(user.email, 'admin@devixly.com');
  });

  test('profil zawiera id firmy potrzebne do zapisu', () async {
    await setUpTestDependencies();

    final profile = (await getIt<ProfileRepository>().getProfile()).getOrElse(
      (_) => throw StateError('brak profilu'),
    );

    expect(profile, isA<AdminProfile>());
    expect(profile.companyId, 1);
  });
}
