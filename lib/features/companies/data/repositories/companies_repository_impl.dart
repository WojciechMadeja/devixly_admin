import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/errors/guard.dart';
import '../../domain/entities/company.dart';
import '../../domain/entities/company_draft.dart';
import '../../domain/repositories/companies_repository.dart';
import '../datasources/companies_remote_data_source.dart';

class CompaniesRepositoryImpl implements CompaniesRepository {
  CompaniesRepositoryImpl(this._remote);

  final CompaniesRemoteDataSource _remote;

  @override
  Future<Either<Failure, List<Company>>> getCompanies() => guard(
    () async => [
      for (final model in await _remote.getCompanies()) model.toEntity(),
    ],
  );

  @override
  Future<Either<Failure, Company>> addCompany(CompanyDraft draft) =>
      guard(() async => (await _remote.addCompany(draft)).toEntity());

  @override
  Future<Either<Failure, Company>> updateCompany(
    Company company,
    CompanyDraft draft,
  ) => guard(() async {
    await _remote.updateCompany(company.id, draft);
    return company.copyWith(draft: draft);
  });

  @override
  Future<Either<Failure, Company>> setBlocked(Company company, bool blocked) =>
      guard(() async {
        await _remote.setBlocked(company.id, blocked);
        return company.copyWith(isBlocked: blocked);
      });

  @override
  Future<Either<Failure, Unit>> deleteCompany(int id) => guard(() async {
    await _remote.deleteCompany(id);
    return unit;
  });
}
