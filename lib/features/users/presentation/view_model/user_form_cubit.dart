import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/state/loadable.dart';
import '../../../../core/state/submission_status.dart';
import '../../../companies/domain/entities/company.dart';
import '../../../companies/domain/repositories/companies_repository.dart';
import '../../domain/entities/user_drafts.dart';
import '../../domain/repositories/users_repository.dart';
import 'user_form_state.dart';

/// Dodawanie użytkownika przypisanego do firmy.
class UserFormCubit extends Cubit<UserFormState> {
  UserFormCubit(this._users, this._companies) : super(const UserFormState());

  final UsersRepository _users;
  final CompaniesRepository _companies;

  Future<void> loadCompanies() async {
    final result = await _companies.getCompanies();
    if (isClosed) return;
    emit(
      state.copyWith(
        companies: result.match(Loadable.error, Loadable.loaded),
      ),
    );
  }

  void selectCompany(Company company) =>
      emit(state.copyWith(selectedCompany: company));

  Future<void> submit({
    required String email,
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String password,
  }) async {
    if (state.submission is Submitting) return;
    final company = state.selectedCompany;
    if (email.trim().isEmpty ||
        firstName.trim().isEmpty ||
        lastName.trim().isEmpty ||
        phoneNumber.trim().isEmpty ||
        password.isEmpty ||
        company == null) {
      _finish(const SubmissionStatus.failure(ValidationFailure()));
      return;
    }
    emit(state.copyWith(submission: const SubmissionStatus.submitting()));
    final result = await _users.addUser(
      NewUser(
        email: email.trim(),
        firstName: firstName.trim(),
        lastName: lastName.trim(),
        phoneNumber: phoneNumber.trim(),
        password: password,
        companyId: company.id,
      ),
    );
    if (isClosed) return;
    result.match(
      (failure) => _finish(SubmissionStatus.failure(failure)),
      (_) {
        emit(state.copyWith(selectedCompany: null));
        _finish(const SubmissionStatus.success());
      },
    );
  }

  /// Zgłasza wynik zapisu i wraca do stanu `idle`, żeby ten sam komunikat
  /// mógł pojawić się przy kolejnej próbie.
  void _finish(SubmissionStatus result) {
    emit(state.copyWith(submission: result));
    emit(state.copyWith(submission: const SubmissionStatus.idle()));
  }
}
