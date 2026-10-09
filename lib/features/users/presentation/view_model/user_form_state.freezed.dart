// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserFormState {

 Loadable<List<Company>> get companies; Company? get selectedCompany; SubmissionStatus get submission;
/// Create a copy of UserFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserFormStateCopyWith<UserFormState> get copyWith => _$UserFormStateCopyWithImpl<UserFormState>(this as UserFormState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserFormState&&(identical(other.companies, companies) || other.companies == companies)&&(identical(other.selectedCompany, selectedCompany) || other.selectedCompany == selectedCompany)&&(identical(other.submission, submission) || other.submission == submission));
}


@override
int get hashCode => Object.hash(runtimeType,companies,selectedCompany,submission);

@override
String toString() {
  return 'UserFormState(companies: $companies, selectedCompany: $selectedCompany, submission: $submission)';
}


}

/// @nodoc
abstract mixin class $UserFormStateCopyWith<$Res>  {
  factory $UserFormStateCopyWith(UserFormState value, $Res Function(UserFormState) _then) = _$UserFormStateCopyWithImpl;
@useResult
$Res call({
 Loadable<List<Company>> companies, Company? selectedCompany, SubmissionStatus submission
});


$LoadableCopyWith<List<Company>, $Res> get companies;$SubmissionStatusCopyWith<$Res> get submission;

}
/// @nodoc
class _$UserFormStateCopyWithImpl<$Res>
    implements $UserFormStateCopyWith<$Res> {
  _$UserFormStateCopyWithImpl(this._self, this._then);

  final UserFormState _self;
  final $Res Function(UserFormState) _then;

/// Create a copy of UserFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? companies = null,Object? selectedCompany = freezed,Object? submission = null,}) {
  return _then(_self.copyWith(
companies: null == companies ? _self.companies : companies // ignore: cast_nullable_to_non_nullable
as Loadable<List<Company>>,selectedCompany: freezed == selectedCompany ? _self.selectedCompany : selectedCompany // ignore: cast_nullable_to_non_nullable
as Company?,submission: null == submission ? _self.submission : submission // ignore: cast_nullable_to_non_nullable
as SubmissionStatus,
  ));
}
/// Create a copy of UserFormState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LoadableCopyWith<List<Company>, $Res> get companies {
  
  return $LoadableCopyWith<List<Company>, $Res>(_self.companies, (value) {
    return _then(_self.copyWith(companies: value));
  });
}/// Create a copy of UserFormState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SubmissionStatusCopyWith<$Res> get submission {
  
  return $SubmissionStatusCopyWith<$Res>(_self.submission, (value) {
    return _then(_self.copyWith(submission: value));
  });
}
}


/// Adds pattern-matching-related methods to [UserFormState].
extension UserFormStatePatterns on UserFormState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserFormState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserFormState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserFormState value)  $default,){
final _that = this;
switch (_that) {
case _UserFormState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserFormState value)?  $default,){
final _that = this;
switch (_that) {
case _UserFormState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Loadable<List<Company>> companies,  Company? selectedCompany,  SubmissionStatus submission)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserFormState() when $default != null:
return $default(_that.companies,_that.selectedCompany,_that.submission);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Loadable<List<Company>> companies,  Company? selectedCompany,  SubmissionStatus submission)  $default,) {final _that = this;
switch (_that) {
case _UserFormState():
return $default(_that.companies,_that.selectedCompany,_that.submission);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Loadable<List<Company>> companies,  Company? selectedCompany,  SubmissionStatus submission)?  $default,) {final _that = this;
switch (_that) {
case _UserFormState() when $default != null:
return $default(_that.companies,_that.selectedCompany,_that.submission);case _:
  return null;

}
}

}

/// @nodoc


class _UserFormState implements UserFormState {
  const _UserFormState({this.companies = const Loadable<List<Company>>.loading(), this.selectedCompany, this.submission = const SubmissionStatus.idle()});
  

@override@JsonKey() final  Loadable<List<Company>> companies;
@override final  Company? selectedCompany;
@override@JsonKey() final  SubmissionStatus submission;

/// Create a copy of UserFormState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserFormStateCopyWith<_UserFormState> get copyWith => __$UserFormStateCopyWithImpl<_UserFormState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserFormState&&(identical(other.companies, companies) || other.companies == companies)&&(identical(other.selectedCompany, selectedCompany) || other.selectedCompany == selectedCompany)&&(identical(other.submission, submission) || other.submission == submission));
}


@override
int get hashCode => Object.hash(runtimeType,companies,selectedCompany,submission);

@override
String toString() {
  return 'UserFormState(companies: $companies, selectedCompany: $selectedCompany, submission: $submission)';
}


}

/// @nodoc
abstract mixin class _$UserFormStateCopyWith<$Res> implements $UserFormStateCopyWith<$Res> {
  factory _$UserFormStateCopyWith(_UserFormState value, $Res Function(_UserFormState) _then) = __$UserFormStateCopyWithImpl;
@override @useResult
$Res call({
 Loadable<List<Company>> companies, Company? selectedCompany, SubmissionStatus submission
});


@override $LoadableCopyWith<List<Company>, $Res> get companies;@override $SubmissionStatusCopyWith<$Res> get submission;

}
/// @nodoc
class __$UserFormStateCopyWithImpl<$Res>
    implements _$UserFormStateCopyWith<$Res> {
  __$UserFormStateCopyWithImpl(this._self, this._then);

  final _UserFormState _self;
  final $Res Function(_UserFormState) _then;

/// Create a copy of UserFormState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? companies = null,Object? selectedCompany = freezed,Object? submission = null,}) {
  return _then(_UserFormState(
companies: null == companies ? _self.companies : companies // ignore: cast_nullable_to_non_nullable
as Loadable<List<Company>>,selectedCompany: freezed == selectedCompany ? _self.selectedCompany : selectedCompany // ignore: cast_nullable_to_non_nullable
as Company?,submission: null == submission ? _self.submission : submission // ignore: cast_nullable_to_non_nullable
as SubmissionStatus,
  ));
}

/// Create a copy of UserFormState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LoadableCopyWith<List<Company>, $Res> get companies {
  
  return $LoadableCopyWith<List<Company>, $Res>(_self.companies, (value) {
    return _then(_self.copyWith(companies: value));
  });
}/// Create a copy of UserFormState
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
