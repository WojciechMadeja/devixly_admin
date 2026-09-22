import 'package:devixly_admin/app/di/injection.dart';
import 'package:devixly_admin/features/users/data/datasources/users_remote_data_source.dart';
import 'package:devixly_admin/features/users/domain/entities/user_drafts.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/fake_xano_api.dart';
import '../../../helpers/test_dependencies.dart';

/// Kontrakt z Xano (grupy api:om78GTVu i api:Q_aNNNvL) — jak w FlutterFlow.
void main() {
  const host = 'https://xxiz-mxuj-zpyz.n7e.xano.io';
  late FakeXanoApi api;
  late UsersRemoteDataSource dataSource;

  setUp(() async {
    api = await setUpTestDependencies();
    dataSource = getIt<UsersRemoteDataSource>();
  });
  tearDown(getIt.reset);

  test('GET user z e-mailem admina w zapytaniu', () async {
    final users = await dataSource.getUsers();

    final request = api.requests.single;
    expect(
      request.url.toString(),
      '$host/api:om78GTVu/user?email=admin%40devixly.com',
    );
    expect(users, hasLength(5));
    final blocked = users[3].toEntity();
    expect(blocked.lastName, 'Zielińska');
    expect(blocked.isBlocked, isTrue);
    expect(blocked.company.name, 'Łódzkie Nieruchomości');
    expect(blocked.company.isBlocked, isTrue);
  });

  test('POST auth/signup z danymi użytkownika i firmą', () async {
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

    final request = api.requests.single;
    expect(request.url.toString(), '$host/api:Q_aNNNvL/auth/signup');
    expect(request.json, {
      'email': 'nowy@devixly.com',
      'first_name': 'Nowy',
      'last_name': 'Użytkownik',
      'company_id': 2,
      'phone_number': '+48 600 000 000',
      'admin_email': 'admin@devixly.com',
      'password': 'tajne123',
    });
  });

  test('PUT user/{id} z polem companies i e-mailem admina', () async {
    await dataSource.updateUser(
      3,
      const UserUpdate(
        email: 'piotr@devixly.com',
        firstName: 'Piotr',
        lastName: 'Wiśniewski',
        phoneNumber: '+48 600 300 400',
        companyId: 1,
      ),
    );

    final request = api.requests.single;
    expect(request.method, 'PUT');
    expect(request.url.toString(), '$host/api:om78GTVu/user/3');
    expect(request.json, {
      'admin_email': 'admin@devixly.com',
      'email': 'piotr@devixly.com',
      'companies': 1,
      'last_name': 'Wiśniewski',
      'first_name': 'Piotr',
      'phone_number': '+48 600 300 400',
    });
  });

  test('PATCH user/block/{id} z flagą blokady', () async {
    await dataSource.setBlocked(3, true);

    final request = api.requests.single;
    expect(request.url.toString(), '$host/api:om78GTVu/user/block/3');
    expect(request.json, {
      'admin_email': 'admin@devixly.com',
      'is_blocked': true,
    });
  });

  test('DELETE user/admin/{id} z e-mailem admina w zapytaniu', () async {
    await dataSource.deleteUser(3);

    final request = api.requests.single;
    expect(request.method, 'DELETE');
    expect(
      request.url.toString(),
      '$host/api:om78GTVu/user/admin/3?admin_email=admin%40devixly.com',
    );
  });

  test('POST auth/series/signup z listą użytkowników z CSV', () async {
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

    final request = api.requests.single;
    expect(request.url.toString(), '$host/api:Q_aNNNvL/auth/series/signup');
    expect(request.json, {
      'users': [
        {
          'email': 'marek@example.com',
          'firstName': 'Marek',
          'lastName': 'Lewandowski',
          'company': 2,
          'phoneNumber': '+48 501 111 222',
        },
      ],
      'admin_email': 'admin@devixly.com',
    });
  });
}
