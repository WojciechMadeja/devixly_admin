import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failures.dart';
import '../entities/managed_user.dart';
import '../entities/user_drafts.dart';

abstract interface class UsersRepository {
  Future<Either<Failure, List<ManagedUser>>> getUsers();

  /// Zakłada konto; zwraca adresy, na które backend nie zdołał wysłać
  /// wygenerowanego hasła (puste, gdy hasło podał administrator).
  Future<Either<Failure, List<String>>> addUser(NewUser user);

  Future<Either<Failure, ManagedUser>> updateUser(
    ManagedUser user,
    UserUpdate update,
  );

  Future<Either<Failure, ManagedUser>> setBlocked(
    ManagedUser user,
    bool blocked,
  );

  Future<Either<Failure, Unit>> deleteUser(int id);

  /// Zbiorcze zakładanie kont z pliku CSV. Zwraca adresy, na które backend
  /// nie zdołał wysłać wygenerowanego hasła.
  Future<Either<Failure, List<String>>> importUsers({
    required List<CsvUser> users,
    required int companyId,
  });
}
