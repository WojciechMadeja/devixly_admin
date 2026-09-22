import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/services/media_picker.dart';
import '../../../../core/state/loadable.dart';
import '../../../../core/state/submission_status.dart';
import '../../../companies/domain/entities/company.dart';
import '../../../companies/domain/repositories/companies_repository.dart';
import '../../domain/entities/user_drafts.dart';
import '../../domain/repositories/users_repository.dart';
import '../../domain/usecases/parse_users_csv.dart';
import 'csv_import_state.dart';

/// Import użytkowników z pliku CSV: wczytanie pliku, poprawki w wierszach,
/// wybór firmy i zbiorcze zakładanie kont.
class CsvImportCubit extends Cubit<CsvImportState> {
  CsvImportCubit(this._users, this._companies, this._picker, this._parseCsv)
    : super(const CsvImportState());

  final UsersRepository _users;
  final CompaniesRepository _companies;
  final MediaPicker _picker;
  final ParseUsersCsv _parseCsv;

  Future<void> loadCompanies() async {
    final result = await _companies.getCompanies();
    if (isClosed) return;
    emit(
      state.copyWith(companies: result.match(Loadable.error, Loadable.loaded)),
    );
  }

  Future<void> pickFile() async {
    final file = await _picker.pickFile(extensions: ['csv']);
    if (file == null || isClosed) return;
    switch (_parseCsv(file.bytes)) {
      case CsvParsed(:final users):
        emit(state.copyWith(users: users));
      case CsvInvalidEmails(:final errors):
        _reportFile(CsvFileStatus.invalidEmails(errors));
      case CsvMissingHeaders(:final required):
        _reportFile(CsvFileStatus.missingHeaders(required));
      case CsvNotRecognized():
        _reportFile(const CsvFileStatus.notRecognized());
    }
  }

  void selectCompany(Company company) =>
      emit(state.copyWith(selectedCompany: company));

  void updateUser(int index, CsvUser user) => emit(
    state.copyWith(
      users: [
        for (var i = 0; i < state.users.length; i++)
          i == index ? user : state.users[i],
      ],
    ),
  );

  void removeUser(int index) => emit(
    state.copyWith(
      users: [
        for (var i = 0; i < state.users.length; i++)
          if (i != index) state.users[i],
      ],
    ),
  );

  /// Sortuje wczytane wiersze po nazwisku (usunięte nie wracają na listę).
  void sortByName({required bool ascending}) => emit(
    state.copyWith(
      users: [...state.users]
        ..sort(
          (a, b) => ascending
              ? a.lastName.compareTo(b.lastName)
              : b.lastName.compareTo(a.lastName),
        ),
    ),
  );

  Future<void> submit() async {
    if (state.submission is Submitting) return;
    final company = state.selectedCompany;
    if (state.users.isEmpty || company == null) {
      _finish(const SubmissionStatus.failure(ValidationFailure()));
      return;
    }
    emit(state.copyWith(submission: const SubmissionStatus.submitting()));
    final result = await _users.importUsers(
      users: state.users,
      companyId: company.id,
    );
    if (isClosed) return;
    result.match((failure) => _finish(SubmissionStatus.failure(failure)), (_) {
      emit(state.copyWith(users: const [], selectedCompany: null));
      _finish(const SubmissionStatus.success());
    });
  }

  void _reportFile(CsvFileStatus status) {
    emit(state.copyWith(fileStatus: status));
    emit(state.copyWith(fileStatus: const CsvFileStatus.idle()));
  }

  void _finish(SubmissionStatus result) {
    emit(state.copyWith(submission: result));
    emit(state.copyWith(submission: const SubmissionStatus.idle()));
  }
}
