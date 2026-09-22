import '../../../../core/config/api_config.dart';
import '../../../../core/network/authorized_api_client.dart';
import '../../../../core/network/current_admin.dart';
import '../../../../core/network/json_body.dart';
import '../models/category_model.dart';

abstract interface class CategoriesRemoteDataSource {
  Future<List<CategoryModel>> getCategories();

  Future<CategoryModel> addCategory(String name);

  Future<CategoryModel> renameCategory(int id, String name);

  Future<void> deleteCategory(int id);
}

class CategoriesRemoteDataSourceImpl implements CategoriesRemoteDataSource {
  CategoriesRemoteDataSourceImpl(this._client, this._admin);

  final AuthorizedApiClient _client;
  final CurrentAdmin _admin;

  static const _categories = '${XanoApiGroup.categories}/categories';

  @override
  Future<List<CategoryModel>> getCategories() async {
    final json = await _client.get(_categories);
    return json.asJsonList().map(CategoryModel.fromJson).toList();
  }

  @override
  Future<CategoryModel> addCategory(String name) async {
    final json = await _client.post(
      _categories,
      body: {'name': name, 'admin_email': _admin.email},
    );
    return CategoryModel.fromJson(json.asJsonObject());
  }

  @override
  Future<CategoryModel> renameCategory(int id, String name) async {
    final json = await _client.patch(
      '$_categories/$id',
      body: {'name': name, 'admin_email': _admin.email},
    );
    return CategoryModel.fromJson(json.asJsonObject());
  }

  @override
  Future<void> deleteCategory(int id) =>
      _client.delete('$_categories/$id', query: {'admin_email': _admin.email});
}
