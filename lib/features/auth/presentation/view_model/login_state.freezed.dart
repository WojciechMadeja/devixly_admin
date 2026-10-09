// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LoginState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginState()';
}


}

/// @nodoc
class $LoginStateCopyWith<$Res>  {
$LoginStateCopyWith(LoginState _, $Res Function(LoginState) __);
}


/// Adds pattern-matching-related methods to [LoginState].
extension LoginStatePatterns on LoginState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoginInitial value)?  initial,TResult Function( LoginEmptyFields value)?  emptyFields,TResult Function( LoginInvalidEmail value)?  invalidEmail,TResult Function( LoginSubmitting value)?  submitting,TResult Function( LoginSuccess value)?  success,TResult Function( LoginFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoginInitial() when initial != null:
return initial(_that);case LoginEmptyFields() when emptyFields != null:
return emptyFields(_that);case LoginInvalidEmail() when invalidEmail != null:
return invalidEmail(_that);case LoginSubmitting() when submitting != null:
return submitting(_that);case LoginSuccess() when success != null:
return success(_that);case LoginFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoginInitial value)  initial,required TResult Function( LoginEmptyFields value)  emptyFields,required TResult Function( LoginInvalidEmail value)  invalidEmail,required TResult Function( LoginSubmitting value)  submitting,required TResult Function( LoginSuccess value)  success,required TResult Function( LoginFailure value)  failure,}){
final _that = this;
switch (_that) {
case LoginInitial():
return initial(_that);case LoginEmptyFields():
return emptyFields(_that);case LoginInvalidEmail():
return invalidEmail(_that);case LoginSubmitting():
return submitting(_that);case LoginSuccess():
return success(_that);case LoginFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoginInitial value)?  initial,TResult? Function( LoginEmptyFields value)?  emptyFields,TResult? Function( LoginInvalidEmail value)?  invalidEmail,TResult? Function( LoginSubmitting value)?  submitting,TResult? Function( LoginSuccess value)?  success,TResult? Function( LoginFailure value)?  failure,}){
final _that = this;
switch (_that) {
case LoginInitial() when initial != null:
return initial(_that);case LoginEmptyFields() when emptyFields != null:
return emptyFields(_that);case LoginInvalidEmail() when invalidEmail != null:
return invalidEmail(_that);case LoginSubmitting() when submitting != null:
return submitting(_that);case LoginSuccess() when success != null:
return success(_that);case LoginFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  emptyFields,TResult Function()?  invalidEmail,TResult Function()?  submitting,TResult Function()?  success,TResult Function( Failure failure)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoginInitial() when initial != null:
return initial();case LoginEmptyFields() when emptyFields != null:
return emptyFields();case LoginInvalidEmail() when invalidEmail != null:
return invalidEmail();case LoginSubmitting() when submitting != null:
return submitting();case LoginSuccess() when success != null:
return success();case LoginFailure() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  emptyFields,required TResult Function()  invalidEmail,required TResult Function()  submitting,required TResult Function()  success,required TResult Function( Failure failure)  failure,}) {final _that = this;
switch (_that) {
case LoginInitial():
return initial();case LoginEmptyFields():
return emptyFields();case LoginInvalidEmail():
return invalidEmail();case LoginSubmitting():
return submitting();case LoginSuccess():
return success();case LoginFailure():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  emptyFields,TResult? Function()?  invalidEmail,TResult? Function()?  submitting,TResult? Function()?  success,TResult? Function( Failure failure)?  failure,}) {final _that = this;
switch (_that) {
case LoginInitial() when initial != null:
return initial();case LoginEmptyFields() when emptyFields != null:
return emptyFields();case LoginInvalidEmail() when invalidEmail != null:
return invalidEmail();case LoginSubmitting() when submitting != null:
return submitting();case LoginSuccess() when success != null:
return success();case LoginFailure() when failure != null:
return failure(_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class LoginInitial implements LoginState {
  const LoginInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginState.initial()';
}


}




/// @nodoc


class LoginEmptyFields implements LoginState {
  const LoginEmptyFields();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginEmptyFields);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginState.emptyFields()';
}


}




/// @nodoc


class LoginInvalidEmail implements LoginState {
  const LoginInvalidEmail();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginInvalidEmail);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginState.invalidEmail()';
}


}




/// @nodoc


class LoginSubmitting implements LoginState {
  const LoginSubmitting();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginSubmitting);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginState.submitting()';
}


}




/// @nodoc


class LoginSuccess implements LoginState {
  const LoginSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginState.success()';
}


}




/// @nodoc


class LoginFailure implements LoginState {
  const LoginFailure(this.failure);
  

 final  Failure failure;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginFailureCopyWith<LoginFailure> get copyWith => _$LoginFailureCopyWithImpl<LoginFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginFailure&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'LoginState.failure(failure: $failure)';
}


}

/// @nodoc
abstract mixin class $LoginFailureCopyWith<$Res> implements $LoginStateCopyWith<$Res> {
  factory $LoginFailureCopyWith(LoginFailure value, $Res Function(LoginFailure) _then) = _$LoginFailureCopyWithImpl;
@useResult
$Res call({
 Failure failure
});




}
/// @nodoc
class _$LoginFailureCopyWithImpl<$Res>
    implements $LoginFailureCopyWith<$Res> {
  _$LoginFailureCopyWithImpl(this._self, this._then);

  final LoginFailure _self;
  final $Res Function(LoginFailure) _then;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(LoginFailure(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}


}

// dart format on
