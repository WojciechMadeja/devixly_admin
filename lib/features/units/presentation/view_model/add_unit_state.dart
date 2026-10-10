import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/state/loadable.dart';
import '../../../../core/state/submission_status.dart';
import '../../../lookups/domain/entities/dictionary_item.dart';
import '../../../projects/domain/entities/project_option.dart';

part 'add_unit_state.freezed.dart';

/// Stan formularza „Dodaj jednostkę”: projekty do wyszukania, wybrany
/// projekt, słowniki typu i układu oraz status zapisu.
@freezed
abstract class AddUnitState with _$AddUnitState {
  const factory AddUnitState({
    @Default(Loadable<List<ProjectOption>>.loading())
    Loadable<List<ProjectOption>> projects,
    ProjectOption? project,
    @Default(Loadable<List<DictionaryItem>>.loading())
    Loadable<List<DictionaryItem>> unitTypes,
    @Default(Loadable<List<DictionaryItem>>.loading())
    Loadable<List<DictionaryItem>> layouts,
    DictionaryItem? unitType,
    DictionaryItem? layout,
    @Default(SubmissionStatus.idle()) SubmissionStatus submission,
  }) = _AddUnitState;
}
