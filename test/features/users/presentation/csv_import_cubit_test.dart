import 'package:bloc_test/bloc_test.dart';
import 'package:devixly_admin/core/errors/failures.dart';
import 'package:devixly_admin/core/state/submission_status.dart';
import 'package:devixly_admin/features/companies/domain/entities/company.dart';
import 'package:devixly_admin/features/companies/domain/repositories/companies_repository.dart';
import 'package:devixly_admin/features/users/domain/repositories/users_repository.dart';
import 'package:devixly_admin/features/users/domain/usecases/parse_users_csv.dart';
import 'package:devixly_admin/features/users/presentation/view_model/csv_import_cubit.dart';
import 'package:devixly_admin/features/users/presentation/view_model/csv_import_state.dart';
import 'package:fpdart/fpdart.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../helpers/fake_media_picker.dart';

class _MockUsers extends Mock implements UsersRepository {}

class _MockCompanies extends Mock implements CompaniesRepository {}

void main() {
  const company = Company(id: 2, name: 'Devixly');

  late _MockUsers users;
  late _MockCompanies companies;

  setUp(() {
    users = _MockUsers();
    companies = _MockCompanies();
    when(
      companies.getCompanies,
    ).thenAnswer((_) async => const Right([company]));
  });

  CsvImportCubit build() => CsvImportCubit(
    users,
    companies,
    FakeMediaPicker(),
    const ParseUsersCsv(),
  );

  blocTest<CsvImportCubit, CsvImportState>(
    'wczytuje użytkowników z pliku CSV',
    build: build,
    act: (cubit) => cubit.pickFile(),
    verify: (cubit) {
      expect(cubit.state.users, hasLength(3));
      expect(cubit.state.users.first.lastName, 'Lewandowski');
    },
  );

  blocTest<CsvImportCubit, CsvImportState>(
    'sortowanie nie przywraca usuniętych wierszy',
    build: build,
    act: (cubit) async {
      await cubit.pickFile();
      cubit
        ..removeUser(0)
        ..sortByName(ascending: true);
    },
    verify: (cubit) => expect(cubit.state.users.map((u) => u.lastName), [
      'Kamińska',
      'Wójcik',
    ]),
  );

  blocTest<CsvImportCubit, CsvImportState>(
    'bez wybranej firmy nie wysyła danych',
    build: build,
    act: (cubit) async {
      await cubit.pickFile();
      await cubit.submit();
    },
    verify: (_) => verifyNever(
      () => users.importUsers(
        users: any(named: 'users'),
        companyId: any(named: 'companyId'),
      ),
    ),
  );

  blocTest<CsvImportCubit, CsvImportState>(
    'po imporcie czyści listę i wybraną firmę',
    build: build,
    setUp: () => when(
      () => users.importUsers(users: any(named: 'users'), companyId: 2),
    ).thenAnswer((_) async => const Right(<String>[])),
    act: (cubit) async {
      await cubit.pickFile();
      cubit.selectCompany(company);
      await cubit.submit();
    },
    verify: (cubit) {
      expect(cubit.state.users, isEmpty);
      expect(cubit.state.selectedCompany, isNull);
      expect(cubit.state.submission, const SubmissionStatus.idle());
    },
  );

  blocTest<CsvImportCubit, CsvImportState>(
    'adresy bez wysłanego hasła trafiają do stanu po imporcie',
    build: build,
    setUp: () => when(
      () => users.importUsers(users: any(named: 'users'), companyId: 2),
    ).thenAnswer((_) async => const Right(['marek@example.com'])),
    act: (cubit) async {
      await cubit.pickFile();
      cubit.selectCompany(company);
      await cubit.submit();
    },
    verify: (cubit) =>
        expect(cubit.state.passwordEmailFailed, ['marek@example.com']),
  );

  blocTest<CsvImportCubit, CsvImportState>(
    'błąd importu zgłasza porażkę wysyłki',
    build: build,
    setUp: () => when(
      () => users.importUsers(users: any(named: 'users'), companyId: 2),
    ).thenAnswer((_) async => const Left(NetworkFailure())),
    act: (cubit) async {
      await cubit.pickFile();
      cubit.selectCompany(company);
      await cubit.submit();
    },
    verify: (cubit) => expect(cubit.state.users, hasLength(3)),
  );
}
