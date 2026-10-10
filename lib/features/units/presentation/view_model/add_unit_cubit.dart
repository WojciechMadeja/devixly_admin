import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/state/loadable.dart';
import '../../../../core/state/submission_status.dart';
import '../../../lookups/domain/entities/dictionary_item.dart';
import '../../../lookups/domain/repositories/lookups_repository.dart';
import '../../../projects/domain/entities/project_option.dart';
import '../../../projects/domain/repositories/projects_repository.dart';
import '../../domain/entities/unit_draft.dart';
import '../../domain/repositories/units_repository.dart';
import 'add_unit_state.dart';

/// Dodawanie jednostki do projektu: lista projektów do wyszukiwarki,
/// słowniki typu i układu oraz zapis.
class AddUnitCubit extends Cubit<AddUnitState> {
  AddUnitCubit(this._units, this._projects, this._lookups)
    : super(const AddUnitState());

  final UnitsRepository _units;
  final ProjectsRepository _projects;
  final LookupsRepository _lookups;

  Future<void> load() async {
    final (projects, unitTypes, layouts) = await (
      _projects.getProjectOptions(),
      _lookups.getUnitTypes(),
      _lookups.getLayouts(),
    ).wait;
    if (isClosed) return;
    emit(
      state.copyWith(
        projects: projects.match(Loadable.error, Loadable.loaded),
        unitTypes: unitTypes.match(Loadable.error, Loadable.loaded),
        layouts: layouts.match(Loadable.error, Loadable.loaded),
      ),
    );
  }

  void selectProject(ProjectOption project) =>
      emit(state.copyWith(project: project));

  void selectUnitType(DictionaryItem unitType) =>
      emit(state.copyWith(unitType: unitType));

  void selectLayout(DictionaryItem layout) =>
      emit(state.copyWith(layout: layout));

  Future<void> submit({
    required String number,
    required String price,
    required String area,
    required String floor,
    required String status,
    required String height,
    required String typeOfSale,
  }) async {
    if (state.submission is Submitting) return;
    // Jednostka bez projektu nie ma gdzie trafić — backend też jej nie
    // przyjmie.
    final project = state.project;
    if (project == null || number.trim().isEmpty) {
      _finish(const SubmissionStatus.failure(ValidationFailure()));
      return;
    }
    emit(state.copyWith(submission: const SubmissionStatus.submitting()));
    final result = await _units.addUnit(
      UnitDraft(
        projectId: project.id,
        number: number.trim(),
        price: int.tryParse(price.trim()),
        area: double.tryParse(area.trim().replaceAll(',', '.')),
        floor: _orNull(floor),
        status: _orNull(status),
        height: _orNull(height),
        typeOfSale: _orNull(typeOfSale),
        unitTypeId: state.unitType?.id,
        layoutId: state.layout?.id,
      ),
    );
    if (isClosed) return;
    _finish(
      result.match(
        SubmissionStatus.failure,
        (_) => const SubmissionStatus.success(),
      ),
    );
  }

  static String? _orNull(String value) =>
      value.trim().isEmpty ? null : value.trim();

  /// Zgłasza wynik zapisu i wraca do stanu `idle`, żeby ten sam komunikat
  /// mógł pojawić się przy kolejnej próbie.
  void _finish(SubmissionStatus result) {
    emit(state.copyWith(submission: result));
    emit(state.copyWith(submission: const SubmissionStatus.idle()));
  }
}
