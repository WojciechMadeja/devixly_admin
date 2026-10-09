import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/errors/guard.dart';
import '../../domain/entities/managed_user.dart';
import '../../domain/entities/user_drafts.dart';
import '../../domain/repositories/users_repository.dart';
import '../datasources/users_remote_data_source.dart';
import '../models/managed_user_mapper.dart';

class UsersRepositoryImpl implements UsersRepository {
  UsersRepositoryImpl(this._remote);

  final UsersRemoteDataSource _remote;

  @override
  Future<Either<Failure, List<ManagedUser>>> getUsers() => guard(
    () async => [
      for (final model in await _remote.getUsers()) model.toEntity(),
    ],
  );

  @override
  Future<Either<Failure, Unit>> addUser(NewUser user) => guard(() async {
    await _remote.addUser(user);
    return unit;
  });

  @override
  Future<Either<Failure, ManagedUser>> updateUser(
    ManagedUser user,
    UserUpdate update,
  ) =>
      guard(() async => (await _remote.updateUser(user.id, update)).toEntity());

  @override
  Future<Either<Failure, ManagedUser>> setBlocked(
    ManagedUser user,
    bool blocked,
  ) => guard(() async {
    await _remote.setBlocked(user.id, blocked);
    return user.copyWith(isBlocked: blocked);
  });

  @override
  Future<Either<Failure, Unit>> deleteUser(int id) => guard(() async {
    await _remote.deleteUser(id);
    return unit;
  });

  @override
  Future<Either<Failure, List<String>>> importUsers({
    required List<CsvUser> users,
    required int companyId,
  }) => guard(() => _remote.importUsers(users: users, companyId: companyId));
}
