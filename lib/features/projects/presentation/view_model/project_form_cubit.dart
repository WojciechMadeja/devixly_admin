import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/state/loadable.dart';
import '../../../../core/state/submission_status.dart';
import '../../../lookups/domain/entities/dictionary_item.dart';
import '../../../lookups/domain/repositories/lookups_repository.dart';
import '../../domain/entities/project_draft.dart';
import '../../domain/repositories/projects_repository.dart';
import 'project_form_state.dart';

/// Dodawanie projektu: słowniki dzielnic i deweloperów oraz zapis.
class ProjectFormCubit extends Cubit<ProjectFormState> {
  ProjectFormCubit(this._projects, this._lookups)
    : super(const ProjectFormState());

  final ProjectsRepository _projects;
  final LookupsRepository _lookups;

  Future<void> loadLookups() async {
    final (districts, developers) = await (
      _lookups.getDistricts(),
      _lookups.getDevelopers(),
    ).wait;
    if (isClosed) return;
    emit(
      state.copyWith(
        districts: districts.match(Loadable.error, Loadable.loaded),
        developers: developers.match(Loadable.error, Loadable.loaded),
      ),
    );
  }

  void selectDistrict(DictionaryItem district) =>
      emit(state.copyWith(district: district));

  void selectDeveloper(DictionaryItem developer) =>
      emit(state.copyWith(developer: developer));

  void setHandover(DateTime? date) => emit(state.copyWith(handover: date));

  void setStartOfSales(DateTime? date) =>
      emit(state.copyWith(startOfSales: date));

  void setOwnership(ProjectOwnership? ownership) =>
      emit(state.copyWith(ownership: ownership));

  void setSaleTypes({bool? developer, bool? resale}) => emit(
    state.copyWith(
      saleTypesDeveloper: developer ?? state.saleTypesDeveloper,
      saleTypesResale: resale ?? state.saleTypesResale,
    ),
  );

  Future<void> submit({
    required String name,
    required String externalId,
    required String noc,
    required String status,
    required String descriptionPl,
    required String descriptionEn,
    required String priceFrom,
    required String priceTo,
    required String areaFrom,
    required String areaTo,
  }) async {
    if (state.submission is Submitting) return;
    final id = int.tryParse(externalId.trim());
    final nocValue = double.tryParse(noc.trim().replaceAll(',', '.'));
    if (name.trim().isEmpty || id == null || nocValue == null) {
      _finish(const SubmissionStatus.failure(ValidationFailure()));
      return;
    }
    emit(state.copyWith(submission: const SubmissionStatus.submitting()));
    final result = await _projects.addProject(
      ProjectDraft(
        externalId: id,
        name: name.trim(),
        noc: nocValue,
        saleTypesDeveloper: state.saleTypesDeveloper,
        saleTypesResale: state.saleTypesResale,
        districtId: state.district?.id,
        developerId: state.developer?.id,
        status: _orNull(status),
        descriptionPl: _orNull(descriptionPl),
        descriptionEn: _orNull(descriptionEn),
        priceFrom: int.tryParse(priceFrom.trim()),
        priceTo: int.tryParse(priceTo.trim()),
        areaFrom: int.tryParse(areaFrom.trim()),
        areaTo: int.tryParse(areaTo.trim()),
        handover: state.handover,
        startOfSales: state.startOfSales,
        ownership: state.ownership,
      ),
    );
    if (isClosed) return;
    result.match((failure) => _finish(SubmissionStatus.failure(failure)), (_) {
      emit(
        state.copyWith(
          district: null,
          developer: null,
          handover: null,
          startOfSales: null,
          ownership: null,
        ),
      );
      _finish(const SubmissionStatus.success());
    });
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
