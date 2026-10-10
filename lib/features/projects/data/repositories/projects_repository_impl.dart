import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/errors/guard.dart';
import '../../domain/entities/project_draft.dart';
import '../../domain/entities/project_option.dart';
import '../../domain/repositories/projects_repository.dart';
import '../datasources/projects_remote_data_source.dart';
import '../models/project_option_mapper.dart';

class ProjectsRepositoryImpl implements ProjectsRepository {
  ProjectsRepositoryImpl(this._remote);

  final ProjectsRemoteDataSource _remote;

  @override
  Future<Either<Failure, Unit>> addProject(ProjectDraft draft) =>
      guard(() async {
        await _remote.addProject(draft);
        return unit;
      });

  @override
  Future<Either<Failure, List<ProjectOption>>> getProjectOptions() => guard(
    () async => [
      for (final option in await _remote.getProjectOptions()) option.toEntity(),
    ],
  );
}
