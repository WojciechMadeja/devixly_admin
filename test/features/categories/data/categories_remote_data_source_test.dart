import 'package:devixly_admin/app/di/injection.dart';
import 'package:devixly_admin/features/categories/data/datasources/categories_remote_data_source.dart';
import 'package:devixly_admin/features/categories/data/models/category_mapper.dart';
import 'package:devixly_admin/features/categories/domain/entities/category.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/fake_backend.dart';
import '../../../helpers/test_dependencies.dart';

/// Kontrakt z backendem (`CategoryEndpoint`).
void main() {
  late FakeBackend api;
  late CategoriesRemoteDataSource dataSource;

  setUp(() async {
    api = await setUpTestDependencies();
    dataSource = getIt<CategoriesRemoteDataSource>();
  });
  tearDown(getIt.reset);

  test('category.list z tokenem sesji zwraca listę kategorii', () async {
    final categories = await dataSource.getCategories();

    final call = api.calls.single;
    expect(call.route, 'category.list');
    expect(call.headers['authorization'], 'Bearer auth-token-1');
    expect(categories, hasLength(4));
    expect(
      categories.first.toEntity(),
      const Category(id: 1, name: 'Crowd Empire', newsCount: 3),
    );
  });

  test('category.create z nazwą, bez danych administratora', () async {
    final added = await dataSource.addCategory('Nowa kategoria');

    final call = api.calls.single;
    expect(call.route, 'category.create');
    expect(call.arguments, {
      'input': {'name': 'Nowa kategoria'},
    });
    expect(added.toEntity(), const Category(id: 5, name: 'Nowa kategoria'));
  });

  test('category.update z id i nową nazwą', () async {
    await dataSource.renameCategory(2, 'Inwestycje 2026');

    final call = api.calls.single;
    expect(call.route, 'category.update');
    expect(call.arguments, {
      'id': 2,
      'input': {'name': 'Inwestycje 2026'},
    });
  });

  test('category.delete z id', () async {
    await dataSource.deleteCategory(2);

    final call = api.calls.single;
    expect(call.route, 'category.delete');
    expect(call.arguments, {'id': 2});
  });
}
