// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reset_password_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ResetPasswordState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResetPasswordState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ResetPasswordState()';
}


}

/// @nodoc
class $ResetPasswordStateCopyWith<$Res>  {
$ResetPasswordStateCopyWith(ResetPasswordState _, $Res Function(ResetPasswordState) __);
}


/// Adds pattern-matching-related methods to [ResetPasswordState].
extension ResetPasswordStatePatterns on ResetPasswordState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ResetPasswordInitial value)?  initial,TResult Function( ResetPasswordInvalidEmail value)?  invalidEmail,TResult Function( ResetPasswordSubmitting value)?  submitting,TResult Function( ResetPasswordAwaitingCode value)?  awaitingCode,TResult Function( ResetPasswordSent value)?  sent,TResult Function( ResetPasswordFailed value)?  failed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ResetPasswordInitial() when initial != null:
return initial(_that);case ResetPasswordInvalidEmail() when invalidEmail != null:
return invalidEmail(_that);case ResetPasswordSubmitting() when submitting != null:
return submitting(_that);case ResetPasswordAwaitingCode() when awaitingCode != null:
return awaitingCode(_that);case ResetPasswordSent() when sent != null:
return sent(_that);case ResetPasswordFailed() when failed != null:
return failed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ResetPasswordInitial value)  initial,required TResult Function( ResetPasswordInvalidEmail value)  invalidEmail,required TResult Function( ResetPasswordSubmitting value)  submitting,required TResult Function( ResetPasswordAwaitingCode value)  awaitingCode,required TResult Function( ResetPasswordSent value)  sent,required TResult Function( ResetPasswordFailed value)  failed,}){
final _that = this;
switch (_that) {
case ResetPasswordInitial():
return initial(_that);case ResetPasswordInvalidEmail():
return invalidEmail(_that);case ResetPasswordSubmitting():
return submitting(_that);case ResetPasswordAwaitingCode():
return awaitingCode(_that);case ResetPasswordSent():
return sent(_that);case ResetPasswordFailed():
return failed(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ResetPasswordInitial value)?  initial,TResult? Function( ResetPasswordInvalidEmail value)?  invalidEmail,TResult? Function( ResetPasswordSubmitting value)?  submitting,TResult? Function( ResetPasswordAwaitingCode value)?  awaitingCode,TResult? Function( ResetPasswordSent value)?  sent,TResult? Function( ResetPasswordFailed value)?  failed,}){
final _that = this;
switch (_that) {
case ResetPasswordInitial() when initial != null:
return initial(_that);case ResetPasswordInvalidEmail() when invalidEmail != null:
return invalidEmail(_that);case ResetPasswordSubmitting() when submitting != null:
return submitting(_that);case ResetPasswordAwaitingCode() when awaitingCode != null:
return awaitingCode(_that);case ResetPasswordSent() when sent != null:
return sent(_that);case ResetPasswordFailed() when failed != null:
return failed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  invalidEmail,TResult Function()?  submitting,TResult Function( String requestId,  bool submitting,  ResetCodeError? error)?  awaitingCode,TResult Function()?  sent,TResult Function()?  failed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ResetPasswordInitial() when initial != null:
return initial();case ResetPasswordInvalidEmail() when invalidEmail != null:
return invalidEmail();case ResetPasswordSubmitting() when submitting != null:
return submitting();case ResetPasswordAwaitingCode() when awaitingCode != null:
return awaitingCode(_that.requestId,_that.submitting,_that.error);case ResetPasswordSent() when sent != null:
return sent();case ResetPasswordFailed() when failed != null:
return failed();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  invalidEmail,required TResult Function()  submitting,required TResult Function( String requestId,  bool submitting,  ResetCodeError? error)  awaitingCode,required TResult Function()  sent,required TResult Function()  failed,}) {final _that = this;
switch (_that) {
case ResetPasswordInitial():
return initial();case ResetPasswordInvalidEmail():
return invalidEmail();case ResetPasswordSubmitting():
return submitting();case ResetPasswordAwaitingCode():
return awaitingCode(_that.requestId,_that.submitting,_that.error);case ResetPasswordSent():
return sent();case ResetPasswordFailed():
return failed();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  invalidEmail,TResult? Function()?  submitting,TResult? Function( String requestId,  bool submitting,  ResetCodeError? error)?  awaitingCode,TResult? Function()?  sent,TResult? Function()?  failed,}) {final _that = this;
switch (_that) {
case ResetPasswordInitial() when initial != null:
return initial();case ResetPasswordInvalidEmail() when invalidEmail != null:
return invalidEmail();case ResetPasswordSubmitting() when submitting != null:
return submitting();case ResetPasswordAwaitingCode() when awaitingCode != null:
return awaitingCode(_that.requestId,_that.submitting,_that.error);case ResetPasswordSent() when sent != null:
return sent();case ResetPasswordFailed() when failed != null:
return failed();case _:
  return null;

}
}

}

