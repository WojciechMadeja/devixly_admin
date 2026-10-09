import 'package:devixly_admin/app/di/injection.dart';
import 'package:devixly_admin/features/companies/data/datasources/companies_remote_data_source.dart';
import 'package:devixly_admin/features/companies/data/models/company_mapper.dart';
import 'package:devixly_admin/features/companies/domain/entities/company_draft.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/fake_backend.dart';
import '../../../helpers/test_dependencies.dart';

/// Kontrakt z backendem (`CompanyEndpoint`).
void main() {
  const draft = CompanyDraft(
    name: 'Nowa Firma',
    email: 'biuro@nowafirma.pl',
    address: 'ul. Polna 1',
    postCode: '00-001',
    city: 'Warszawa',
    phoneNumber: '+48 22 111 22 33',
    representative: 'Jan Nowak',
  );
  const draftJson = {
    'name': 'Nowa Firma',
    'email': 'biuro@nowafirma.pl',
    'address': 'ul. Polna 1',
    'postCode': '00-001',
    'city': 'Warszawa',
    'phoneNumber': '+48 22 111 22 33',
    'companyRepresentative': 'Jan Nowak',
  };

  late FakeBackend api;
  late CompaniesRemoteDataSource dataSource;

  setUp(() async {
    api = await setUpTestDependencies();
    dataSource = getIt<CompaniesRemoteDataSource>();
  });
  tearDown(getIt.reset);

  test('company.list zwraca firmy z pełnymi danymi', () async {
    final companies = await dataSource.getCompanies();

    expect(api.calls.single.route, 'company.list');
    expect(companies, hasLength(3));
    final devixly = companies[1].toEntity();
    expect(devixly.name, 'Devixly Sp. z o.o.');
    expect(devixly.postCode, '30-001');
    expect(devixly.representative, 'Piotr Wiśniewski');
    expect(devixly.agentsCount, 4);
    expect(companies[2].isBlocked, isTrue);
  });

  test('company.create z danymi formularza', () async {
    final added = await dataSource.addCompany(draft);

    final call = api.calls.single;
    expect(call.route, 'company.create');
    expect(call.arguments, {
      'input': {...draftJson, 'isBlocked': false},
    });
    expect(added.id, 4);
  });

  test('company.create: puste pola formularza to brak wartości', () async {
    await dataSource.addCompany(
      const CompanyDraft(
        name: 'Sama Nazwa',
        email: '',
        address: ' ',
        postCode: '',
        city: '',
        phoneNumber: '',
        representative: '',
      ),
    );

    expect(api.calls.single.arguments, {
      'input': {'name': 'Sama Nazwa', 'isBlocked': false},
    });
  });

  test('company.update zachowuje administratora i blokadę firmy', () async {
    await dataSource.updateCompany(2, draft);

    expect(api.calls.map((call) => call.route), [
      'company.getById',
      'company.update',
    ]);
    expect(api.calls.first.arguments, {'id': 2});
    expect(api.calls.last.arguments, {
      'id': 2,
      'input': {...draftJson, 'adminId': 1, 'isBlocked': false},
    });
  });

  test('company.setBlocked z id i flagą blokady', () async {
    await dataSource.setBlocked(2, true);

    final call = api.calls.single;
    expect(call.route, 'company.setBlocked');
    expect(call.arguments, {'id': 2, 'isBlocked': true});
  });

  test('company.delete z id', () async {
    await dataSource.deleteCompany(2);

    final call = api.calls.single;
    expect(call.route, 'company.delete');
    expect(call.arguments, {'id': 2});
  });
}
