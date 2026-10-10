import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/state/loadable.dart';
import '../../../../core/state/submission_status.dart';
import '../../../companies/domain/entities/company.dart';

part 'user_form_state.freezed.dart';

/// Stan formularza „Dodaj użytkownika”: lista firm do wyboru, wybrana firma
/// i status zapisu.
@freezed
abstract class UserFormState with _$UserFormState {
  const factory UserFormState({
    @Default(Loadable<List<Company>>.loading())
    Loadable<List<Company>> companies,
    Company? selectedCompany,
    @Default(SubmissionStatus.idle()) SubmissionStatus submission,

    /// Adresy z ostatniego zapisu, na które nie poszło wygenerowane hasło.
    @Default(<String>[]) List<String> passwordEmailFailed,
  }) = _UserFormState;
}
