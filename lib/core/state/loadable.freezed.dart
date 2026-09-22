// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'loadable.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Loadable<T> {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Loadable<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'Loadable<$T>()';
  }
}

/// @nodoc
class $LoadableCopyWith<T, $Res> {
  $LoadableCopyWith(Loadable<T> _, $Res Function(Loadable<T>) __);
}

/// Adds pattern-matching-related methods to [Loadable].
extension LoadablePatterns<T> on Loadable<T> {
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
    TResult Function(Loading<T> value)? loading,
    TResult Function(Loaded<T> value)? loaded,
    TResult Function(LoadError<T> value)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case Loading() when loading != null:
        return loading(_that);
      case Loaded() when loaded != null:
        return loaded(_that);
      case LoadError() when error != null:
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
    required TResult Function(Loading<T> value) loading,
    required TResult Function(Loaded<T> value) loaded,
    required TResult Function(LoadError<T> value) error,
  }) {
    final _that = this;
    switch (_that) {
      case Loading():
        return loading(_that);
      case Loaded():
        return loaded(_that);
      case LoadError():
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
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(Loaded<T> value)? loaded,
    TResult? Function(LoadError<T> value)? error,
  }) {
    final _that = this;
    switch (_that) {
      case Loading() when loading != null:
        return loading(_that);
      case Loaded() when loaded != null:
        return loaded(_that);
      case LoadError() when error != null:
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
    TResult Function(T value)? loaded,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case Loading() when loading != null:
        return loading();
      case Loaded() when loaded != null:
        return loaded(_that.value);
      case LoadError() when error != null:
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
    required TResult Function(T value) loaded,
    required TResult Function(Failure failure) error,
  }) {
    final _that = this;
    switch (_that) {
      case Loading():
        return loading();
      case Loaded():
        return loaded(_that.value);
      case LoadError():
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
    TResult? Function(T value)? loaded,
    TResult? Function(Failure failure)? error,
  }) {
    final _that = this;
    switch (_that) {
      case Loading() when loading != null:
        return loading();
      case Loaded() when loaded != null:
        return loaded(_that.value);
      case LoadError() when error != null:
        return error(_that.failure);
      case _:
        return null;
    }
  }
}

/// @nodoc

class Loading<T> implements Loadable<T> {
  const Loading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Loading<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'Loadable<$T>.loading()';
  }
}

/// @nodoc

class Loaded<T> implements Loadable<T> {
  const Loaded(this.value);

  final T value;

  /// Create a copy of Loadable
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LoadedCopyWith<T, Loaded<T>> get copyWith =>
      _$LoadedCopyWithImpl<T, Loaded<T>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Loaded<T> &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  @override
  String toString() {
    return 'Loadable<$T>.loaded(value: $value)';
  }
}

/// @nodoc
abstract mixin class $LoadedCopyWith<T, $Res>
    implements $LoadableCopyWith<T, $Res> {
  factory $LoadedCopyWith(Loaded<T> value, $Res Function(Loaded<T>) _then) =
      _$LoadedCopyWithImpl;
  @useResult
  $Res call({T value});
}

/// @nodoc
class _$LoadedCopyWithImpl<T, $Res> implements $LoadedCopyWith<T, $Res> {
  _$LoadedCopyWithImpl(this._self, this._then);

  final Loaded<T> _self;
  final $Res Function(Loaded<T>) _then;

  /// Create a copy of Loadable
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? value = freezed,
  }) {
    return _then(Loaded<T>(
      freezed == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class LoadError<T> implements Loadable<T> {
  const LoadError(this.failure);

  final Failure failure;

  /// Create a copy of Loadable
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LoadErrorCopyWith<T, LoadError<T>> get copyWith =>
      _$LoadErrorCopyWithImpl<T, LoadError<T>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoadError<T> &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failure);

  @override
  String toString() {
    return 'Loadable<$T>.error(failure: $failure)';
  }
}

/// @nodoc
abstract mixin class $LoadErrorCopyWith<T, $Res>
    implements $LoadableCopyWith<T, $Res> {
  factory $LoadErrorCopyWith(
          LoadError<T> value, $Res Function(LoadError<T>) _then) =
      _$LoadErrorCopyWithImpl;
  @useResult
  $Res call({Failure failure});
}

/// @nodoc
class _$LoadErrorCopyWithImpl<T, $Res> implements $LoadErrorCopyWith<T, $Res> {
  _$LoadErrorCopyWithImpl(this._self, this._then);

  final LoadError<T> _self;
  final $Res Function(LoadError<T>) _then;

  /// Create a copy of Loadable
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? failure = null,
  }) {
    return _then(LoadError<T>(
      null == failure
          ? _self.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
    ));
  }
}

// dart format on
