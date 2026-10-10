import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/state/loadable.dart';
import '../../domain/repositories/projects_repository.dart';
import 'projects_list_state.dart';

/// Lista projektów z wyszukiwaniem po stronie backendu.
class ProjectsListCubit extends Cubit<ProjectsListState> {
  ProjectsListCubit(this._projects) : super(const ProjectsListState());

  final ProjectsRepository _projects;

  /// Backend pyta bazę przy każdej zmianie tekstu, więc czekamy, aż
  /// użytkownik przestanie pisać.
  static const _searchDelay = Duration(milliseconds: 300);
  Timer? _debounce;

  Future<void> load() async {
    final search = state.search;
    final result = await _projects.getProjects(search: search);
    if (isClosed || state.search != search) return;
    emit(
      state.copyWith(projects: result.match(Loadable.error, Loadable.loaded)),
    );
  }

  /// Usuwa projekt i zdejmuje go z listy; zwraca, czy się udało.
  Future<bool> delete(int id) async {
    final result = await _projects.deleteProject(id);
    if (isClosed) return false;
    return result.match((_) => false, (_) {
      if (state.projects case Loaded(:final value)) {
        emit(
          state.copyWith(
            projects: Loadable.loaded([
              for (final project in value)
                if (project.id != id) project,
            ]),
          ),
        );
      }
      return true;
    });
  }

  void search(String text) {
    emit(state.copyWith(search: text, projects: const Loadable.loading()));
    _debounce?.cancel();
    _debounce = Timer(_searchDelay, load);
  }

  @override
  Future<void> close() {
    _debounce?.cancel();
    return super.close();
  }
}
