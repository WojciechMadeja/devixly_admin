import 'package:background_devixly_client/background_devixly_client.dart';

import '../../../../core/network/backend_call.dart';
import '../../domain/entities/new_admin.dart';

abstract interface class AdminsRemoteDataSource {
  Future<void> addAdmin(NewAdmin admin);
}

/// Zakładanie kont administratorów (`AppUserEndpoint.createAdministrator`).
/// Nowy administrator trafia do firmy tego, kto go zakłada.
class AdminsRemoteDataSourceImpl implements AdminsRemoteDataSource {
  AdminsRemoteDataSourceImpl(this._client);

  final Client _client;

  @override
  Future<void> addAdmin(NewAdmin admin) => backendCall(
    () => _client.appUser.createAdministrator(
      NewUserInput(
        email: admin.email,
        firstName: admin.firstName,
        lastName: admin.lastName,
        phoneNumber: admin.phoneNumber,
        password: admin.password,
      ),
    ),
  );
}
