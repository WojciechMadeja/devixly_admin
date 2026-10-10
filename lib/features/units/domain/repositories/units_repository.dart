import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failures.dart';
import '../entities/project_unit.dart';
import '../entities/unit_draft.dart';

/// Zapis jednostek dodawanych ręcznie w panelu (`UnitEndpoint.create`).
/// Jednostki z GenieMap wpisuje nocna synchronizacja i tych panel nie
/// dotyka.
abstract interface class UnitsRepository {
  Future<Either<Failure, Unit>> addUnit(UnitDraft draft);

  /// Jednostki wybranego projektu, w kolejności z backendu.
  Future<Either<Failure, List<ProjectUnit>>> getUnits(int projectId);
}
