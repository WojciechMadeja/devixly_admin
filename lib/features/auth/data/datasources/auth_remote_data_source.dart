import 'package:background_devixly_client/background_devixly_client.dart';
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/network/backend_call.dart';
import '../models/admin_user_model.dart';

abstract interface class AuthRemoteDataSource {
  /// Wczytuje sesję klienta zapisaną przy poprzednim uruchomieniu.
  Future<void> restore();

  /// Czy klient ma sesję (tokeny).
  bool get isSignedIn;

  /// Loguje administratora i zwraca jego dane.
  Future<AdminUserModel> login({
    required String email,
    required String password,
  });

  /// Dane zalogowanego administratora.
  Future<AdminUserModel> currentUser();

  /// Kończy sesję na serwerze i w kliencie.
  Future<void> signOut();

  /// Usuwa sesję z klienta bez pytania serwera (sesja już nieważna).
  Future<void> dropSession();

  /// Wysyła kod do zmiany hasła; zwraca identyfikator prośby.
  Future<String> startPasswordReset(String email);

  Future<void> finishPasswordReset({
    required String requestId,
    required String code,
    required String newPassword,
  });
}

/// Logowanie w backendzie Serverpod (`EmailIdpEndpoint`, `AccountEndpoint`).
/// Do panelu wpuszcza `loginAsAdministrator`: konto bez uprawnień
/// administratora nie dostaje sesji.
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl(this._client);

  final Client _client;

  ClientAuthSessionManager get _auth => _client.auth;

  @override
  Future<void> restore() => _auth.restore();

  @override
  bool get isSignedIn => _auth.isAuthenticated;

  @override
  Future<AdminUserModel> login({
    required String email,
    required String password,
  }) => backendCall(() async {
    final authSuccess = await _loginAsAdministrator(
      email: email,
      password: password,
    );
    await _auth.updateSignedInUser(authSuccess);
    try {
      return AdminUserModel.fromProtocol(await _client.account.me());
    } on Object {
      // Bez danych administratora nie zostawiamy otwartej sesji.
      await _auth.updateSignedInUser(null);
      rethrow;
    }
  });

  /// Backend odrzuca tu konta bez praw administratora — zgłaszamy to jako
  /// osobny powód, bo w jego komunikacie nie ma nic po polsku.
  Future<AuthSuccess> _loginAsAdministrator({
    required String email,
    required String password,
  }) async {
    try {
      return await _client.emailIdp.loginAsAdministrator(
        email: email,
        password: password,
      );
    } on ForbiddenException {
      throw const NotAnAdministratorException();
    }
  }

  @override
  Future<AdminUserModel> currentUser() => backendCall(
    () async => AdminUserModel.fromProtocol(await _client.account.me()),
  );

  @override
  Future<void> signOut() => backendCall(_auth.signOutDevice);

  @override
  Future<void> dropSession() => _auth.updateSignedInUser(null);

  @override
  Future<String> startPasswordReset(String email) => backendCall(
    () async => (await _client.emailIdp.startPasswordReset(email: email)).uuid,
  );

  @override
  Future<void> finishPasswordReset({
    required String requestId,
    required String code,
    required String newPassword,
  }) => backendCall(() async {
    final token = await _client.emailIdp.verifyPasswordResetCode(
      passwordResetRequestId: UuidValue.fromString(requestId),
      verificationCode: code,
    );
    await _client.emailIdp.finishPasswordReset(
      finishPasswordResetToken: token,
      newPassword: newPassword,
    );
  });
}
