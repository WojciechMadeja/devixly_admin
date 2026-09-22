// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CategoryFormState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CategoryFormState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CategoryFormState()';
  }
}

/// @nodoc
class $CategoryFormStateCopyWith<$Res> {
  $CategoryFormStateCopyWith(
      CategoryFormState _, $Res Function(CategoryFormState) __);
}

/// Adds pattern-matching-related methods to [CategoryFormState].
extension CategoryFormStatePatterns on CategoryFormState {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CategoryFormInitial value)? initial,
    TResult Function(CategoryFormEmptyName value)? emptyName,
    TResult Function(CategoryFormSubmitting value)? submitting,
    TResult Function(CategoryFormSuccess value)? success,
    TResult Function(CategoryFormFailure value)? failure,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case CategoryFormInitial() when initial != null:
        return initial(_that);
      case CategoryFormEmptyName() when emptyName != null:
        return emptyName(_that);
      case CategoryFormSubmitting() when submitting != null:
        return submitting(_that);
      case CategoryFormSuccess() when success != null:
        return success(_that);
      case CategoryFormFailure() when failure != null:
        return failure(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CategoryFormInitial value) initial,
    required TResult Function(CategoryFormEmptyName value) emptyName,
    required TResult Function(CategoryFormSubmitting value) submitting,
    required TResult Function(CategoryFormSuccess value) success,
    required TResult Function(CategoryFormFailure value) failure,
  }) {
    final _that = this;
    switch (_that) {
      case CategoryFormInitial():
        return initial(_that);
      case CategoryFormEmptyName():
        return emptyName(_that);
      case CategoryFormSubmitting():
        return submitting(_that);
      case CategoryFormSuccess():
        return success(_that);
      case CategoryFormFailure():
        return failure(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CategoryFormInitial value)? initial,
    TResult? Function(CategoryFormEmptyName value)? emptyName,
    TResult? Function(CategoryFormSubmitting value)? submitting,
    TResult? Function(CategoryFormSuccess value)? success,
    TResult? Function(CategoryFormFailure value)? failure,
  }) {
    final _that = this;
    switch (_that) {
      case CategoryFormInitial() when initial != null:
        return initial(_that);
      case CategoryFormEmptyName() when emptyName != null:
        return emptyName(_that);
      case CategoryFormSubmitting() when submitting != null:
        return submitting(_that);
      case CategoryFormSuccess() when success != null:
        return success(_that);
      case CategoryFormFailure() when failure != null:
        return failure(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? emptyName,
    TResult Function()? submitting,
    TResult Function(Category category)? success,
    TResult Function(Failure failure)? failure,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case CategoryFormInitial() when initial != null:
        return initial();
      case CategoryFormEmptyName() when emptyName != null:
        return emptyName();
      case CategoryFormSubmitting() when submitting != null:
        return submitting();
      case CategoryFormSuccess() when success != null:
        return success(_that.category);
      case CategoryFormFailure() when failure != null:
        return failure(_that.failure);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() emptyName,
    required TResult Function() submitting,
    required TResult Function(Category category) success,
    required TResult Function(Failure failure) failure,
  }) {
    final _that = this;
    switch (_that) {
      case CategoryFormInitial():
        return initial();
      case CategoryFormEmptyName():
        return emptyName();
      case CategoryFormSubmitting():
        return submitting();
      case CategoryFormSuccess():
        return success(_that.category);
      case CategoryFormFailure():
        return failure(_that.failure);
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? emptyName,
    TResult? Function()? submitting,
    TResult? Function(Category category)? success,
    TResult? Function(Failure failure)? failure,
  }) {
    final _that = this;
    switch (_that) {
      case CategoryFormInitial() when initial != null:
        return initial();
      case CategoryFormEmptyName() when emptyName != null:
        return emptyName();
      case CategoryFormSubmitting() when submitting != null:
        return submitting();
      case CategoryFormSuccess() when success != null:
        return success(_that.category);
      case CategoryFormFailure() when failure != null:
        return failure(_that.failure);
      case _:
        return null;
    }
  }
}

/// @nodoc

class CategoryFormInitial implements CategoryFormState {
  const CategoryFormInitial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CategoryFormInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CategoryFormState.initial()';
  }
}

/// @nodoc

class CategoryFormEmptyName implements CategoryFormState {
  const CategoryFormEmptyName();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CategoryFormEmptyName);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CategoryFormState.emptyName()';
  }
}

/// @nodoc

class CategoryFormSubmitting implements CategoryFormState {
  const CategoryFormSubmitting();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CategoryFormSubmitting);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CategoryFormState.submitting()';
  }
}

/// @nodoc

class CategoryFormSuccess implements CategoryFormState {
  const CategoryFormSuccess(this.category);

  final Category category;

  /// Create a copy of CategoryFormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CategoryFormSuccessCopyWith<CategoryFormSuccess> get copyWith =>
      _$CategoryFormSuccessCopyWithImpl<CategoryFormSuccess>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CategoryFormSuccess &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @override
  int get hashCode => Object.hash(runtimeType, category);

  @override
  String toString() {
    return 'CategoryFormState.success(category: $category)';
  }
}

/// @nodoc
abstract mixin class $CategoryFormSuccessCopyWith<$Res>
    implements $CategoryFormStateCopyWith<$Res> {
  factory $CategoryFormSuccessCopyWith(
          CategoryFormSuccess value, $Res Function(CategoryFormSuccess) _then) =
      _$CategoryFormSuccessCopyWithImpl;
  @useResult
  $Res call({Category category});
}

/// @nodoc
class _$CategoryFormSuccessCopyWithImpl<$Res>
    implements $CategoryFormSuccessCopyWith<$Res> {
  _$CategoryFormSuccessCopyWithImpl(this._self, this._then);

  final CategoryFormSuccess _self;
  final $Res Function(CategoryFormSuccess) _then;

  /// Create a copy of CategoryFormState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? category = null,
  }) {
    return _then(CategoryFormSuccess(
      null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category,
    ));
  }
}

/// @nodoc

class CategoryFormFailure implements CategoryFormState {
  const CategoryFormFailure(this.failure);

  final Failure failure;

  /// Create a copy of CategoryFormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CategoryFormFailureCopyWith<CategoryFormFailure> get copyWith =>
      _$CategoryFormFailureCopyWithImpl<CategoryFormFailure>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CategoryFormFailure &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failure);

  @override
  String toString() {
    return 'CategoryFormState.failure(failure: $failure)';
  }
}

/// @nodoc
abstract mixin class $CategoryFormFailureCopyWith<$Res>
    implements $CategoryFormStateCopyWith<$Res> {
  factory $CategoryFormFailureCopyWith(
          CategoryFormFailure value, $Res Function(CategoryFormFailure) _then) =
      _$CategoryFormFailureCopyWithImpl;
  @useResult
  $Res call({Failure failure});
}

/// @nodoc
class _$CategoryFormFailureCopyWithImpl<$Res>
    implements $CategoryFormFailureCopyWith<$Res> {
  _$CategoryFormFailureCopyWithImpl(this._self, this._then);

  final CategoryFormFailure _self;
  final $Res Function(CategoryFormFailure) _then;

  /// Create a copy of CategoryFormState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? failure = null,
  }) {
    return _then(CategoryFormFailure(
      null == failure
          ? _self.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
    ));
  }
}

// dart format on
