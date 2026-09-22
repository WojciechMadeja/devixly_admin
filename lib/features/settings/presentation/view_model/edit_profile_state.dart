import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/state/loadable.dart';
import '../../../../core/state/submission_status.dart';
import '../../../auth/domain/entities/admin_user.dart';
import '../../domain/entities/admin_profile.dart';

part 'edit_profile_state.freezed.dart';

/// Stan ekranu „Zmień swoje dane osobowe”: dane z sesji (wypełniają pola od
/// razu po wejściu), pobrane dane konta (potrzebne do zapisania właściwej
/// firmy) i status zapisu.
@freezed
abstract class EditProfileState with _$EditProfileState {
  const factory EditProfileState({
    AdminUser? user,
    @Default(Loadable<AdminProfile>.loading()) Loadable<AdminProfile> profile,
    @Default(SubmissionStatus.idle()) SubmissionStatus submission,
  }) = _EditProfileState;
}
