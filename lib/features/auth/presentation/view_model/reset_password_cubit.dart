import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/validators.dart';
import '../../domain/repositories/auth_repository.dart';
import 'reset_password_state.dart';

/// Zapomniane hasło w dwóch krokach: wysłanie kodu na e-mail, a potem
/// ustawienie nowego hasła po podaniu kodu.
class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit(this._auth) : super(const ResetPasswordState.initial());

  final AuthRepository _auth;

  /// Krok 1: wysyła kod na [email].
  Future<void> submit(String email) async {
    if (state is ResetPasswordSubmitting) return;
    if (state is! ResetPasswordInitial) {
      emit(const ResetPasswordState.initial());
    }
    if (!Validators.isValidEmail(email)) {
      emit(const ResetPasswordState.invalidEmail());
      return;
    }

    emit(const ResetPasswordState.submitting());
    final result = await _auth.requestPasswordReset(email.trim());
    if (isClosed) return;
    emit(
      result.match(
        (_) => const ResetPasswordState.failed(),
        (requestId) => ResetPasswordState.awaitingCode(requestId: requestId),
      ),
    );
  }

  /// Krok 2: ustawia [newPassword] po podaniu [code] z e-maila.
  Future<void> finish({
    required String code,
    required String newPassword,
    required String repeatedPassword,
  }) async {
    final current = state;
    if (current is! ResetPasswordAwaitingCode || current.submitting) return;
    // Każda próba zaczyna bez błędu, żeby ten sam komunikat pokazał się
    // przy kolejnym kliknięciu.
    final step = ResetPasswordState.awaitingCode(requestId: current.requestId);
    if (current.error != null) emit(step);

    if (code.trim().isEmpty || newPassword.isEmpty) {
      emit(_withError(current, ResetCodeError.emptyFields));
      return;
    }
    if (newPassword != repeatedPassword) {
      emit(_withError(current, ResetCodeError.mismatch));
      return;
    }

    emit(
      ResetPasswordState.awaitingCode(
        requestId: current.requestId,
        submitting: true,
      ),
    );
    final result = await _auth.finishPasswordReset(
      requestId: current.requestId,
      code: code.trim(),
      newPassword: newPassword,
    );
    if (isClosed) return;
    emit(
      result.match(
        (_) => _withError(current, ResetCodeError.rejected),
        (_) => const ResetPasswordState.sent(),
      ),
    );
  }

  static ResetPasswordState _withError(
    ResetPasswordAwaitingCode step,
    ResetCodeError error,
  ) => ResetPasswordState.awaitingCode(requestId: step.requestId, error: error);
}
