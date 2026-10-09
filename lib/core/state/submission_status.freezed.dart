// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'submission_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SubmissionStatus {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubmissionStatus);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SubmissionStatus()';
}


}

/// @nodoc
class $SubmissionStatusCopyWith<$Res>  {
$SubmissionStatusCopyWith(SubmissionStatus _, $Res Function(SubmissionStatus) __);
}


/// Adds pattern-matching-related methods to [SubmissionStatus].
extension SubmissionStatusPatterns on SubmissionStatus {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SubmissionIdle value)?  idle,TResult Function( Submitting value)?  submitting,TResult Function( SubmissionSuccess value)?  success,TResult Function( SubmissionFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SubmissionIdle() when idle != null:
return idle(_that);case Submitting() when submitting != null:
return submitting(_that);case SubmissionSuccess() when success != null:
return success(_that);case SubmissionFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SubmissionIdle value)  idle,required TResult Function( Submitting value)  submitting,required TResult Function( SubmissionSuccess value)  success,required TResult Function( SubmissionFailure value)  failure,}){
final _that = this;
switch (_that) {
case SubmissionIdle():
return idle(_that);case Submitting():
return submitting(_that);case SubmissionSuccess():
return success(_that);case SubmissionFailure():
return failure(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SubmissionIdle value)?  idle,TResult? Function( Submitting value)?  submitting,TResult? Function( SubmissionSuccess value)?  success,TResult? Function( SubmissionFailure value)?  failure,}){
final _that = this;
switch (_that) {
case SubmissionIdle() when idle != null:
return idle(_that);case Submitting() when submitting != null:
return submitting(_that);case SubmissionSuccess() when success != null:
return success(_that);case SubmissionFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  idle,TResult Function()?  submitting,TResult Function()?  success,TResult Function( Failure failure)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SubmissionIdle() when idle != null:
return idle();case Submitting() when submitting != null:
return submitting();case SubmissionSuccess() when success != null:
return success();case SubmissionFailure() when failure != null:
return failure(_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  idle,required TResult Function()  submitting,required TResult Function()  success,required TResult Function( Failure failure)  failure,}) {final _that = this;
switch (_that) {
case SubmissionIdle():
return idle();case Submitting():
return submitting();case SubmissionSuccess():
return success();case SubmissionFailure():
return failure(_that.failure);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  idle,TResult? Function()?  submitting,TResult? Function()?  success,TResult? Function( Failure failure)?  failure,}) {final _that = this;
switch (_that) {
case SubmissionIdle() when idle != null:
return idle();case Submitting() when submitting != null:
return submitting();case SubmissionSuccess() when success != null:
return success();case SubmissionFailure() when failure != null:
return failure(_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class SubmissionIdle implements SubmissionStatus {
  const SubmissionIdle();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubmissionIdle);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SubmissionStatus.idle()';
}


}




/// @nodoc


class Submitting implements SubmissionStatus {
  const Submitting();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Submitting);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SubmissionStatus.submitting()';
}


}




/// @nodoc


class SubmissionSuccess implements SubmissionStatus {
  const SubmissionSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubmissionSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SubmissionStatus.success()';
}


}




/// @nodoc


class SubmissionFailure implements SubmissionStatus {
  const SubmissionFailure(this.failure);
  

 final  Failure failure;

/// Create a copy of SubmissionStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubmissionFailureCopyWith<SubmissionFailure> get copyWith => _$SubmissionFailureCopyWithImpl<SubmissionFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubmissionFailure&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'SubmissionStatus.failure(failure: $failure)';
}


}

/// @nodoc
abstract mixin class $SubmissionFailureCopyWith<$Res> implements $SubmissionStatusCopyWith<$Res> {
  factory $SubmissionFailureCopyWith(SubmissionFailure value, $Res Function(SubmissionFailure) _then) = _$SubmissionFailureCopyWithImpl;
@useResult
$Res call({
 Failure failure
});




}
/// @nodoc
class _$SubmissionFailureCopyWithImpl<$Res>
    implements $SubmissionFailureCopyWith<$Res> {
  _$SubmissionFailureCopyWithImpl(this._self, this._then);

  final SubmissionFailure _self;
  final $Res Function(SubmissionFailure) _then;

/// Create a copy of SubmissionStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(SubmissionFailure(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}


}

// dart format on
