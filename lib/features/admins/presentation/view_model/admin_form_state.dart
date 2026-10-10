import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/state/submission_status.dart';

part 'admin_form_state.freezed.dart';

@freezed
abstract class AdminFormState with _$AdminFormState {
  const factory AdminFormState({
    @Default(SubmissionStatus.idle()) SubmissionStatus submission,

    /// Adresy z ostatniego zapisu, na które nie poszło wygenerowane hasło.
    @Default(<String>[]) List<String> passwordEmailFailed,
  }) = _AdminFormState;
}
