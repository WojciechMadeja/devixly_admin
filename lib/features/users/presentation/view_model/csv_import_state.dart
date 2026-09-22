import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/state/loadable.dart';
import '../../../../core/state/submission_status.dart';
import '../../../companies/domain/entities/company.dart';
import '../../domain/entities/user_drafts.dart';

part 'csv_import_state.freezed.dart';

/// Wynik wczytania pliku — zgłaszany widokowi, który pokazuje dialog.
@freezed
sealed class CsvFileStatus with _$CsvFileStatus {
  const factory CsvFileStatus.idle() = CsvFileIdle;

  const factory CsvFileStatus.notRecognized() = CsvFileNotRecognized;

  const factory CsvFileStatus.missingHeaders(List<String> required) =
      CsvFileMissingHeaders;

  const factory CsvFileStatus.invalidEmails(List<String> errors) =
      CsvFileInvalidEmails;
}

@freezed
abstract class CsvImportState with _$CsvImportState {
  const factory CsvImportState({
    @Default(Loadable<List<Company>>.loading())
    Loadable<List<Company>> companies,
    Company? selectedCompany,
    @Default(<CsvUser>[]) List<CsvUser> users,
    @Default(CsvFileStatus.idle()) CsvFileStatus fileStatus,
    @Default(SubmissionStatus.idle()) SubmissionStatus submission,
  }) = _CsvImportState;
}
