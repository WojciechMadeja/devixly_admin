import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/company_draft.dart';
import '../../domain/repositories/companies_repository.dart';
import 'company_form_state.dart';

/// Dodawanie nowej firmy.
class CompanyFormCubit extends Cubit<CompanyFormState> {
  CompanyFormCubit(this._repository) : super(const CompanyFormState.initial());

  final CompaniesRepository _repository;

  Future<void> submit(CompanyDraft draft) async {
    if (state is CompanyFormSubmitting) return;
    if (state is! CompanyFormInitial) emit(const CompanyFormState.initial());
    if (draft.name.trim().isEmpty) {
      emit(const CompanyFormState.emptyName());
      return;
    }
    emit(const CompanyFormState.submitting());
    final result = await _repository.addCompany(draft);
    if (isClosed) return;
    emit(result.match(CompanyFormState.failure, CompanyFormState.success));
  }
}
