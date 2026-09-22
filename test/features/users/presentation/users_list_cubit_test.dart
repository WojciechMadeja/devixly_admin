import 'package:bloc_test/bloc_test.dart';
import 'package:devixly_admin/core/network/current_admin.dart';
import 'package:devixly_admin/features/companies/domain/entities/company.dart';
import 'package:devixly_admin/features/companies/domain/repositories/companies_repository.dart';
import 'package:devixly_admin/features/users/domain/entities/managed_user.dart';
import 'package:devixly_admin/features/users/domain/entities/user_company.dart';
import 'package:devixly_admin/features/users/domain/entities/user_sort.dart';
import 'package:devixly_admin/features/users/domain/repositories/users_repository.dart';
import 'package:devixly_admin/features/users/presentation/view_model/users_list_cubit.dart';
import 'package:devixly_admin/features/users/presentation/view_model/users_list_state.dart';
import 'package:fpdart/fpdart.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockUsers extends Mock implements UsersRepository {}

class _MockCompanies extends Mock implements CompaniesRepository {}

class _FakeAdmin implements CurrentAdmin {
  @override
  int get id => 1;

  @override
  String get email => 'admin@devixly.com';
}

void main() {
  const crowd = UserCompany(id: 1, name: 'Crowd Empire');
  const devixly = UserCompany(id: 2, name: 'Devixly');
  const me = ManagedUser(
    id: 1,
    firstName: 'Jan',
    lastName: 'Kowalski',
    email: 'admin@devixly.com',
    isAdministrator: true,
    company: crowd,
  );
  const anna = ManagedUser(
    id: 2,
    firstName: 'Anna',
    lastName: 'Nowak',
    email: 'anna@crowdempire.ae',
    isAdministrator: true,
    company: crowd,
  );
  const piotr = ManagedUser(
    id: 3,
    firstName: 'Piotr',
    lastName: 'Wiśniewski',
    email: 'piotr@devixly.com',
    company: devixly,
  );
  const ewa = ManagedUser(
    id: 4,
    firstName: 'Ewa',
    lastName: 'Adamska',
    email: 'ewa@devixly.com',
    isBlocked: true,
    company: devixly,
  );

  late _MockUsers users;
  late _MockCompanies companies;

  setUp(() {
    users = _MockUsers();
    companies = _MockCompanies();
    when(
      companies.getCompanies,
    ).thenAnswer((_) async => const Right(<Company>[]));
    when(
      users.getUsers,
    ).thenAnswer((_) async => const Right([me, anna, piotr, ewa]));
  });

  UsersListCubit build() => UsersListCubit(users, companies, _FakeAdmin());

  blocTest<UsersListCubit, UsersListState>(
    'lista pomija zalogowanego administratora',
    build: build,
    act: (cubit) => cubit.load(),
    expect: () => [
      const UsersListState.loading(),
      const UsersListState.loaded(users: [anna, piotr, ewa], companies: []),
    ],
  );

  blocTest<UsersListCubit, UsersListState>(
    'sortowanie po nazwisku malejąco',
    build: build,
    act: (cubit) async {
      await cubit.load();
      cubit.sort(UserSortKey.name, ascending: false);
    },
    skip: 2,
    expect: () => [
      const UsersListState.loaded(
        users: [piotr, anna, ewa],
        companies: [],
        sortKey: UserSortKey.name,
        ascending: false,
      ),
    ],
  );

  blocTest<UsersListCubit, UsersListState>(
    'sortowanie po firmie zachowuje nazwiska rosnąco w firmie',
    build: build,
    act: (cubit) async {
      await cubit.load();
      cubit.sort(UserSortKey.company, ascending: true);
    },
    skip: 2,
    verify: (cubit) => expect(
      (cubit.state as UsersListLoaded).users.map((u) => u.lastName),
      ['Nowak', 'Adamska', 'Wiśniewski'],
    ),
  );

  blocTest<UsersListCubit, UsersListState>(
    'blokada podmienia użytkownika na liście',
    build: build,
    setUp: () => when(
      () => users.setBlocked(piotr, true),
    ).thenAnswer((_) async => Right(piotr.copyWith(isBlocked: true))),
    act: (cubit) async {
      await cubit.load();
      expect(await cubit.setBlocked(piotr, true), isTrue);
    },
    skip: 2,
    verify: (cubit) =>
        expect((cubit.state as UsersListLoaded).users[1].isBlocked, isTrue),
  );

  blocTest<UsersListCubit, UsersListState>(
    'usunięcie usuwa użytkownika z listy',
    build: build,
    setUp: () => when(
      () => users.deleteUser(3),
    ).thenAnswer((_) async => const Right(unit)),
    act: (cubit) async {
      await cubit.load();
      await cubit.delete(piotr);
    },
    skip: 2,
    expect: () => [
      const UsersListState.loaded(users: [anna, ewa], companies: []),
    ],
  );
}
