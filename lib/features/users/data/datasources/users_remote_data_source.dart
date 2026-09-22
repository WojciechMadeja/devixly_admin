import '../../../../core/config/api_config.dart';
import '../../../../core/network/authorized_api_client.dart';
import '../../../../core/network/current_admin.dart';
import '../../../../core/network/json_body.dart';
import '../../domain/entities/user_drafts.dart';
import '../models/managed_user_model.dart';

abstract interface class UsersRemoteDataSource {
  Future<List<ManagedUserModel>> getUsers();

  Future<void> addUser(NewUser user);

  Future<ManagedUserModel> updateUser(int id, UserUpdate update);

  Future<void> setBlocked(int id, bool blocked);

  Future<void> deleteUser(int id);

  Future<void> importUsers({
    required List<CsvUser> users,
    required int companyId,
  });
}

class UsersRemoteDataSourceImpl implements UsersRemoteDataSource {
  UsersRemoteDataSourceImpl(this._client, this._admin);

  final AuthorizedApiClient _client;
  final CurrentAdmin _admin;

  static const _users = '${XanoApiGroup.users}/user';
  static const _auth = '${XanoApiGroup.auth}/auth';

  @override
  Future<List<ManagedUserModel>> getUsers() async {
    final json = await _client.get(_users, query: {'email': _admin.email});
    return json.asJsonList().map(ManagedUserModel.fromJson).toList();
  }

  @override
  Future<void> addUser(NewUser user) => _client.post(
        '$_auth/signup',
        body: {
          'email': user.email,
          'first_name': user.firstName,
          'last_name': user.lastName,
          'company_id': user.companyId,
          'phone_number': user.phoneNumber,
          'admin_email': _admin.email,
          'password': user.password,
        },
      );

  @override
  Future<ManagedUserModel> updateUser(int id, UserUpdate update) async {
    final json = await _client.put(
      '$_users/$id',
      body: {
        'admin_email': _admin.email,
        'email': update.email,
        'companies': update.companyId,
        'last_name': update.lastName,
        'first_name': update.firstName,
        'phone_number': update.phoneNumber,
      },
    );
    return ManagedUserModel.fromJson(json.asJsonObject());
  }

  @override
  Future<void> setBlocked(int id, bool blocked) => _client.patch(
        '$_users/block/$id',
        body: {'admin_email': _admin.email, 'is_blocked': blocked},
      );

  @override
  Future<void> deleteUser(int id) => _client.delete(
        '$_users/admin/$id',
        query: {'admin_email': _admin.email},
      );

  @override
  Future<void> importUsers({
    required List<CsvUser> users,
    required int companyId,
  }) =>
      _client.post(
        '$_auth/series/signup',
        body: {
          'users': [
            for (final user in users)
              {
                'email': user.email,
                'firstName': user.firstName,
                'lastName': user.lastName,
                'company': companyId,
                'phoneNumber': user.phoneNumber,
              },
          ],
          'admin_email': _admin.email,
        },
      );
}
