// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_password_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpdatePasswordState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is UpdatePasswordState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'UpdatePasswordState()';
  }
}

/// @nodoc
class $UpdatePasswordStateCopyWith<$Res> {
  $UpdatePasswordStateCopyWith(
      UpdatePasswordState _, $Res Function(UpdatePasswordState) __);
}

/// Adds pattern-matching-related methods to [UpdatePasswordState].
extension UpdatePasswordStatePatterns on UpdatePasswordState {
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
    TResult Function(UpdatePasswordInitial value)? initial,
    TResult Function(UpdatePasswordEmptyFields value)? emptyFields,
    TResult Function(UpdatePasswordMismatch value)? mismatch,
    TResult Function(UpdatePasswordSubmitting value)? submitting,
    TResult Function(UpdatePasswordSuccess value)? success,
    TResult Function(UpdatePasswordFailure value)? failure,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case UpdatePasswordInitial() when initial != null:
        return initial(_that);
      case UpdatePasswordEmptyFields() when emptyFields != null:
        return emptyFields(_that);
      case UpdatePasswordMismatch() when mismatch != null:
        return mismatch(_that);
      case UpdatePasswordSubmitting() when submitting != null:
        return submitting(_that);
      case UpdatePasswordSuccess() when success != null:
        return success(_that);
      case UpdatePasswordFailure() when failure != null:
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
    required TResult Function(UpdatePasswordInitial value) initial,
    required TResult Function(UpdatePasswordEmptyFields value) emptyFields,
    required TResult Function(UpdatePasswordMismatch value) mismatch,
    required TResult Function(UpdatePasswordSubmitting value) submitting,
    required TResult Function(UpdatePasswordSuccess value) success,
    required TResult Function(UpdatePasswordFailure value) failure,
  }) {
    final _that = this;
    switch (_that) {
      case UpdatePasswordInitial():
        return initial(_that);
      case UpdatePasswordEmptyFields():
        return emptyFields(_that);
      case UpdatePasswordMismatch():
        return mismatch(_that);
      case UpdatePasswordSubmitting():
        return submitting(_that);
      case UpdatePasswordSuccess():
        return success(_that);
      case UpdatePasswordFailure():
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
    TResult? Function(UpdatePasswordInitial value)? initial,
    TResult? Function(UpdatePasswordEmptyFields value)? emptyFields,
    TResult? Function(UpdatePasswordMismatch value)? mismatch,
    TResult? Function(UpdatePasswordSubmitting value)? submitting,
    TResult? Function(UpdatePasswordSuccess value)? success,
    TResult? Function(UpdatePasswordFailure value)? failure,
  }) {
    final _that = this;
    switch (_that) {
      case UpdatePasswordInitial() when initial != null:
        return initial(_that);
      case UpdatePasswordEmptyFields() when emptyFields != null:
        return emptyFields(_that);
      case UpdatePasswordMismatch() when mismatch != null:
        return mismatch(_that);
      case UpdatePasswordSubmitting() when submitting != null:
        return submitting(_that);
      case UpdatePasswordSuccess() when success != null:
        return success(_that);
      case UpdatePasswordFailure() when failure != null:
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
    TResult Function()? emptyFields,
    TResult Function()? mismatch,
    TResult Function()? submitting,
    TResult Function()? success,
    TResult Function(Failure failure)? failure,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case UpdatePasswordInitial() when initial != null:
        return initial();
      case UpdatePasswordEmptyFields() when emptyFields != null:
        return emptyFields();
      case UpdatePasswordMismatch() when mismatch != null:
        return mismatch();
      case UpdatePasswordSubmitting() when submitting != null:
        return submitting();
      case UpdatePasswordSuccess() when success != null:
        return success();
      case UpdatePasswordFailure() when failure != null:
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
    required TResult Function() emptyFields,
    required TResult Function() mismatch,
    required TResult Function() submitting,
    required TResult Function() success,
    required TResult Function(Failure failure) failure,
  }) {
    final _that = this;
    switch (_that) {
      case UpdatePasswordInitial():
        return initial();
      case UpdatePasswordEmptyFields():
        return emptyFields();
      case UpdatePasswordMismatch():
        return mismatch();
      case UpdatePasswordSubmitting():
        return submitting();
      case UpdatePasswordSuccess():
        return success();
      case UpdatePasswordFailure():
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
    TResult? Function()? emptyFields,
    TResult? Function()? mismatch,
    TResult? Function()? submitting,
    TResult? Function()? success,
    TResult? Function(Failure failure)? failure,
  }) {
    final _that = this;
    switch (_that) {
      case UpdatePasswordInitial() when initial != null:
        return initial();
      case UpdatePasswordEmptyFields() when emptyFields != null:
        return emptyFields();
      case UpdatePasswordMismatch() when mismatch != null:
        return mismatch();
      case UpdatePasswordSubmitting() when submitting != null:
        return submitting();
      case UpdatePasswordSuccess() when success != null:
        return success();
      case UpdatePasswordFailure() when failure != null:
        return failure(_that.failure);
      case _:
        return null;
    }
  }
}

/// @nodoc

class UpdatePasswordInitial implements UpdatePasswordState {
  const UpdatePasswordInitial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is UpdatePasswordInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'UpdatePasswordState.initial()';
  }
}

/// @nodoc

class UpdatePasswordEmptyFields implements UpdatePasswordState {
  const UpdatePasswordEmptyFields();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpdatePasswordEmptyFields);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'UpdatePasswordState.emptyFields()';
  }
}

/// @nodoc

class UpdatePasswordMismatch implements UpdatePasswordState {
  const UpdatePasswordMismatch();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is UpdatePasswordMismatch);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'UpdatePasswordState.mismatch()';
  }
}

/// @nodoc

class UpdatePasswordSubmitting implements UpdatePasswordState {
  const UpdatePasswordSubmitting();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is UpdatePasswordSubmitting);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'UpdatePasswordState.submitting()';
  }
}

/// @nodoc

class UpdatePasswordSuccess implements UpdatePasswordState {
  const UpdatePasswordSuccess();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is UpdatePasswordSuccess);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'UpdatePasswordState.success()';
  }
}

/// @nodoc

class UpdatePasswordFailure implements UpdatePasswordState {
  const UpdatePasswordFailure(this.failure);

  final Failure failure;

  /// Create a copy of UpdatePasswordState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UpdatePasswordFailureCopyWith<UpdatePasswordFailure> get copyWith =>
      _$UpdatePasswordFailureCopyWithImpl<UpdatePasswordFailure>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpdatePasswordFailure &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failure);

  @override
  String toString() {
    return 'UpdatePasswordState.failure(failure: $failure)';
  }
}

/// @nodoc
abstract mixin class $UpdatePasswordFailureCopyWith<$Res>
    implements $UpdatePasswordStateCopyWith<$Res> {
  factory $UpdatePasswordFailureCopyWith(UpdatePasswordFailure value,
          $Res Function(UpdatePasswordFailure) _then) =
      _$UpdatePasswordFailureCopyWithImpl;
  @useResult
  $Res call({Failure failure});
}

/// @nodoc
class _$UpdatePasswordFailureCopyWithImpl<$Res>
    implements $UpdatePasswordFailureCopyWith<$Res> {
  _$UpdatePasswordFailureCopyWithImpl(this._self, this._then);

  final UpdatePasswordFailure _self;
  final $Res Function(UpdatePasswordFailure) _then;

  /// Create a copy of UpdatePasswordState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? failure = null,
  }) {
    return _then(UpdatePasswordFailure(
      null == failure
          ? _self.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
    ));
  }
}

// dart format on
