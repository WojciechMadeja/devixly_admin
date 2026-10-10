import 'package:background_devixly_client/background_devixly_client.dart';

import '../../../../core/network/backend_call.dart';
import '../../domain/entities/new_admin.dart';

abstract interface class AdminsRemoteDataSource {
  Future<List<String>> addAdmin(NewAdmin admin);
}

/// Zakładanie kont administratorów (`AppUserEndpoint.createAdministrator`).
/// Nowy administrator trafia do firmy tego, kto go zakłada.
class AdminsRemoteDataSourceImpl implements AdminsRemoteDataSource {
  AdminsRemoteDataSourceImpl(this._client);

  final Client _client;

  /// Bez hasła backend wygeneruje je i wyśle administratorowi mailem.
  @override
  Future<List<String>> addAdmin(NewAdmin admin) => backendCall(() async {
    final result = await _client.appUser.createAdministrator(
      NewUserInput(
        email: admin.email,
        firstName: admin.firstName,
        lastName: admin.lastName,
        phoneNumber: admin.phoneNumber,
        password: admin.password,
      ),
    );
    return result.passwordEmailFailed;
  });
}
