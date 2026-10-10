import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failures.dart';
import '../entities/unit_draft.dart';

/// Zapis jednostek dodawanych ręcznie w panelu (`UnitEndpoint.create`).
/// Jednostki z GenieMap wpisuje nocna synchronizacja i tych panel nie
/// dotyka.
abstract interface class UnitsRepository {
  Future<Either<Failure, Unit>> addUnit(UnitDraft draft);
}
