import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failures.dart';
import '../entities/new_admin.dart';

abstract interface class AdminsRepository {
  /// Zakłada konto administratora; zwraca adresy, na które backend nie
  /// zdołał wysłać wygenerowanego hasła.
  Future<Either<Failure, List<String>>> addAdmin(NewAdmin admin);
}
