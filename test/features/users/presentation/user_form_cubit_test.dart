import 'package:bloc_test/bloc_test.dart';
import 'package:devixly_admin/core/errors/failures.dart';
import 'package:devixly_admin/core/state/submission_status.dart';
import 'package:devixly_admin/features/companies/domain/entities/company.dart';
import 'package:devixly_admin/features/companies/domain/repositories/companies_repository.dart';
import 'package:devixly_admin/features/users/domain/entities/user_drafts.dart';
import 'package:devixly_admin/features/users/domain/repositories/users_repository.dart';
import 'package:devixly_admin/features/users/presentation/view_model/user_form_cubit.dart';
import 'package:devixly_admin/features/users/presentation/view_model/user_form_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class _MockUsers extends Mock implements UsersRepository {}

class _MockCompanies extends Mock implements CompaniesRepository {}

void main() {
  const company = Company(id: 2, name: 'Devixly');
  const newUser = NewUser(
    email: 'marek@example.com',
    firstName: 'Marek',
    lastName: 'Lewandowski',
    phoneNumber: '+48 501 111 222',
    password: 'haslo123',
    companyId: 2,
  );

  late _MockUsers users;
  late _MockCompanies companies;

  setUpAll(() => registerFallbackValue(newUser));
  setUp(() {
    users = _MockUsers();
    companies = _MockCompanies();
    when(
      companies.getCompanies,
    ).thenAnswer((_) async => const Right([company]));
  });

  UserFormCubit build() =>
      UserFormCubit(users, companies)..selectCompany(company);

  Future<void> submit(UserFormCubit cubit, {required String password}) =>
      cubit.submit(
        email: newUser.email,
        firstName: newUser.firstName,
        lastName: newUser.lastName,
        phoneNumber: newUser.phoneNumber,
        password: password,
      );

  blocTest<UserFormCubit, UserFormState>(
    'za krótkie hasło nie idzie do backendu',
    build: build,
    act: (cubit) => submit(cubit, password: 'krotkie'),
    verify: (_) => verifyNever(() => users.addUser(any())),
    expect: () => const [
      UserFormState(
        selectedCompany: company,
        submission: SubmissionStatus.failure(WeakPasswordFailure()),
      ),
      UserFormState(selectedCompany: company),
    ],
  );

  blocTest<UserFormCubit, UserFormState>(
    'poprawne dane zakładają konto',
    build: build,
    setUp: () => when(
      () => users.addUser(any()),
    ).thenAnswer((_) async => const Right(unit)),
    act: (cubit) => submit(cubit, password: 'haslo123'),
    verify: (_) => verify(() => users.addUser(newUser)).called(1),
  );

  blocTest<UserFormCubit, UserFormState>(
    'zajęty e-mail wraca z komunikatem backendu',
    build: build,
    setUp: () => when(() => users.addUser(any())).thenAnswer(
      (_) async => const Left(
        ServerFailure(
          statusCode: 409,
          message: 'Adres e-mail jest już używany: marek@example.com',
        ),
      ),
    ),
    act: (cubit) => submit(cubit, password: 'haslo123'),
    verify: (cubit) =>
        expect(cubit.state.submission, const SubmissionStatus.idle()),
    expect: () => const [
      UserFormState(
        selectedCompany: company,
        submission: SubmissionStatus.submitting(),
      ),
      UserFormState(
        selectedCompany: company,
        submission: SubmissionStatus.failure(
          ServerFailure(
            statusCode: 409,
            message: 'Adres e-mail jest już używany: marek@example.com',
          ),
        ),
      ),
      UserFormState(selectedCompany: company),
    ],
  );
}
