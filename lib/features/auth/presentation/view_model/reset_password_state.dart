import 'package:freezed_annotation/freezed_annotation.dart';

part 'reset_password_state.freezed.dart';

/// Dlaczego nie udało się ustawić nowego hasła w drugim kroku.
enum ResetCodeError { emptyFields, mismatch, weakPassword, rejected }

@freezed
sealed class ResetPasswordState with _$ResetPasswordState {
  const factory ResetPasswordState.initial() = ResetPasswordInitial;

  const factory ResetPasswordState.invalidEmail() = ResetPasswordInvalidEmail;

  /// Trwa wysyłanie kodu na e-mail.
  const factory ResetPasswordState.submitting() = ResetPasswordSubmitting;

  /// Kod wysłany — drugi krok: kod z e-maila i nowe hasło. [error] opisuje
  /// ostatnią nieudaną próbę (komunikat pokazywany raz).
  const factory ResetPasswordState.awaitingCode({
    required String requestId,
    @Default(false) bool submitting,
    ResetCodeError? error,
  }) = ResetPasswordAwaitingCode;

  /// Hasło zostało zmienione.
  const factory ResetPasswordState.sent() = ResetPasswordSent;

  /// Nie udało się wysłać kodu.
  const factory ResetPasswordState.failed() = ResetPasswordFailed;
}
