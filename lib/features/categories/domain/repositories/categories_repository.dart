import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failures.dart';
import '../entities/category.dart';

abstract interface class CategoriesRepository {
  Future<Either<Failure, List<Category>>> getCategories();

  Future<Either<Failure, Category>> addCategory(String name);

  Future<Either<Failure, Category>> renameCategory(
    Category category,
    String name,
  );

  Future<Either<Failure, Unit>> deleteCategory(int id);
}
