import 'package:equatable/equatable.dart';

/// Błąd zwracany z repozytoriów (`Either<Failure, T>`); cubity mapują go na
/// stan błędu, a widoki na komunikat dla użytkownika.
sealed class Failure extends Equatable {
  const Failure([this.message]);

  /// Komunikat z backendu, jeśli był dostępny.
  final String? message;

  @override
  List<Object?> get props => [message];
}

final class ServerFailure extends Failure {
  const ServerFailure({this.statusCode, String? message}) : super(message);

  final int? statusCode;

  @override
  List<Object?> get props => [statusCode, message];
}

final class NetworkFailure extends Failure {
  const NetworkFailure([super.message]);
}

final class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure([super.message]);
}

/// Błąd danych wejściowych wykryty po stronie aplikacji (np. zły plik CSV).
final class ValidationFailure extends Failure {
  const ValidationFailure([super.message]);
}
