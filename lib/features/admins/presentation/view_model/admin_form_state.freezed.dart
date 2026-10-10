// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AdminFormState {

 SubmissionStatus get submission;/// Adresy z ostatniego zapisu, na które nie poszło wygenerowane hasło.
 List<String> get passwordEmailFailed;
/// Create a copy of AdminFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AdminFormStateCopyWith<AdminFormState> get copyWith => _$AdminFormStateCopyWithImpl<AdminFormState>(this as AdminFormState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AdminFormState&&(identical(other.submission, submission) || other.submission == submission)&&const DeepCollectionEquality().equals(other.passwordEmailFailed, passwordEmailFailed));
}


@override
int get hashCode => Object.hash(runtimeType,submission,const DeepCollectionEquality().hash(passwordEmailFailed));

@override
String toString() {
  return 'AdminFormState(submission: $submission, passwordEmailFailed: $passwordEmailFailed)';
}


}

/// @nodoc
abstract mixin class $AdminFormStateCopyWith<$Res>  {
  factory $AdminFormStateCopyWith(AdminFormState value, $Res Function(AdminFormState) _then) = _$AdminFormStateCopyWithImpl;
@useResult
$Res call({
 SubmissionStatus submission, List<String> passwordEmailFailed
});


$SubmissionStatusCopyWith<$Res> get submission;

}
/// @nodoc
class _$AdminFormStateCopyWithImpl<$Res>
    implements $AdminFormStateCopyWith<$Res> {
  _$AdminFormStateCopyWithImpl(this._self, this._then);

  final AdminFormState _self;
  final $Res Function(AdminFormState) _then;

/// Create a copy of AdminFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? submission = null,Object? passwordEmailFailed = null,}) {
  return _then(_self.copyWith(
submission: null == submission ? _self.submission : submission // ignore: cast_nullable_to_non_nullable
as SubmissionStatus,passwordEmailFailed: null == passwordEmailFailed ? _self.passwordEmailFailed : passwordEmailFailed // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}
/// Create a copy of AdminFormState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SubmissionStatusCopyWith<$Res> get submission {
  
  return $SubmissionStatusCopyWith<$Res>(_self.submission, (value) {
    return _then(_self.copyWith(submission: value));
  });
}
}


/// Adds pattern-matching-related methods to [AdminFormState].
extension AdminFormStatePatterns on AdminFormState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AdminFormState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AdminFormState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AdminFormState value)  $default,){
final _that = this;
switch (_that) {
case _AdminFormState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AdminFormState value)?  $default,){
final _that = this;
switch (_that) {
case _AdminFormState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SubmissionStatus submission,  List<String> passwordEmailFailed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AdminFormState() when $default != null:
return $default(_that.submission,_that.passwordEmailFailed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SubmissionStatus submission,  List<String> passwordEmailFailed)  $default,) {final _that = this;
switch (_that) {
case _AdminFormState():
return $default(_that.submission,_that.passwordEmailFailed);case _:
  throw StateError('Unexpected subclass');

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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SubmissionStatus submission,  List<String> passwordEmailFailed)?  $default,) {final _that = this;
switch (_that) {
case _AdminFormState() when $default != null:
return $default(_that.submission,_that.passwordEmailFailed);case _:
  return null;

}
}

}

/// @nodoc


class _AdminFormState implements AdminFormState {
  const _AdminFormState({this.submission = const SubmissionStatus.idle(), final  List<String> passwordEmailFailed = const <String>[]}): _passwordEmailFailed = passwordEmailFailed;
  

@override@JsonKey() final  SubmissionStatus submission;
/// Adresy z ostatniego zapisu, na które nie poszło wygenerowane hasło.
 final  List<String> _passwordEmailFailed;
/// Adresy z ostatniego zapisu, na które nie poszło wygenerowane hasło.
@override@JsonKey() List<String> get passwordEmailFailed {
  if (_passwordEmailFailed is EqualUnmodifiableListView) return _passwordEmailFailed;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_passwordEmailFailed);
}


/// Create a copy of AdminFormState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AdminFormStateCopyWith<_AdminFormState> get copyWith => __$AdminFormStateCopyWithImpl<_AdminFormState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AdminFormState&&(identical(other.submission, submission) || other.submission == submission)&&const DeepCollectionEquality().equals(other._passwordEmailFailed, _passwordEmailFailed));
}


@override
int get hashCode => Object.hash(runtimeType,submission,const DeepCollectionEquality().hash(_passwordEmailFailed));

@override
String toString() {
  return 'AdminFormState(submission: $submission, passwordEmailFailed: $passwordEmailFailed)';
}


}

/// @nodoc
abstract mixin class _$AdminFormStateCopyWith<$Res> implements $AdminFormStateCopyWith<$Res> {
  factory _$AdminFormStateCopyWith(_AdminFormState value, $Res Function(_AdminFormState) _then) = __$AdminFormStateCopyWithImpl;
@override @useResult
$Res call({
 SubmissionStatus submission, List<String> passwordEmailFailed
});


@override $SubmissionStatusCopyWith<$Res> get submission;

}
/// @nodoc
class __$AdminFormStateCopyWithImpl<$Res>
    implements _$AdminFormStateCopyWith<$Res> {
  __$AdminFormStateCopyWithImpl(this._self, this._then);

  final _AdminFormState _self;
  final $Res Function(_AdminFormState) _then;

/// Create a copy of AdminFormState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? submission = null,Object? passwordEmailFailed = null,}) {
  return _then(_AdminFormState(
submission: null == submission ? _self.submission : submission // ignore: cast_nullable_to_non_nullable
as SubmissionStatus,passwordEmailFailed: null == passwordEmailFailed ? _self._passwordEmailFailed : passwordEmailFailed // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

/// Create a copy of AdminFormState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SubmissionStatusCopyWith<$Res> get submission {
  
  return $SubmissionStatusCopyWith<$Res>(_self.submission, (value) {
    return _then(_self.copyWith(submission: value));
  });
}
}

// dart format on
