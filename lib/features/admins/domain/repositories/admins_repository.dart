import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failures.dart';
import '../entities/new_admin.dart';

abstract interface class AdminsRepository {
  Future<Either<Failure, Unit>> addAdmin(NewAdmin admin);
}
