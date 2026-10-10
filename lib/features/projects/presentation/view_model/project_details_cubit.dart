import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failures.dart';

import '../../../../core/state/loadable.dart';
import '../../../lookups/domain/repositories/lookups_repository.dart';
import '../../../units/domain/entities/unit_draft.dart';
import '../../../units/domain/repositories/units_repository.dart';
import '../../domain/entities/payment_plan_drafts.dart';
import '../../domain/repositories/projects_repository.dart';
import 'project_details_state.dart';

/// Podgląd projektu: dane z planami płatności i lista jednostek.
class ProjectDetailsCubit extends Cubit<ProjectDetailsState> {
  ProjectDetailsCubit(this._projects, this._units, this._lookups)
    : super(const ProjectDetailsState());

  final ProjectsRepository _projects;
  final UnitsRepository _units;
  final LookupsRepository _lookups;

  int? _projectId;

  Future<void> load(int projectId) async {
    _projectId = projectId;
    final (details, units, unitTypes, layouts) = await (
      _projects.getProject(projectId),
      _units.getUnits(projectId),
      // Słowniki są potrzebne dopiero w edycji jednostki, ale pobieramy
      // je razem, żeby dialog otwierał się od razu.
      _lookups.getUnitTypes(),
      _lookups.getLayouts(),
    ).wait;
    if (isClosed) return;
    emit(
      state.copyWith(
        details: details.match(Loadable.error, Loadable.loaded),
        units: units.match(Loadable.error, Loadable.loaded),
        unitTypes: unitTypes.getOrElse((_) => const []),
        layouts: layouts.getOrElse((_) => const []),
      ),
    );
  }

  /// Dodaje plan płatności; zwraca, czy się udało.
  Future<bool> addPaymentPlan(PaymentPlanDraft draft) =>
      _afterChange(_projects.addPaymentPlan(draft));

  Future<bool> deletePaymentPlan(int id) =>
      _afterChange(_projects.deletePaymentPlan(id));

  Future<bool> addPaymentItem(PaymentItemDraft draft) =>
      _afterChange(_projects.addPaymentItem(draft));

  Future<bool> deletePaymentItem(int id) =>
      _afterChange(_projects.deletePaymentItem(id));

  /// Po zmianie w planach czytamy projekt od nowa — plany i raty
  /// przychodzą razem z nim.
  Future<bool> _afterChange(Future<Either<Failure, Unit>> change) async {
    final result = await change;
    if (isClosed) return false;
    return result.match((_) => false, (_) {
      unawaited(_reloadDetails());
      return true;
    });
  }

  Future<void> _reloadDetails() async {
    final projectId = _projectId;
    if (projectId == null) return;
    final result = await _projects.getProject(projectId);
    if (isClosed) return;
    result.match((_) {}, (details) {
      emit(state.copyWith(details: Loadable.loaded(details)));
    });
  }

  /// Zapisuje zmiany jednostki; zwraca, czy się udało.
  Future<bool> updateUnit(int id, UnitDraft draft) async {
    final result = await _units.updateUnit(id, draft);
    if (isClosed) return false;
    return result.match((_) => false, (_) {
      unawaited(_reloadUnits());
      return true;
    });
  }

  /// Usuwa jednostkę; zwraca, czy się udało.
  Future<bool> deleteUnit(int id) async {
    final result = await _units.deleteUnit(id);
    if (isClosed) return false;
    return result.match((_) => false, (_) {
      if (state.units case Loaded(:final value)) {
        emit(
          state.copyWith(
            units: Loadable.loaded([
              for (final unit in value)
                if (unit.id != id) unit,
            ]),
          ),
        );
      }
      return true;
    });
  }

  /// Po zapisie czytamy listę od nowa — bez migania szkieletem.
  Future<void> _reloadUnits() async {
    final projectId = _projectId;
    if (projectId == null) return;
    final result = await _units.getUnits(projectId);
    if (isClosed) return;
    result.match((_) {}, (units) {
      emit(state.copyWith(units: Loadable.loaded(units)));
    });
  }
}
