import 'package:background_devixly_client/background_devixly_client.dart'
    show ProjectNotFoundException;
import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/errors/guard.dart';
import '../../domain/entities/payment_plan_drafts.dart';
import '../../domain/entities/project_details.dart';
import '../../domain/entities/project_draft.dart';
import '../../domain/entities/project_option.dart';
import '../../domain/entities/project_summary.dart';
import '../../domain/repositories/projects_repository.dart';
import '../datasources/projects_remote_data_source.dart';
import '../models/project_mapper.dart';
import '../models/project_option_mapper.dart';

class ProjectsRepositoryImpl implements ProjectsRepository {
  ProjectsRepositoryImpl(this._remote);

  final ProjectsRemoteDataSource _remote;

  /// Lista do wyboru zmienia się rzadko, a jest potrzebna przy każdym
  /// wejściu na formularz jednostki — pobieramy ją raz na uruchomienie
  /// panelu i odświeżamy po dodaniu projektu.
  List<ProjectOption>? _options;

  @override
  Future<Either<Failure, Unit>> updateProject(int id, ProjectDraft draft) =>
      guard(() async {
        await _remote.updateProject(id, draft);
        _options = null;
        return unit;
      });

  @override
  Future<Either<Failure, Unit>> deleteProject(int id) => guard(() async {
    await _remote.deleteProject(id);
    _options = null;
    return unit;
  });

  @override
  Future<Either<Failure, List<ProjectSummary>>> getProjects({String? search}) =>
      guard(
        () async => [
          for (final project in await _remote.getProjects(search: search))
            project.toSummary(),
        ],
      );

  @override
  Future<Either<Failure, Unit>> addPaymentPlan(PaymentPlanDraft draft) =>
      guard(() async {
        await _remote.addPaymentPlan(draft);
        return unit;
      });

  @override
  Future<Either<Failure, Unit>> deletePaymentPlan(int id) => guard(() async {
    await _remote.deletePaymentPlan(id);
    return unit;
  });

  @override
  Future<Either<Failure, Unit>> addPaymentItem(PaymentItemDraft draft) =>
      guard(() async {
        await _remote.addPaymentItem(draft);
        return unit;
      });

  @override
  Future<Either<Failure, Unit>> deletePaymentItem(int id) => guard(() async {
    await _remote.deletePaymentItem(id);
    return unit;
  });

  @override
  Future<Either<Failure, ProjectDetails>> getProject(int id) => guard(() async {
    final project = await _remote.getProject(id);
    if (project == null) throw ProjectNotFoundException(id: id);
    return project.toDetails();
  });

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
