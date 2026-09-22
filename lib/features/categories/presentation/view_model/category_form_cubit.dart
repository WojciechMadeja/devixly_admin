import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/repositories/categories_repository.dart';
import 'category_form_state.dart';

/// Dodawanie nowej kategorii.
class CategoryFormCubit extends Cubit<CategoryFormState> {
  CategoryFormCubit(this._repository)
    : super(const CategoryFormState.initial());

  final CategoriesRepository _repository;

  Future<void> submit(String name) async {
    if (state is CategoryFormSubmitting) return;
    if (state is! CategoryFormInitial) emit(const CategoryFormState.initial());
    if (name.trim().isEmpty) {
      emit(const CategoryFormState.emptyName());
      return;
    }
    emit(const CategoryFormState.submitting());
    final result = await _repository.addCategory(name.trim());
    if (isClosed) return;
    emit(result.match(CategoryFormState.failure, CategoryFormState.success));
  }
}
