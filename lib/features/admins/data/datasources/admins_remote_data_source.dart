import '../../../../core/config/api_config.dart';
import '../../../../core/network/authorized_api_client.dart';
import '../../../../core/network/current_admin.dart';
import '../../domain/entities/new_admin.dart';

abstract interface class AdminsRemoteDataSource {
  Future<void> addAdmin(NewAdmin admin);
}

class AdminsRemoteDataSourceImpl implements AdminsRemoteDataSource {
  AdminsRemoteDataSourceImpl(this._client, this._admin);

  final AuthorizedApiClient _client;
  final CurrentAdmin _admin;

  @override
  Future<void> addAdmin(NewAdmin admin) => _client.post(
    '${XanoApiGroup.auth}/auth/admin/signup',
    body: {
      'email': admin.email,
      'first_name': admin.firstName,
      'last_name': admin.lastName,
      'admin_email': _admin.email,
      'phone_number': admin.phoneNumber,
      'password': admin.password,
    },
  );
}
