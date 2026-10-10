import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failures.dart';
import '../entities/project_details.dart';
import '../entities/project_draft.dart';
import '../entities/project_option.dart';
import '../entities/project_summary.dart';

abstract interface class ProjectsRepository {
  Future<Either<Failure, Unit>> addProject(ProjectDraft draft);

  /// Zapisuje zmiany projektu, zostawiając pola, których formularz nie
  /// edytuje (zdjęcia, dokumenty, udogodnienia, wykończenia itd.).
  Future<Either<Failure, Unit>> updateProject(int id, ProjectDraft draft);

  Future<Either<Failure, Unit>> deleteProject(int id);

  /// Lekka lista projektów do wyboru (id, numer i nazwa).
  Future<Either<Failure, List<ProjectOption>>> getProjectOptions();

  /// Projekty na listę; [search] szuka po nazwie projektu.
  Future<Either<Failure, List<ProjectSummary>>> getProjects({String? search});

  Future<Either<Failure, ProjectDetails>> getProject(int id);
}
