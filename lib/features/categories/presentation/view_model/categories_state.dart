import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/errors/failures.dart';
import '../../domain/entities/category.dart';

part 'categories_state.freezed.dart';

@freezed
sealed class CategoriesState with _$CategoriesState {
  const factory CategoriesState.loading() = CategoriesLoading;

  /// Kategorie posortowane po nazwie; [selectedId] to zaznaczona karta.
  const factory CategoriesState.loaded({
    required List<Category> categories,
    int? selectedId,
  }) = CategoriesLoaded;

  const factory CategoriesState.error(Failure failure) = CategoriesError;
}
