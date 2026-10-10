import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/errors/guard.dart';
import '../../domain/entities/new_admin.dart';
import '../../domain/repositories/admins_repository.dart';
import '../datasources/admins_remote_data_source.dart';

class AdminsRepositoryImpl implements AdminsRepository {
  AdminsRepositoryImpl(this._remote);

  final AdminsRemoteDataSource _remote;

  @override
  Future<Either<Failure, List<String>>> addAdmin(NewAdmin admin) =>
      guard(() => _remote.addAdmin(admin));
}
