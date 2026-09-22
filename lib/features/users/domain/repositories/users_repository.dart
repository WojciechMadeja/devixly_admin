import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failures.dart';
import '../entities/managed_user.dart';
import '../entities/user_drafts.dart';

abstract interface class UsersRepository {
  Future<Either<Failure, List<ManagedUser>>> getUsers();

  Future<Either<Failure, Unit>> addUser(NewUser user);

  Future<Either<Failure, ManagedUser>> updateUser(
    ManagedUser user,
    UserUpdate update,
  );

  Future<Either<Failure, ManagedUser>> setBlocked(
    ManagedUser user,
    bool blocked,
  );

  Future<Either<Failure, Unit>> deleteUser(int id);

  /// Zbiorcze zakładanie kont z pliku CSV.
  Future<Either<Failure, Unit>> importUsers({
    required List<CsvUser> users,
    required int companyId,
  });
}
