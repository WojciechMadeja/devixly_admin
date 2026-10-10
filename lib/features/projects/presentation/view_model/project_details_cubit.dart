import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/state/loadable.dart';
import '../../../units/domain/repositories/units_repository.dart';
import '../../domain/repositories/projects_repository.dart';
import 'project_details_state.dart';

/// Podgląd projektu: dane z planami płatności i lista jednostek.
class ProjectDetailsCubit extends Cubit<ProjectDetailsState> {
  ProjectDetailsCubit(this._projects, this._units)
    : super(const ProjectDetailsState());

  final ProjectsRepository _projects;
  final UnitsRepository _units;

  Future<void> load(int projectId) async {
    final (details, units) = await (
      _projects.getProject(projectId),
      _units.getUnits(projectId),
    ).wait;
    if (isClosed) return;
    emit(
      state.copyWith(
        details: details.match(Loadable.error, Loadable.loaded),
        units: units.match(Loadable.error, Loadable.loaded),
      ),
    );
  }
}
