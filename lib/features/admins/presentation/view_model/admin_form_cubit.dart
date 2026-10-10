import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/state/submission_status.dart';
import '../../../../core/utils/validators.dart';
import '../../domain/entities/new_admin.dart';
import '../../domain/repositories/admins_repository.dart';
import 'admin_form_state.dart';

/// Dodawanie administratora panelu.
class AdminFormCubit extends Cubit<AdminFormState> {
  AdminFormCubit(this._admins) : super(const AdminFormState());

  final AdminsRepository _admins;

  Future<void> submit({
    required String email,
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String password,
  }) async {
    if (state.submission is Submitting) return;
    if (email.trim().isEmpty ||
        firstName.trim().isEmpty ||
        lastName.trim().isEmpty ||
        phoneNumber.trim().isEmpty) {
      _finish(const SubmissionStatus.failure(ValidationFailure()));
      return;
    }
    // Puste hasło jest w porządku — backend wygeneruje je i wyśle mailem.
    if (password.isNotEmpty && !Validators.isValidPassword(password)) {
      _finish(const SubmissionStatus.failure(WeakPasswordFailure()));
      return;
    }
    emit(state.copyWith(submission: const SubmissionStatus.submitting()));
    final result = await _admins.addAdmin(
      NewAdmin(
        email: email.trim(),
        firstName: firstName.trim(),
        lastName: lastName.trim(),
        phoneNumber: phoneNumber.trim(),
        password: password.isEmpty ? null : password,
      ),
    );
    if (isClosed) return;
    result.match((failure) => _finish(SubmissionStatus.failure(failure)), (
      passwordEmailFailed,
    ) {
      emit(state.copyWith(passwordEmailFailed: passwordEmailFailed));
      _finish(const SubmissionStatus.success());
    });
  }

  void _finish(SubmissionStatus result) {
    emit(state.copyWith(submission: result));
    emit(state.copyWith(submission: const SubmissionStatus.idle()));
  }
}
