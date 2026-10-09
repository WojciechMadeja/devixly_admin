import 'package:devixly_admin/app/di/injection.dart';
import 'package:devixly_admin/core/errors/exceptions.dart';
import 'package:devixly_admin/features/admins/data/datasources/admins_remote_data_source.dart';
import 'package:devixly_admin/features/admins/domain/entities/new_admin.dart';
import 'package:devixly_admin/features/users/data/datasources/users_remote_data_source.dart';
import 'package:devixly_admin/features/users/data/models/managed_user_mapper.dart';
import 'package:devixly_admin/features/users/domain/entities/user_drafts.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/fake_backend.dart';
import '../../../helpers/test_dependencies.dart';

/// Kontrakt z backendem (`AppUserEndpoint`). Administratora rozpoznaje
/// backend po sesji — żadne żądanie nie niesie jego e-maila ani id.
void main() {
  late FakeBackend api;
  late UsersRemoteDataSource dataSource;

  setUp(() async {
    api = await setUpTestDependencies();
    dataSource = getIt<UsersRemoteDataSource>();
  });
  tearDown(getIt.reset);

  test('appUser.list zwraca użytkowników z firmami', () async {
    final users = await dataSource.getUsers();

    final call = api.calls.single;
    expect(call.route, 'appUser.list');
    expect(call.arguments, isEmpty);
    expect(call.headers['authorization'], 'Bearer auth-token-1');
    expect(users, hasLength(5));
    final blocked = users[3].toEntity();
    expect(blocked.lastName, 'Zielińska');
    expect(blocked.isBlocked, isTrue);
    expect(blocked.company.name, 'Łódzkie Nieruchomości');
    expect(blocked.company.isBlocked, isTrue);
  });

  test('appUser.createUser z danymi użytkownika, firmą i hasłem', () async {
    await dataSource.addUser(
      const NewUser(
        email: 'nowy@devixly.com',
        firstName: 'Nowy',
        lastName: 'Użytkownik',
        phoneNumber: '+48 600 000 000',
        password: 'tajne123',
        companyId: 2,
      ),
    );

    final call = api.calls.single;
    expect(call.route, 'appUser.createUser');
    expect(call.arguments, {
      'input': {
        'email': 'nowy@devixly.com',
        'firstName': 'Nowy',
        'lastName': 'Użytkownik',
        'phoneNumber': '+48 600 000 000',
        'companyId': 2,
        'password': 'tajne123',
      },
    });
  });

  test('zajęty e-mail wraca jako czytelny błąd', () async {
    await getIt.reset();
    api = await setUpTestDependencies(
      api: FakeBackend(
        overrides: {
          'appUser.createUser': FakeResponse.exception(
            'UserCreationException',
            {
              'reason': 'emailInUse',
              'emails': ['nowy@devixly.com'],
            },
          ),
        },
      ),
    );

    await expectLater(
      getIt<UsersRemoteDataSource>().addUser(
        const NewUser(
          email: 'nowy@devixly.com',
          firstName: 'Nowy',
          lastName: 'Użytkownik',
          phoneNumber: '',
          password: 'tajne123',
          companyId: 2,
        ),
      ),
      throwsA(
        isA<ServerException>()
            .having((e) => e.statusCode, 'statusCode', 409)
            .having(
              (e) => e.message,
              'message',
              'Adres e-mail jest już używany: nowy@devixly.com',
            ),
      ),
    );
  });

  test('appUser.update, a potem odczyt użytkownika z firmą', () async {
    final updated = await dataSource.updateUser(
      3,
      const UserUpdate(
        email: 'piotr@devixly.com',
        firstName: 'Piotr',
        lastName: 'Wiśniewski',
        phoneNumber: '+48 600 300 400',
        companyId: 1,
      ),
    );

    expect(api.calls.map((call) => call.route), [
      'appUser.update',
      'appUser.getById',
    ]);
    expect(api.calls.first.arguments, {
      'id': 3,
      'input': {
        'email': 'piotr@devixly.com',
        'companyId': 1,
        'lastName': 'Wiśniewski',
        'firstName': 'Piotr',
        'phoneNumber': '+48 600 300 400',
      },
    });
    expect(api.calls.last.arguments, {'id': 3});
    expect(updated.company?.name, 'Crowd Empire');
  });

  test('appUser.setBlocked z id i flagą blokady', () async {
    await dataSource.setBlocked(3, true);

    final call = api.calls.single;
    expect(call.route, 'appUser.setBlocked');
    expect(call.arguments, {'id': 3, 'isBlocked': true});
  });

  test('appUser.delete z id', () async {
    await dataSource.deleteUser(3);

    final call = api.calls.single;
    expect(call.route, 'appUser.delete');
    expect(call.arguments, {'id': 3});
  });

  test('appUser.createUsers z listą z CSV, bez haseł', () async {
    await dataSource.importUsers(
      users: const [
        CsvUser(
          firstName: 'Marek',
          lastName: 'Lewandowski',
          email: 'marek@example.com',
          phoneNumber: '+48 501 111 222',
        ),
      ],
      companyId: 2,
    );

    final call = api.calls.single;
    expect(call.route, 'appUser.createUsers');
    expect(call.arguments, {
      'inputs': [
        {
          'email': 'marek@example.com',
          'firstName': 'Marek',
          'lastName': 'Lewandowski',
          'phoneNumber': '+48 501 111 222',
          'companyId': 2,
        },
      ],
    });
  });

  test('import zwraca adresy, na które backend nie wysłał hasła', () async {
    // Backend podmieniony na taki, który zgłasza nieudaną wysyłkę hasła.
    await getIt.reset();
    api = await setUpTestDependencies(
      api: FakeBackend(
        overrides: {
          'appUser.createUsers': const FakeResponse.value({
            'users': <Object?>[],
            'passwordEmailFailed': ['marek@example.com'],
          }),
        },
      ),
    );
    dataSource = getIt<UsersRemoteDataSource>();

    final failed = await dataSource.importUsers(
      users: const [
        CsvUser(
          firstName: 'Marek',
          lastName: 'Lewandowski',
          email: 'marek@example.com',
          phoneNumber: '+48 501 111 222',
        ),
      ],
      companyId: 2,
    );

    expect(failed, ['marek@example.com']);
  });

  test('appUser.createAdministrator bez firmy w żądaniu', () async {
    await getIt<AdminsRemoteDataSource>().addAdmin(
      const NewAdmin(
        email: 'admin2@devixly.com',
        firstName: 'Anna',
        lastName: 'Nowak',
        phoneNumber: '+48 600 111 222',
        password: 'tajne123',
      ),
    );

    final call = api.calls.single;
    expect(call.route, 'appUser.createAdministrator');
    expect(call.arguments, {
      'input': {
        'email': 'admin2@devixly.com',
        'firstName': 'Anna',
        'lastName': 'Nowak',
        'phoneNumber': '+48 600 111 222',
        'password': 'tajne123',
      },
    });
  });
}
