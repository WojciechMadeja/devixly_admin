import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failures.dart';
import '../entities/company.dart';
import '../entities/company_draft.dart';

abstract interface class CompaniesRepository {
  Future<Either<Failure, List<Company>>> getCompanies();

  Future<Either<Failure, Company>> addCompany(CompanyDraft draft);

  /// Zwraca firmę z zapisanymi danymi z [draft].
  Future<Either<Failure, Company>> updateCompany(
    Company company,
    CompanyDraft draft,
  );

  /// Blokuje lub odblokowuje firmę wraz z jej agentami.
  Future<Either<Failure, Company>> setBlocked(Company company, bool blocked);

  Future<Either<Failure, Unit>> deleteCompany(int id);
}
