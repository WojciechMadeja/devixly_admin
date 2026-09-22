import 'package:devixly_admin/app/di/injection.dart';
import 'package:devixly_admin/features/categories/data/datasources/categories_remote_data_source.dart';
import 'package:devixly_admin/features/categories/data/models/category_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/fake_xano_api.dart';
import '../../../helpers/test_dependencies.dart';

/// Kontrakt z Xano (grupa api:Qct1TYOV) — jak w wersji FlutterFlow.
void main() {
  const base = 'https://xxiz-mxuj-zpyz.n7e.xano.io/api:Qct1TYOV/categories';
  late FakeXanoApi api;
  late CategoriesRemoteDataSource dataSource;

  setUp(() async {
    api = await setUpTestDependencies();
    dataSource = getIt<CategoriesRemoteDataSource>();
  });
  tearDown(getIt.reset);

  test('GET categories z tokenem zwraca listę kategorii', () async {
    final categories = await dataSource.getCategories();

    final request = api.requests.single;
    expect(request.method, 'GET');
    expect(request.url.toString(), base);
    expect(request.headers['Authorization'], 'Bearer auth-token-1');
    expect(categories, hasLength(4));
    expect(
      categories.first,
      const CategoryModel(id: 1, name: 'Crowd Empire', newsCount: 3),
    );
  });

  test('POST categories z nazwą i e-mailem admina', () async {
    final added = await dataSource.addCategory('Nowa kategoria');

    final request = api.requests.single;
    expect(request.method, 'POST');
    expect(request.url.toString(), base);
    expect(request.json, {
      'name': 'Nowa kategoria',
      'admin_email': 'admin@devixly.com',
    });
    expect(added, const CategoryModel(id: 5, name: 'Nowa kategoria'));
  });

  test('PATCH categories/{id} z nową nazwą i e-mailem admina', () async {
    await dataSource.renameCategory(2, 'Inwestycje 2026');

    final request = api.requests.single;
    expect(request.method, 'PATCH');
    expect(request.url.toString(), '$base/2');
    expect(request.json, {
      'name': 'Inwestycje 2026',
      'admin_email': 'admin@devixly.com',
    });
  });

  test('DELETE categories/{id} z e-mailem admina w zapytaniu', () async {
    await dataSource.deleteCategory(2);

    final request = api.requests.single;
    expect(request.method, 'DELETE');
    expect(request.url.toString(), '$base/2?admin_email=admin%40devixly.com');
  });
}
