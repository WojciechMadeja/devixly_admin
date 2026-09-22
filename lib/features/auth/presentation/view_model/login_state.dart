import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/errors/failures.dart';

part 'login_state.freezed.dart';

@freezed
sealed class LoginState with _$LoginState {
  const factory LoginState.initial() = LoginInitial;

  /// Nie wypełniono e-maila lub hasła.
  const factory LoginState.emptyFields() = LoginEmptyFields;

  const factory LoginState.invalidEmail() = LoginInvalidEmail;

  const factory LoginState.submitting() = LoginSubmitting;

  const factory LoginState.success() = LoginSuccess;

  const factory LoginState.failure(Failure failure) = LoginFailure;
}
