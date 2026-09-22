import 'package:freezed_annotation/freezed_annotation.dart';

part 'reset_password_state.freezed.dart';

@freezed
sealed class ResetPasswordState with _$ResetPasswordState {
  const factory ResetPasswordState.initial() = ResetPasswordInitial;

  const factory ResetPasswordState.invalidEmail() = ResetPasswordInvalidEmail;

  const factory ResetPasswordState.submitting() = ResetPasswordSubmitting;

  const factory ResetPasswordState.sent() = ResetPasswordSent;

  const factory ResetPasswordState.failed() = ResetPasswordFailed;
}
