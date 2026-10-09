/// Wyjątki warstwy danych. Nie wychodzą poza repozytoria — tam są mapowane
/// na `Failure`.
sealed class AppException implements Exception {
  const AppException([this.message]);

  /// Komunikat gotowy do pokazania użytkownikowi (po polsku), jeśli backend
  /// podał coś konkretnego — np. który adres e-mail jest zajęty. Techniczne
  /// opisy błędów zostają `null`, a widok pokazuje wtedy własny komunikat.
  final String? message;

  @override
  String toString() => '$runtimeType(${message ?? ''})';
}

/// Backend odpowiedział kodem innym niż 2xx (poza 401).
final class ServerException extends AppException {
  const ServerException(this.statusCode, [super.message]);

  final int statusCode;
}

/// Brak ważnej sesji albo backend odrzucił token (401).
final class UnauthorizedException extends AppException {
  const UnauthorizedException([super.message]);
}

/// Brak połączenia, przekroczony czas oczekiwania itp.
final class NetworkException extends AppException {
  const NetworkException([super.message]);
}

/// Odpowiedź ma inny kształt niż oczekiwany.
final class ParsingException extends AppException {
  const ParsingException([super.message]);
}

/// Logowanie odrzucone: zły e-mail, złe hasło albo za dużo prób.
final class InvalidCredentialsException extends AppException {
  const InvalidCredentialsException();
}

/// Hasło i e-mail są poprawne, ale konto nie ma praw administratora.
final class NotAnAdministratorException extends AppException {
  const NotAnAdministratorException();
}

/// Konto jest zablokowane.
final class AccountBlockedException extends AppException {
  const AccountBlockedException();
}

/// Hasło nie spełnia wymagań backendu (co najmniej 8 znaków, bez spacji
/// na początku i na końcu).
final class WeakPasswordException extends AppException {
  const WeakPasswordException();
}
