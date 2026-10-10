import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failures.dart';
import '../entities/project_draft.dart';
import '../entities/project_option.dart';

abstract interface class ProjectsRepository {
  Future<Either<Failure, Unit>> addProject(ProjectDraft draft);

  /// Lekka lista projektów do wyboru (id, numer i nazwa).
  Future<Either<Failure, List<ProjectOption>>> getProjectOptions();
}
