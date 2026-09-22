/// Wyjątki warstwy danych. Nie wychodzą poza repozytoria — tam są mapowane
/// na `Failure`.
sealed class AppException implements Exception {
  const AppException([this.message]);

  /// Komunikat z backendu (pole `message` odpowiedzi Xano), jeśli był.
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
