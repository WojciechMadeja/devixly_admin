import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/errors/failures.dart';

part 'update_password_state.freezed.dart';

@freezed
sealed class UpdatePasswordState with _$UpdatePasswordState {
  const factory UpdatePasswordState.initial() = UpdatePasswordInitial;

  /// Któreś z pól zostało puste.
  const factory UpdatePasswordState.emptyFields() = UpdatePasswordEmptyFields;

  /// Nowe hasło i jego powtórzenie różnią się.
  const factory UpdatePasswordState.mismatch() = UpdatePasswordMismatch;

  const factory UpdatePasswordState.submitting() = UpdatePasswordSubmitting;

  const factory UpdatePasswordState.success() = UpdatePasswordSuccess;

  const factory UpdatePasswordState.failure(Failure failure) =
      UpdatePasswordFailure;
}
