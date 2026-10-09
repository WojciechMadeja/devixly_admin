import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/errors/guard.dart';
import '../../domain/entities/category.dart';
import '../../domain/repositories/categories_repository.dart';
import '../datasources/categories_remote_data_source.dart';
import '../models/category_mapper.dart';

class CategoriesRepositoryImpl implements CategoriesRepository {
  CategoriesRepositoryImpl(this._remote);

  final CategoriesRemoteDataSource _remote;

  @override
  Future<Either<Failure, List<Category>>> getCategories() => guard(
    () async => [
      for (final model in await _remote.getCategories()) model.toEntity(),
    ],
  );

  @override
  Future<Either<Failure, Category>> addCategory(String name) =>
      guard(() async => (await _remote.addCategory(name)).toEntity());

  @override
  Future<Either<Failure, Category>> renameCategory(
    Category category,
    String name,
  ) => guard(() async {
    final renamed = await _remote.renameCategory(category.id, name);
    // Odpowiedź nie zawiera licznika aktualności — zostaje dotychczasowy.
    return category.copyWith(name: renamed.name);
  });

  @override
  Future<Either<Failure, Unit>> deleteCategory(int id) => guard(() async {
    await _remote.deleteCategory(id);
    return unit;
  });
}
