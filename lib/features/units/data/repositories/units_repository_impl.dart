import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/errors/guard.dart';
import '../../domain/entities/unit_draft.dart';
import '../../domain/repositories/units_repository.dart';
import '../datasources/units_remote_data_source.dart';

class UnitsRepositoryImpl implements UnitsRepository {
  UnitsRepositoryImpl(this._remote);

  final UnitsRemoteDataSource _remote;

  @override
  Future<Either<Failure, Unit>> addUnit(UnitDraft draft) => guard(() async {
    await _remote.addUnit(draft);
    return unit;
  });
}
