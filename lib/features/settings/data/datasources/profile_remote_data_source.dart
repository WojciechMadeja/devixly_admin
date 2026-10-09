import 'package:background_devixly_client/background_devixly_client.dart';

import '../../../../core/network/backend_call.dart';
import '../../domain/entities/admin_profile.dart';
import '../../domain/entities/profile_drafts.dart';

abstract interface class ProfileRemoteDataSource {
  Future<AppUser> getProfile();

  Future<AppUser> updateProfile(AdminProfile profile, ProfileUpdate update);

  Future<void> updatePassword(PasswordChange change);
}

/// Profil zalogowanego administratora (`AccountEndpoint`,
/// `AppUserEndpoint.update`).
class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  ProfileRemoteDataSourceImpl(this._client);

  final Client _client;

  @override
  Future<AppUser> getProfile() => backendCall(_client.account.me);

  /// E-mail i firma zostają bez zmian — formularz ich nie edytuje, a backend
  /// zastępuje przy zapisie wszystkie pola profilu. Odpowiedź zapisu nie
  /// zawiera firmy, więc profil jest potem czytany ponownie.
  @override
  Future<AppUser> updateProfile(AdminProfile profile, ProfileUpdate update) =>
      backendCall(() async {
        await _client.appUser.update(
          profile.id,
          AppUserInput(
            email: profile.email,
            companyId: profile.companyId == 0 ? null : profile.companyId,
            lastName: update.lastName,
            firstName: update.firstName,
            phoneNumber: update.phoneNumber,
          ),
        );
        return _client.account.me();
      });

  @override
  Future<void> updatePassword(PasswordChange change) => backendCall(
    () => _client.account.changePassword(
      oldPassword: change.oldPassword,
      newPassword: change.newPassword,
    ),
  );
}
