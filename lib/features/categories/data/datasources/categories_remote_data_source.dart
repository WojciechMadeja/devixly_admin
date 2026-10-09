import 'package:background_devixly_client/background_devixly_client.dart';

import '../../../../core/network/backend_call.dart';

abstract interface class CategoriesRemoteDataSource {
  Future<List<Category>> getCategories();

  Future<Category> addCategory(String name);

  Future<Category> renameCategory(int id, String name);

  Future<void> deleteCategory(int id);
}

/// Kategorie aktualności w backendzie (`CategoryEndpoint`). Zapisy wymagają
/// uprawnień administratora — backend sprawdza je po sesji.
class CategoriesRemoteDataSourceImpl implements CategoriesRemoteDataSource {
  CategoriesRemoteDataSourceImpl(this._client);

  final Client _client;

  @override
  Future<List<Category>> getCategories() => backendCall(_client.category.list);

  @override
  Future<Category> addCategory(String name) =>
      backendCall(() => _client.category.create(CategoryInput(name: name)));

  @override
  Future<Category> renameCategory(int id, String name) =>
      backendCall(() => _client.category.update(id, CategoryInput(name: name)));

  @override
  Future<void> deleteCategory(int id) =>
      backendCall(() => _client.category.delete(id));
}
