import 'dart:async';

import 'package:background_devixly_client/background_devixly_client.dart';
import 'package:serverpod_auth_idp_client/serverpod_auth_idp_client.dart'
    show
        AuthUserBlockedException,
        EmailAccountLoginException,
        EmailAccountPasswordResetException;

import '../errors/exceptions.dart';

/// Wykonuje wywołanie backendu i zamienia wyjątki klienta Serverpod na
/// wyjątki warstwy danych (`AppException`), które repozytoria mapują na
/// `Failure`.
Future<T> backendCall<T>(Future<T> Function() call) async {
  try {
    return await call();
  } on ServerpodClientUnauthorized {
    throw const UnauthorizedException();
  } on ServerpodClientNetworkException catch (e) {
    throw NetworkException(e.message);
  } on TimeoutException {
    throw const NetworkException('Przekroczono czas oczekiwania.');
  } on ServerpodClientHttpException catch (e) {
    throw ServerException(e.statusCode, e.message);
  } on ServerpodClientException catch (e) {
    throw NetworkException(e.message);
  } on ForbiddenException catch (e) {
    throw ServerException(403, e.message);
  } on EmailAccountLoginException {
    // Błędny e-mail lub hasło (albo zbyt wiele prób).
    throw const ServerException(401, 'Nieprawidłowy e-mail lub hasło.');
  } on AuthUserBlockedException {
    throw const ServerException(403, 'Konto jest zablokowane.');
  } on EmailAccountPasswordResetException catch (e) {
    throw ServerException(400, 'Reset hasła: ${e.reason.name}.');
  } on UserCreationException catch (e) {
    throw ServerException(409, _userCreationMessage(e));
  } on DbAdminException catch (e) {
    throw ServerException(400, e.message);
  } on SerializableException catch (e) {
    // Pozostałe wyjątki endpointów, np. `...NotFoundException`.
    throw ServerException(400, e.toString());
  }
}

String _userCreationMessage(UserCreationException exception) {
  final emails = exception.emails.join(', ');
  return switch (exception.reason) {
    UserCreationErrorReason.emailInUse =>
      'Adres e-mail jest już używany: $emails',
    UserCreationErrorReason.duplicateEmail =>
      'Adres e-mail powtarza się na liście: $emails',
    UserCreationErrorReason.invalidEmail =>
      'Nieprawidłowy adres e-mail: $emails',
    UserCreationErrorReason.companyNotFound => 'Wybrana firma nie istnieje.',
    UserCreationErrorReason.passwordPolicy =>
      'Hasło nie spełnia wymagań (co najmniej 8 znaków): $emails',
  };
}
