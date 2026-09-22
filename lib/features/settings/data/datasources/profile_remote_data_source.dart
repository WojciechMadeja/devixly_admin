import '../../../../core/config/api_config.dart';
import '../../../../core/network/authorized_api_client.dart';
import '../../../../core/network/current_admin.dart';
import '../../../../core/network/json_body.dart';
import '../../domain/entities/admin_profile.dart';
import '../../domain/entities/profile_drafts.dart';
import '../models/admin_profile_model.dart';

abstract interface class ProfileRemoteDataSource {
  Future<AdminProfileModel> getProfile();

  Future<AdminProfileModel> updateProfile(
    AdminProfile profile,
    ProfileUpdate update,
  );

  Future<void> updatePassword(PasswordChange change);
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  ProfileRemoteDataSourceImpl(this._client, this._admin);

  final AuthorizedApiClient _client;
  final CurrentAdmin _admin;

  static const _users = '${XanoApiGroup.users}/user';

  @override
  Future<AdminProfileModel> getProfile() async {
    final json = await _client.get('$_users/${_admin.id}');
    return AdminProfileModel.fromJson(json.asJsonObject());
  }

  @override
  Future<AdminProfileModel> updateProfile(
    AdminProfile profile,
    ProfileUpdate update,
  ) async {
    final json = await _client.put(
      '$_users/${profile.id}',
      body: {
        'admin_email': _admin.email,
        'email': profile.email,
        // Zapisujemy firmę administratora; wersja FlutterFlow wysyłała tu na
        // sztywno `1`, przez co konto trafiało do przypadkowej firmy.
        'companies': profile.companyId,
        'last_name': update.lastName,
        'first_name': update.firstName,
        'phone_number': update.phoneNumber,
      },
    );
    return AdminProfileModel.fromJson(json.asJsonObject());
  }

  @override
  Future<void> updatePassword(PasswordChange change) => _client.patch(
        '$_users/update_password/${_admin.id}',
        body: {
          'old_password': change.oldPassword,
          'new_password': change.newPassword,
        },
      );
}
