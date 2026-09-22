import 'package:bloc_test/bloc_test.dart';
import 'package:devixly_admin/core/errors/failures.dart';
import 'package:devixly_admin/features/companies/domain/entities/company.dart';
import 'package:devixly_admin/features/companies/domain/entities/company_draft.dart';
import 'package:devixly_admin/features/companies/domain/repositories/companies_repository.dart';
import 'package:devixly_admin/features/companies/presentation/view_model/companies_cubit.dart';
import 'package:devixly_admin/features/companies/presentation/view_model/companies_state.dart';
import 'package:fpdart/fpdart.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockRepository extends Mock implements CompaniesRepository {}

void main() {
  const devixly = Company(
    id: 2,
    name: 'Devixly',
    email: 'kontakt@devixly.com',
    city: 'Kraków',
    agentsCount: 4,
  );
  const lodz = Company(id: 3, name: 'Łódzkie', isBlocked: true);
  const draft = CompanyDraft(name: 'Devixly SA', city: 'Warszawa');

  late _MockRepository repository;

  setUpAll(() {
    registerFallbackValue(devixly);
    registerFallbackValue(draft);
  });
  setUp(() => repository = _MockRepository());

  CompaniesCubit loadedCubit() =>
      CompaniesCubit(repository)
        ..emit(const CompaniesState.loaded(companies: [devixly, lodz]));

  blocTest<CompaniesCubit, CompaniesState>(
    'edycja podmienia firmę w miejscu, zachowując pozostałe dane',
    build: loadedCubit,
    setUp: () => when(
      () => repository.updateCompany(devixly, draft),
    ).thenAnswer((_) async => Right(devixly.copyWith(draft: draft))),
    act: (cubit) async => expect(await cubit.update(devixly, draft), isTrue),
    expect: () => [
      CompaniesState.loaded(
        companies: [
          devixly.copyWith(draft: draft),
          lodz,
        ],
      ),
    ],
    verify: (cubit) {
      final updated = (cubit.state as CompaniesLoaded).companies.first;
      expect(updated.agentsCount, 4);
      expect(updated.isBlocked, isFalse);
    },
  );

  blocTest<CompaniesCubit, CompaniesState>(
    'odblokowanie zmienia tylko flagę blokady',
    build: loadedCubit,
    setUp: () => when(
      () => repository.setBlocked(lodz, false),
    ).thenAnswer((_) async => Right(lodz.copyWith(isBlocked: false))),
    act: (cubit) => cubit.setBlocked(lodz, false),
    expect: () => [
      CompaniesState.loaded(
        companies: [devixly, lodz.copyWith(isBlocked: false)],
      ),
    ],
  );

  blocTest<CompaniesCubit, CompaniesState>(
    'nieudana blokada zwraca false i nie zmienia listy',
    build: loadedCubit,
    setUp: () => when(
      () => repository.setBlocked(any(), any()),
    ).thenAnswer((_) async => const Left(NetworkFailure())),
    act: (cubit) async =>
        expect(await cubit.setBlocked(devixly, true), isFalse),
    expect: () => <CompaniesState>[],
  );

  blocTest<CompaniesCubit, CompaniesState>(
    'nowa firma trafia na koniec listy',
    build: loadedCubit,
    act: (cubit) => cubit.add(const Company(id: 4, name: 'Nowa')),
    expect: () => [
      const CompaniesState.loaded(
        companies: [
          devixly,
          lodz,
          Company(id: 4, name: 'Nowa'),
        ],
      ),
    ],
  );
}
