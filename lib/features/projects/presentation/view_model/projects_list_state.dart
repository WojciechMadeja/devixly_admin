import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/state/loadable.dart';
import '../../domain/entities/project_summary.dart';

part 'projects_list_state.freezed.dart';

/// Stan listy projektów: wyniki i tekst, którego szukamy.
@freezed
abstract class ProjectsListState with _$ProjectsListState {
  const factory ProjectsListState({
    @Default(Loadable<List<ProjectSummary>>.loading())
    Loadable<List<ProjectSummary>> projects,
    @Default('') String search,
  }) = _ProjectsListState;
}
