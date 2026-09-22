import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/validators.dart';
import '../../domain/repositories/auth_repository.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._auth) : super(const LoginState.initial());

  final AuthRepository _auth;

  Future<void> submit({required String email, required String password}) async {
    if (state is LoginSubmitting) return;
    // Każda próba zaczyna od stanu początkowego, żeby ten sam komunikat
    // (np. o pustych polach) pokazał się przy kolejnym kliknięciu.
    if (state is! LoginInitial) emit(const LoginState.initial());
    if (email.isEmpty || password.isEmpty) {
      emit(const LoginState.emptyFields());
      return;
    }
    if (!Validators.isValidEmail(email)) {
      emit(const LoginState.invalidEmail());
      return;
    }
    emit(const LoginState.submitting());
    final result = await _auth.login(email: email.trim(), password: password);
    if (isClosed) return;
    emit(
      result.match(
        LoginState.failure,
        (_) => const LoginState.success(),
      ),
    );
  }
}
