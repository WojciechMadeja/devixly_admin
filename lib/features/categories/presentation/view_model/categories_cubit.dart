import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/category.dart';
import '../../domain/repositories/categories_repository.dart';
import 'categories_state.dart';

/// Lista kategorii z zaznaczaniem, zmianą nazwy i usuwaniem.
class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit(this._repository) : super(const CategoriesState.loading());

  final CategoriesRepository _repository;

  Future<void> load() async {
    emit(const CategoriesState.loading());
    final result = await _repository.getCategories();
    if (isClosed) return;
    emit(
      result.match(
        CategoriesState.error,
        (categories) => CategoriesState.loaded(categories: _sorted(categories)),
      ),
    );
  }

  void select(int id) => _updateLoaded((s) => s.copyWith(selectedId: id));

  void clearSelection() => _updateLoaded((s) => s.copyWith(selectedId: null));

  /// Dodaje nową albo podmienia zmienioną kategorię.
  void upsert(Category category) => _updateLoaded(
    (s) => s.copyWith(
      categories: _sorted([
        for (final c in s.categories)
          if (c.id != category.id) c,
        category,
      ]),
    ),
  );

  /// Zwraca, czy zmiana się udała (dialog zamyka się tylko przy sukcesie).
  Future<bool> rename(Category category, String name) async {
    final result = await _repository.renameCategory(category, name);
    return result.match((_) => false, (renamed) {
      upsert(renamed);
      return true;
    });
  }

  Future<bool> delete(Category category) async {
    final result = await _repository.deleteCategory(category.id);
    return result.match((_) => false, (_) {
      _updateLoaded(
        (s) => s.copyWith(
          categories: [
            for (final c in s.categories)
              if (c.id != category.id) c,
          ],
          selectedId: null,
        ),
      );
      return true;
    });
  }

  void _updateLoaded(CategoriesLoaded Function(CategoriesLoaded) update) {
    final current = state;
    if (current is CategoriesLoaded && !isClosed) emit(update(current));
  }

  static List<Category> _sorted(List<Category> categories) =>
      [...categories]..sort((a, b) => a.name.compareTo(b.name));
}
