import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/profile_drafts.dart';
import '../../domain/repositories/profile_repository.dart';
import 'update_password_state.dart';

/// Zmiana hasła konta administratora.
class UpdatePasswordCubit extends Cubit<UpdatePasswordState> {
  UpdatePasswordCubit(this._profiles)
      : super(const UpdatePasswordState.initial());

  final ProfileRepository _profiles;

  Future<void> submit({
    required String oldPassword,
    required String newPassword,
    required String repeatedPassword,
  }) async {
    if (state is UpdatePasswordSubmitting) return;
    if (oldPassword.isEmpty ||
        newPassword.isEmpty ||
        repeatedPassword.isEmpty) {
      _finish(const UpdatePasswordState.emptyFields());
      return;
    }
    if (newPassword != repeatedPassword) {
      _finish(const UpdatePasswordState.mismatch());
      return;
    }
    emit(const UpdatePasswordState.submitting());
    final result = await _profiles.updatePassword(
      PasswordChange(oldPassword: oldPassword, newPassword: newPassword),
    );
    if (isClosed) return;
    _finish(
      result.match(
        UpdatePasswordState.failure,
        (_) => const UpdatePasswordState.success(),
      ),
    );
  }

  /// Zgłasza wynik i wraca do stanu początkowego, żeby ten sam komunikat
  /// mógł pojawić się przy kolejnej próbie.
  void _finish(UpdatePasswordState result) {
    emit(result);
    emit(const UpdatePasswordState.initial());
  }
}
