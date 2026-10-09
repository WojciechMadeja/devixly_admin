import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failures.dart';
import '../entities/unit_draft.dart';

/// Zapis jednostek. Backend nie ma jeszcze takiego endpointu, więc
/// interfejs celowo nie ma implementacji ani wpisu w `injection.dart` —
/// patrz [AddUnitView](../../presentation/view/add_unit_view.dart).
abstract interface class UnitsRepository {
  Future<Either<Failure, Unit>> addUnit(UnitDraft draft);
}
