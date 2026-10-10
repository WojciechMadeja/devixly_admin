import 'package:devixly_admin/app/di/injection.dart';
import 'package:devixly_admin/features/projects/data/datasources/projects_remote_data_source.dart';
import 'package:devixly_admin/features/projects/domain/entities/project_draft.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/fake_backend.dart';
import '../../helpers/test_dependencies.dart';

/// Zapis zmian projektu musi zachować to, czego formularz nie edytuje —
/// backend zastępuje przy aktualizacji wszystkie pola.
void main() {
  late FakeBackend api;
  late ProjectsRemoteDataSource dataSource;

  setUp(() async {
    api = await setUpTestDependencies();
    dataSource = getIt<ProjectsRemoteDataSource>();
  });
  tearDown(getIt.reset);

  test('project.update przepisuje pola spoza formularza', () async {
    await dataSource.updateProject(
      1,
      const ProjectDraft(
        externalId: 5001,
        name: 'Marina Heights II',
        noc: 3,
        saleTypesDeveloper: true,
        saleTypesResale: false,
        districtId: 2,
      ),
    );

    expect(api.calls.map((call) => call.route), [
      'project.getById',
      'project.update',
    ]);
    final input = api.calls.last.arguments['input'] as Map<String, Object?>;
    // Z formularza.
    expect(input['name'], 'Marina Heights II');
    expect(input['noc'], 3.0);
    expect(input['districtId'], 2);
    // Z istniejącego rekordu — inaczej backend by je wyczyścił.
    expect(input['images'], ['https://example.com/projects/5001-1.png']);
  });

  test('project.delete usuwa po id', () async {
    await dataSource.deleteProject(7);

    final call = api.calls.single;
    expect(call.route, 'project.delete');
    expect(call.arguments, {'id': 7});
  });
}
