import 'package:freezed_annotation/freezed_annotation.dart';

import '../errors/failures.dart';

part 'submission_status.freezed.dart';

/// Stan wysyłki formularza.
@freezed
sealed class SubmissionStatus with _$SubmissionStatus {
  const factory SubmissionStatus.idle() = SubmissionIdle;

  const factory SubmissionStatus.submitting() = Submitting;

  const factory SubmissionStatus.success() = SubmissionSuccess;

  const factory SubmissionStatus.failure(Failure failure) = SubmissionFailure;
}
