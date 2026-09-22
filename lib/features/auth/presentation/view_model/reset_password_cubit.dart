import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/validators.dart';
import '../../domain/repositories/auth_repository.dart';
import 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit(this._auth) : super(const ResetPasswordState.initial());

  final AuthRepository _auth;

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
      result.isRight()
          ? const ResetPasswordState.sent()
          : const ResetPasswordState.failed(),
    );
  }
}
