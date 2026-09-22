// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'companies_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CompaniesState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CompaniesState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CompaniesState()';
  }
}

/// @nodoc
class $CompaniesStateCopyWith<$Res> {
  $CompaniesStateCopyWith(CompaniesState _, $Res Function(CompaniesState) __);
}

/// Adds pattern-matching-related methods to [CompaniesState].
extension CompaniesStatePatterns on CompaniesState {
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
    TResult Function(CompaniesLoading value)? loading,
    TResult Function(CompaniesLoaded value)? loaded,
    TResult Function(CompaniesError value)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case CompaniesLoading() when loading != null:
        return loading(_that);
      case CompaniesLoaded() when loaded != null:
        return loaded(_that);
      case CompaniesError() when error != null:
        return error(_that);
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
    required TResult Function(CompaniesLoading value) loading,
    required TResult Function(CompaniesLoaded value) loaded,
    required TResult Function(CompaniesError value) error,
  }) {
    final _that = this;
    switch (_that) {
      case CompaniesLoading():
        return loading(_that);
      case CompaniesLoaded():
        return loaded(_that);
      case CompaniesError():
        return error(_that);
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
    TResult? Function(CompaniesLoading value)? loading,
    TResult? Function(CompaniesLoaded value)? loaded,
    TResult? Function(CompaniesError value)? error,
  }) {
    final _that = this;
    switch (_that) {
      case CompaniesLoading() when loading != null:
        return loading(_that);
      case CompaniesLoaded() when loaded != null:
        return loaded(_that);
      case CompaniesError() when error != null:
        return error(_that);
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
    TResult Function()? loading,
    TResult Function(List<Company> companies, int? selectedId)? loaded,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case CompaniesLoading() when loading != null:
        return loading();
      case CompaniesLoaded() when loaded != null:
        return loaded(_that.companies, _that.selectedId);
      case CompaniesError() when error != null:
        return error(_that.failure);
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
    required TResult Function() loading,
    required TResult Function(List<Company> companies, int? selectedId) loaded,
    required TResult Function(Failure failure) error,
  }) {
    final _that = this;
    switch (_that) {
      case CompaniesLoading():
        return loading();
      case CompaniesLoaded():
        return loaded(_that.companies, _that.selectedId);
      case CompaniesError():
        return error(_that.failure);
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
    TResult? Function()? loading,
    TResult? Function(List<Company> companies, int? selectedId)? loaded,
    TResult? Function(Failure failure)? error,
  }) {
    final _that = this;
    switch (_that) {
      case CompaniesLoading() when loading != null:
        return loading();
      case CompaniesLoaded() when loaded != null:
        return loaded(_that.companies, _that.selectedId);
      case CompaniesError() when error != null:
        return error(_that.failure);
      case _:
        return null;
    }
  }
}

/// @nodoc

class CompaniesLoading implements CompaniesState {
  const CompaniesLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CompaniesLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CompaniesState.loading()';
  }
}

/// @nodoc

class CompaniesLoaded implements CompaniesState {
  const CompaniesLoaded(
      {required final List<Company> companies, this.selectedId})
      : _companies = companies;

  final List<Company> _companies;
  List<Company> get companies {
    if (_companies is EqualUnmodifiableListView) return _companies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_companies);
  }

  final int? selectedId;

  /// Create a copy of CompaniesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CompaniesLoadedCopyWith<CompaniesLoaded> get copyWith =>
      _$CompaniesLoadedCopyWithImpl<CompaniesLoaded>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CompaniesLoaded &&
            const DeepCollectionEquality()
                .equals(other._companies, _companies) &&
            (identical(other.selectedId, selectedId) ||
                other.selectedId == selectedId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_companies), selectedId);

  @override
  String toString() {
    return 'CompaniesState.loaded(companies: $companies, selectedId: $selectedId)';
  }
}

/// @nodoc
abstract mixin class $CompaniesLoadedCopyWith<$Res>
    implements $CompaniesStateCopyWith<$Res> {
  factory $CompaniesLoadedCopyWith(
          CompaniesLoaded value, $Res Function(CompaniesLoaded) _then) =
      _$CompaniesLoadedCopyWithImpl;
  @useResult
  $Res call({List<Company> companies, int? selectedId});
}

/// @nodoc
class _$CompaniesLoadedCopyWithImpl<$Res>
    implements $CompaniesLoadedCopyWith<$Res> {
  _$CompaniesLoadedCopyWithImpl(this._self, this._then);

  final CompaniesLoaded _self;
  final $Res Function(CompaniesLoaded) _then;

  /// Create a copy of CompaniesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? companies = null,
    Object? selectedId = freezed,
  }) {
    return _then(CompaniesLoaded(
      companies: null == companies
          ? _self._companies
          : companies // ignore: cast_nullable_to_non_nullable
              as List<Company>,
      selectedId: freezed == selectedId
          ? _self.selectedId
          : selectedId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class CompaniesError implements CompaniesState {
  const CompaniesError(this.failure);

  final Failure failure;

  /// Create a copy of CompaniesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CompaniesErrorCopyWith<CompaniesError> get copyWith =>
      _$CompaniesErrorCopyWithImpl<CompaniesError>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CompaniesError &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failure);

  @override
  String toString() {
    return 'CompaniesState.error(failure: $failure)';
  }
}

/// @nodoc
abstract mixin class $CompaniesErrorCopyWith<$Res>
    implements $CompaniesStateCopyWith<$Res> {
  factory $CompaniesErrorCopyWith(
          CompaniesError value, $Res Function(CompaniesError) _then) =
      _$CompaniesErrorCopyWithImpl;
  @useResult
  $Res call({Failure failure});
}

/// @nodoc
class _$CompaniesErrorCopyWithImpl<$Res>
    implements $CompaniesErrorCopyWith<$Res> {
  _$CompaniesErrorCopyWithImpl(this._self, this._then);

  final CompaniesError _self;
  final $Res Function(CompaniesError) _then;

  /// Create a copy of CompaniesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? failure = null,
  }) {
    return _then(CompaniesError(
      null == failure
          ? _self.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
    ));
  }
}

// dart format on
