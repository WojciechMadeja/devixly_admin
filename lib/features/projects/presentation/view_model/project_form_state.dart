import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/state/loadable.dart';
import '../../../../core/state/submission_status.dart';
import '../../../lookups/domain/entities/dictionary_item.dart';
import '../../domain/entities/project_details.dart';
import '../../domain/entities/project_draft.dart';

part 'project_form_state.freezed.dart';

/// Stan formularza „Dodaj projekt”: słowniki do wyboru, wartości, których
/// nie trzymają kontrolery tekstu (daty, przełączniki, listy) i status
/// zapisu.
@freezed
abstract class ProjectFormState with _$ProjectFormState {
  const factory ProjectFormState({
    /// Edytowany projekt; `null` oznacza dodawanie nowego.
    ProjectDetails? editing,
    @Default(Loadable<List<DictionaryItem>>.loading())
    Loadable<List<DictionaryItem>> districts,
    @Default(Loadable<List<DictionaryItem>>.loading())
    Loadable<List<DictionaryItem>> developers,
    DictionaryItem? district,
    DictionaryItem? developer,
    DateTime? handover,
    DateTime? startOfSales,
    ProjectOwnership? ownership,
    @Default(true) bool saleTypesDeveloper,
    @Default(false) bool saleTypesResale,
    @Default(SubmissionStatus.idle()) SubmissionStatus submission,
  }) = _ProjectFormState;
}
