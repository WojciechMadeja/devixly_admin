import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/errors/failures.dart';
import '../../domain/entities/category.dart';

part 'category_form_state.freezed.dart';

@freezed
sealed class CategoryFormState with _$CategoryFormState {
  const factory CategoryFormState.initial() = CategoryFormInitial;

  const factory CategoryFormState.emptyName() = CategoryFormEmptyName;

  const factory CategoryFormState.submitting() = CategoryFormSubmitting;

  const factory CategoryFormState.success(Category category) =
      CategoryFormSuccess;

  const factory CategoryFormState.failure(Failure failure) =
      CategoryFormFailure;
}
