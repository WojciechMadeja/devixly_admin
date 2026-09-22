import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failures.dart';
import '../../domain/entities/company.dart';
import '../../domain/entities/company_draft.dart';
import '../../domain/repositories/companies_repository.dart';
import 'companies_state.dart';

/// Lista firm z zaznaczaniem, edycją, blokowaniem i usuwaniem. Operacje
/// zwracają, czy się udały (dialogi zamykają się tylko przy sukcesie).
class CompaniesCubit extends Cubit<CompaniesState> {
  CompaniesCubit(this._repository) : super(const CompaniesState.loading());

  final CompaniesRepository _repository;

  Future<void> load() async {
    emit(const CompaniesState.loading());
    final result = await _repository.getCompanies();
    if (isClosed) return;
    emit(
      result.match(
        CompaniesState.error,
        (companies) => CompaniesState.loaded(companies: companies),
      ),
    );
  }

  void select(int id) => _updateLoaded((s) => s.copyWith(selectedId: id));

  void clearSelection() => _updateLoaded((s) => s.copyWith(selectedId: null));

  /// Dopisuje nowo dodaną firmę na koniec listy.
  void add(Company company) =>
      _updateLoaded((s) => s.copyWith(companies: [...s.companies, company]));

  Future<bool> update(Company company, CompanyDraft draft) =>
      _replaceWith(_repository.updateCompany(company, draft));

  Future<bool> setBlocked(Company company, bool blocked) =>
      _replaceWith(_repository.setBlocked(company, blocked));

  Future<bool> delete(Company company) async {
    final result = await _repository.deleteCompany(company.id);
    return result.match((_) => false, (_) {
      _updateLoaded(
        (s) => s.copyWith(
          companies: [
            for (final c in s.companies)
              if (c.id != company.id) c,
          ],
          selectedId: null,
        ),
      );
      return true;
    });
  }

  Future<bool> _replaceWith(Future<Either<Failure, Company>> pending) async {
    final result = await pending;
    return result.match((_) => false, (updated) {
      _updateLoaded(
        (s) => s.copyWith(
          companies: [
            for (final c in s.companies) c.id == updated.id ? updated : c,
          ],
        ),
      );
      return true;
    });
  }

  void _updateLoaded(CompaniesLoaded Function(CompaniesLoaded) update) {
    final current = state;
    if (current is CompaniesLoaded && !isClosed) emit(update(current));
  }
}