/// @nodoc


class ResetPasswordInitial implements ResetPasswordState {
  const ResetPasswordInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResetPasswordInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ResetPasswordState.initial()';
}


}




/// @nodoc


class ResetPasswordInvalidEmail implements ResetPasswordState {
  const ResetPasswordInvalidEmail();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResetPasswordInvalidEmail);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ResetPasswordState.invalidEmail()';
}


}




/// @nodoc


class ResetPasswordSubmitting implements ResetPasswordState {
  const ResetPasswordSubmitting();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResetPasswordSubmitting);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ResetPasswordState.submitting()';
}


}




/// @nodoc


class ResetPasswordAwaitingCode implements ResetPasswordState {
  const ResetPasswordAwaitingCode({required this.requestId, this.submitting = false, this.error});
  

 final  String requestId;
@JsonKey() final  bool submitting;
 final  ResetCodeError? error;

/// Create a copy of ResetPasswordState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResetPasswordAwaitingCodeCopyWith<ResetPasswordAwaitingCode> get copyWith => _$ResetPasswordAwaitingCodeCopyWithImpl<ResetPasswordAwaitingCode>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResetPasswordAwaitingCode&&(identical(other.requestId, requestId) || other.requestId == requestId)&&(identical(other.submitting, submitting) || other.submitting == submitting)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,requestId,submitting,error);

@override
String toString() {
  return 'ResetPasswordState.awaitingCode(requestId: $requestId, submitting: $submitting, error: $error)';
}


}

/// @nodoc
abstract mixin class $ResetPasswordAwaitingCodeCopyWith<$Res> implements $ResetPasswordStateCopyWith<$Res> {
  factory $ResetPasswordAwaitingCodeCopyWith(ResetPasswordAwaitingCode value, $Res Function(ResetPasswordAwaitingCode) _then) = _$ResetPasswordAwaitingCodeCopyWithImpl;
@useResult
$Res call({
 String requestId, bool submitting, ResetCodeError? error
});




}
/// @nodoc
class _$ResetPasswordAwaitingCodeCopyWithImpl<$Res>
    implements $ResetPasswordAwaitingCodeCopyWith<$Res> {
  _$ResetPasswordAwaitingCodeCopyWithImpl(this._self, this._then);

  final ResetPasswordAwaitingCode _self;
  final $Res Function(ResetPasswordAwaitingCode) _then;

/// Create a copy of ResetPasswordState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? requestId = null,Object? submitting = null,Object? error = freezed,}) {
  return _then(ResetPasswordAwaitingCode(
requestId: null == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String,submitting: null == submitting ? _self.submitting : submitting // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ResetCodeError?,
  ));
}


}

/// @nodoc


class ResetPasswordSent implements ResetPasswordState {
  const ResetPasswordSent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResetPasswordSent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ResetPasswordState.sent()';
}


}




/// @nodoc


class ResetPasswordFailed implements ResetPasswordState {
  const ResetPasswordFailed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResetPasswordFailed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ResetPasswordState.failed()';
}


}




// dart format on
