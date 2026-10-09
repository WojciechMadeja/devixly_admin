import 'package:equatable/equatable.dart';

/// Błąd zwracany z repozytoriów (`Either<Failure, T>`); cubity mapują go na
/// stan błędu, a widoki na komunikat dla użytkownika.
sealed class Failure extends Equatable {
  const Failure([this.message]);

  /// Komunikat gotowy do pokazania użytkownikowi (po polsku), jeśli backend
  /// podał coś konkretnego — np. który adres e-mail jest zajęty. Gdy jest
  /// `null`, widok pokazuje własny, ogólny komunikat.
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

/// Logowanie odrzucone: zły e-mail, złe hasło albo za dużo prób.
final class InvalidCredentialsFailure extends Failure {
  const InvalidCredentialsFailure();
}

/// Konto istnieje, ale nie ma praw administratora — do panelu nie wejdzie.
final class NotAnAdministratorFailure extends Failure {
  const NotAnAdministratorFailure();
}

/// Konto jest zablokowane.
final class AccountBlockedFailure extends Failure {
  const AccountBlockedFailure();
}

/// Hasło nie spełnia wymagań (co najmniej 8 znaków, bez spacji na brzegach).
final class WeakPasswordFailure extends Failure {
  const WeakPasswordFailure();
}
