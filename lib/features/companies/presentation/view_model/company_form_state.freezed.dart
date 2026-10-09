// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'company_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CompanyFormState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompanyFormState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CompanyFormState()';
}


}

/// @nodoc
class $CompanyFormStateCopyWith<$Res>  {
$CompanyFormStateCopyWith(CompanyFormState _, $Res Function(CompanyFormState) __);
}


/// Adds pattern-matching-related methods to [CompanyFormState].
extension CompanyFormStatePatterns on CompanyFormState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CompanyFormInitial value)?  initial,TResult Function( CompanyFormEmptyName value)?  emptyName,TResult Function( CompanyFormSubmitting value)?  submitting,TResult Function( CompanyFormSuccess value)?  success,TResult Function( CompanyFormFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CompanyFormInitial() when initial != null:
return initial(_that);case CompanyFormEmptyName() when emptyName != null:
return emptyName(_that);case CompanyFormSubmitting() when submitting != null:
return submitting(_that);case CompanyFormSuccess() when success != null:
return success(_that);case CompanyFormFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CompanyFormInitial value)  initial,required TResult Function( CompanyFormEmptyName value)  emptyName,required TResult Function( CompanyFormSubmitting value)  submitting,required TResult Function( CompanyFormSuccess value)  success,required TResult Function( CompanyFormFailure value)  failure,}){
final _that = this;
switch (_that) {
case CompanyFormInitial():
return initial(_that);case CompanyFormEmptyName():
return emptyName(_that);case CompanyFormSubmitting():
return submitting(_that);case CompanyFormSuccess():
return success(_that);case CompanyFormFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CompanyFormInitial value)?  initial,TResult? Function( CompanyFormEmptyName value)?  emptyName,TResult? Function( CompanyFormSubmitting value)?  submitting,TResult? Function( CompanyFormSuccess value)?  success,TResult? Function( CompanyFormFailure value)?  failure,}){
final _that = this;
switch (_that) {
case CompanyFormInitial() when initial != null:
return initial(_that);case CompanyFormEmptyName() when emptyName != null:
return emptyName(_that);case CompanyFormSubmitting() when submitting != null:
return submitting(_that);case CompanyFormSuccess() when success != null:
return success(_that);case CompanyFormFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  emptyName,TResult Function()?  submitting,TResult Function( Company company)?  success,TResult Function( Failure failure)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CompanyFormInitial() when initial != null:
return initial();case CompanyFormEmptyName() when emptyName != null:
return emptyName();case CompanyFormSubmitting() when submitting != null:
return submitting();case CompanyFormSuccess() when success != null:
return success(_that.company);case CompanyFormFailure() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  emptyName,required TResult Function()  submitting,required TResult Function( Company company)  success,required TResult Function( Failure failure)  failure,}) {final _that = this;
switch (_that) {
case CompanyFormInitial():
return initial();case CompanyFormEmptyName():
return emptyName();case CompanyFormSubmitting():
return submitting();case CompanyFormSuccess():
return success(_that.company);case CompanyFormFailure():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  emptyName,TResult? Function()?  submitting,TResult? Function( Company company)?  success,TResult? Function( Failure failure)?  failure,}) {final _that = this;
switch (_that) {
case CompanyFormInitial() when initial != null:
return initial();case CompanyFormEmptyName() when emptyName != null:
return emptyName();case CompanyFormSubmitting() when submitting != null:
return submitting();case CompanyFormSuccess() when success != null:
return success(_that.company);case CompanyFormFailure() when failure != null:
return failure(_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class CompanyFormInitial implements CompanyFormState {
  const CompanyFormInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompanyFormInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CompanyFormState.initial()';
}


}




/// @nodoc


class CompanyFormEmptyName implements CompanyFormState {
  const CompanyFormEmptyName();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompanyFormEmptyName);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CompanyFormState.emptyName()';
}


}




/// @nodoc


class CompanyFormSubmitting implements CompanyFormState {
  const CompanyFormSubmitting();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompanyFormSubmitting);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CompanyFormState.submitting()';
}


}




/// @nodoc


class CompanyFormSuccess implements CompanyFormState {
  const CompanyFormSuccess(this.company);
  

 final  Company company;

/// Create a copy of CompanyFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CompanyFormSuccessCopyWith<CompanyFormSuccess> get copyWith => _$CompanyFormSuccessCopyWithImpl<CompanyFormSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompanyFormSuccess&&(identical(other.company, company) || other.company == company));
}


@override
int get hashCode => Object.hash(runtimeType,company);

@override
String toString() {
  return 'CompanyFormState.success(company: $company)';
}


}

/// @nodoc
abstract mixin class $CompanyFormSuccessCopyWith<$Res> implements $CompanyFormStateCopyWith<$Res> {
  factory $CompanyFormSuccessCopyWith(CompanyFormSuccess value, $Res Function(CompanyFormSuccess) _then) = _$CompanyFormSuccessCopyWithImpl;
@useResult
$Res call({
 Company company
});




}
/// @nodoc
class _$CompanyFormSuccessCopyWithImpl<$Res>
    implements $CompanyFormSuccessCopyWith<$Res> {
  _$CompanyFormSuccessCopyWithImpl(this._self, this._then);

  final CompanyFormSuccess _self;
  final $Res Function(CompanyFormSuccess) _then;

/// Create a copy of CompanyFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? company = null,}) {
  return _then(CompanyFormSuccess(
null == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as Company,
  ));
}


}

/// @nodoc


class CompanyFormFailure implements CompanyFormState {
  const CompanyFormFailure(this.failure);
  

 final  Failure failure;

/// Create a copy of CompanyFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CompanyFormFailureCopyWith<CompanyFormFailure> get copyWith => _$CompanyFormFailureCopyWithImpl<CompanyFormFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompanyFormFailure&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'CompanyFormState.failure(failure: $failure)';
}


}

/// @nodoc
abstract mixin class $CompanyFormFailureCopyWith<$Res> implements $CompanyFormStateCopyWith<$Res> {
  factory $CompanyFormFailureCopyWith(CompanyFormFailure value, $Res Function(CompanyFormFailure) _then) = _$CompanyFormFailureCopyWithImpl;
@useResult
$Res call({
 Failure failure
});




}
/// @nodoc
class _$CompanyFormFailureCopyWithImpl<$Res>
    implements $CompanyFormFailureCopyWith<$Res> {
  _$CompanyFormFailureCopyWithImpl(this._self, this._then);

  final CompanyFormFailure _self;
  final $Res Function(CompanyFormFailure) _then;

/// Create a copy of CompanyFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(CompanyFormFailure(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}


}

// dart format on
