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

  /// Lista do wyboru zmienia się rzadko, a jest potrzebna przy każdym
  /// wejściu na formularz jednostki — pobieramy ją raz na uruchomienie
  /// panelu i odświeżamy po dodaniu projektu.
  List<ProjectOption>? _options;

  @override
  Future<Either<Failure, Unit>> addProject(ProjectDraft draft) =>
      guard(() async {
        await _remote.addProject(draft);
        _options = null;
        return unit;
      });

  @override
  Future<Either<Failure, List<ProjectOption>>> getProjectOptions() =>
      guard(() async {
        return _options ??= [
          for (final option in await _remote.getProjectOptions())
            option.toEntity(),
        ];
      });
}
