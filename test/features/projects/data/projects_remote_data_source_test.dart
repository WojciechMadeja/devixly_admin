import 'package:devixly_admin/app/di/injection.dart';
import 'package:devixly_admin/features/projects/data/datasources/projects_remote_data_source.dart';
import 'package:devixly_admin/features/projects/data/models/project_option_mapper.dart';
import 'package:devixly_admin/features/projects/domain/entities/project_draft.dart';
import 'package:devixly_admin/features/projects/domain/repositories/projects_repository.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/fake_backend.dart';
import '../../../helpers/test_dependencies.dart';

/// Kontrakt z backendem (`ProjectEndpoint`).
void main() {
  late FakeBackend api;
  late ProjectsRemoteDataSource dataSource;

  setUp(() async {
    api = await setUpTestDependencies();
    dataSource = getIt<ProjectsRemoteDataSource>();
  });
  tearDown(getIt.reset);

  test('project.create wysyła pola wymagane i wypełnione', () async {
    await dataSource.addProject(
      ProjectDraft(
        externalId: 9001,
        name: 'Nowa inwestycja',
        noc: 2.5,
        saleTypesDeveloper: true,
        saleTypesResale: false,
        districtId: 2,
        developerId: 3,
        status: 'available',
        descriptionPl: 'Opis po polsku',
        priceFrom: 100000,
        priceTo: 250000,
        areaFrom: 500,
        areaTo: 1200,
        handover: DateTime.utc(2027, 6, 30),
        ownership: ProjectOwnership.freehold,
      ),
    );

    final call = api.calls.single;
    expect(call.route, 'project.create');
    expect(call.arguments['input'], {
      'externalId': 9001,
      'name': 'Nowa inwestycja',
      'districtId': 2,
      'developerId': 3,
      'status': 'available',
      'descriptionPl': 'Opis po polsku',
      'handover': '2027-06-30T00:00:00.000Z',
      'noc': 2.5,
      'unitPriceRangeFrom': 100000,
      'unitPriceRangeTo': 250000,
      'unitAreaRangeFrom': 500,
      'unitAreaRangeTo': 1200,
      'ownershipType': 'freehold',
      'saleTypesDeveloper': true,
      'saleTypesResale': false,
    });
  });

  test('project.listOptionsForUnit daje lekką listę do wyszukiwarki', () async {
    final options = [
      for (final option in await dataSource.getProjectOptions())
        option.toEntity(),
    ];

    expect(api.calls.single.route, 'project.listOptionsForUnit');
    expect(options.first.name, 'Marina Heights');
    expect(options.first.externalId, 5001);
    expect(options.map((option) => option.id), [1, 2, 3]);
  });

  test(
    'lista do wyboru jest pobierana raz, a nie przy każdym wejściu',
    () async {
      final repository = getIt<ProjectsRepository>();

      await repository.getProjectOptions();
      await repository.getProjectOptions();

      expect(api.callsOf('project.listOptionsForUnit'), hasLength(1));
    },
  );

  test('po dodaniu projektu lista jest pobierana ponownie', () async {
    final repository = getIt<ProjectsRepository>();
    await repository.getProjectOptions();

    await repository.addProject(
      const ProjectDraft(
        externalId: 9002,
        name: 'Kolejna inwestycja',
        noc: 1,
        saleTypesDeveloper: true,
        saleTypesResale: false,
      ),
    );
    await repository.getProjectOptions();

    expect(api.callsOf('project.listOptionsForUnit'), hasLength(2));
  });
}
