import 'package:devixly_admin/app/di/injection.dart';
import 'package:devixly_admin/features/companies/data/datasources/companies_remote_data_source.dart';
import 'package:devixly_admin/features/companies/domain/entities/company_draft.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/fake_xano_api.dart';
import '../../../helpers/test_dependencies.dart';

/// Kontrakt z Xano (grupa api:lUs0VlvB) — jak w wersji FlutterFlow.
void main() {
  const base = 'https://xxiz-mxuj-zpyz.n7e.xano.io/api:lUs0VlvB/companies';
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
    'post_code': '00-001',
    'city': 'Warszawa',
    'phone_number': '+48 22 111 22 33',
    'company_representative': 'Jan Nowak',
  };

  late FakeXanoApi api;
  late CompaniesRemoteDataSource dataSource;

  setUp(() async {
    api = await setUpTestDependencies();
    dataSource = getIt<CompaniesRemoteDataSource>();
  });
  tearDown(getIt.reset);

  test('GET companies zwraca firmy z pełnymi danymi', () async {
    final companies = await dataSource.getCompanies();

    expect(api.requests.single.url.toString(), base);
    expect(companies, hasLength(3));
    final devixly = companies[1].toEntity();
    expect(devixly.name, 'Devixly Sp. z o.o.');
    expect(devixly.postCode, '30-001');
    expect(devixly.representative, 'Piotr Wiśniewski');
    expect(devixly.agentsCount, 4);
    expect(companies[2].isBlocked, isTrue);
  });

  test('POST companies z danymi formularza', () async {
    final added = await dataSource.addCompany(draft);

    final request = api.requests.single;
    expect(request.method, 'POST');
    expect(request.url.toString(), base);
    expect(request.json, draftJson);
    expect(added.id, 4);
  });

  test('PATCH companies/{id} z companies_id i danymi formularza', () async {
    await dataSource.updateCompany(2, draft);

    final request = api.requests.single;
    expect(request.method, 'PATCH');
    expect(request.url.toString(), '$base/2');
    expect(request.json, {'companies_id': 2, ...draftJson});
  });

  test('PATCH companies/block/{id} z e-mailem admina i flagą blokady',
      () async {
    await dataSource.setBlocked(2, true);

    final request = api.requests.single;
    expect(request.url.toString(), '$base/block/2');
    expect(request.json, {
      'companies_id': 2,
      'admin_email': 'admin@devixly.com',
      'is_blocked': true,
    });
  });

  test('DELETE companies/{id}', () async {
    await dataSource.deleteCompany(2);

    final request = api.requests.single;
    expect(request.method, 'DELETE');
    expect(request.url.toString(), '$base/2');
  });
}
