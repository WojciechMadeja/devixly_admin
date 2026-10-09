import 'dart:async';

import 'package:background_devixly_client/background_devixly_client.dart';
import 'package:serverpod_auth_idp_client/serverpod_auth_idp_client.dart'
    show
        AuthUserBlockedException,
        EmailAccountLoginException,
        EmailAccountPasswordResetException,
        EmailAccountPasswordResetExceptionReason;

import '../errors/exceptions.dart';

/// Wykonuje wywołanie backendu i zamienia wyjątki klienta Serverpod na
/// wyjątki warstwy danych (`AppException`), które repozytoria mapują na
/// `Failure`.
///
/// Komunikat trafia do wyjątku tylko wtedy, gdy backend podał coś, co ma
/// sens dla użytkownika (np. zajęty adres e-mail). Opisy techniczne i
/// angielskie zostają pominięte — widok pokazuje wtedy własny komunikat.
Future<T> backendCall<T>(Future<T> Function() call) async {
  try {
    return await call();
  } on ServerpodClientUnauthorized {
    throw const UnauthorizedException();
  } on ServerpodClientNetworkException {
    throw const NetworkException();
  } on TimeoutException {
    throw const NetworkException();
  } on ServerpodClientHttpException catch (e) {
    throw ServerException(e.statusCode);
  } on ServerpodClientException {
    throw const NetworkException();
  } on ForbiddenException {
    // Backend opisuje brak uprawnień po angielsku; przyczynę rozpoznaje
    // źródło danych tam, gdzie da się ją nazwać (np. logowanie).
    throw const ServerException(403);
  } on EmailAccountLoginException {
    throw const InvalidCredentialsException();
  } on AuthUserBlockedException {
    throw const AccountBlockedException();
  } on EmailAccountPasswordResetException catch (e) {
    if (e.reason == EmailAccountPasswordResetExceptionReason.policyViolation) {
      throw const WeakPasswordException();
    }
    throw const ServerException(400);
  } on UserCreationException catch (e) {
    throw ServerException(409, _userCreationMessage(e));
  } on SerializableException {
    // Pozostałe wyjątki endpointów, np. `...NotFoundException` — nie mają
    // treści dla użytkownika.
    throw const ServerException(400);
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
      'Hasło musi mieć co najmniej 8 znaków: $emails',
  };
}
