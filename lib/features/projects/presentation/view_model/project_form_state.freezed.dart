// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProjectFormState {

 Loadable<List<DictionaryItem>> get districts; Loadable<List<DictionaryItem>> get developers; DictionaryItem? get district; DictionaryItem? get developer; DateTime? get handover; DateTime? get startOfSales; ProjectOwnership? get ownership; bool get saleTypesDeveloper; bool get saleTypesResale; SubmissionStatus get submission;
/// Create a copy of ProjectFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectFormStateCopyWith<ProjectFormState> get copyWith => _$ProjectFormStateCopyWithImpl<ProjectFormState>(this as ProjectFormState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectFormState&&(identical(other.districts, districts) || other.districts == districts)&&(identical(other.developers, developers) || other.developers == developers)&&(identical(other.district, district) || other.district == district)&&(identical(other.developer, developer) || other.developer == developer)&&(identical(other.handover, handover) || other.handover == handover)&&(identical(other.startOfSales, startOfSales) || other.startOfSales == startOfSales)&&(identical(other.ownership, ownership) || other.ownership == ownership)&&(identical(other.saleTypesDeveloper, saleTypesDeveloper) || other.saleTypesDeveloper == saleTypesDeveloper)&&(identical(other.saleTypesResale, saleTypesResale) || other.saleTypesResale == saleTypesResale)&&(identical(other.submission, submission) || other.submission == submission));
}


@override
int get hashCode => Object.hash(runtimeType,districts,developers,district,developer,handover,startOfSales,ownership,saleTypesDeveloper,saleTypesResale,submission);

@override
String toString() {
  return 'ProjectFormState(districts: $districts, developers: $developers, district: $district, developer: $developer, handover: $handover, startOfSales: $startOfSales, ownership: $ownership, saleTypesDeveloper: $saleTypesDeveloper, saleTypesResale: $saleTypesResale, submission: $submission)';
}


}

/// @nodoc
abstract mixin class $ProjectFormStateCopyWith<$Res>  {
  factory $ProjectFormStateCopyWith(ProjectFormState value, $Res Function(ProjectFormState) _then) = _$ProjectFormStateCopyWithImpl;
@useResult
$Res call({
 Loadable<List<DictionaryItem>> districts, Loadable<List<DictionaryItem>> developers, DictionaryItem? district, DictionaryItem? developer, DateTime? handover, DateTime? startOfSales, ProjectOwnership? ownership, bool saleTypesDeveloper, bool saleTypesResale, SubmissionStatus submission
});


$LoadableCopyWith<List<DictionaryItem>, $Res> get districts;$LoadableCopyWith<List<DictionaryItem>, $Res> get developers;$SubmissionStatusCopyWith<$Res> get submission;

}
/// @nodoc
class _$ProjectFormStateCopyWithImpl<$Res>
    implements $ProjectFormStateCopyWith<$Res> {
  _$ProjectFormStateCopyWithImpl(this._self, this._then);

  final ProjectFormState _self;
  final $Res Function(ProjectFormState) _then;

/// Create a copy of ProjectFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? districts = null,Object? developers = null,Object? district = freezed,Object? developer = freezed,Object? handover = freezed,Object? startOfSales = freezed,Object? ownership = freezed,Object? saleTypesDeveloper = null,Object? saleTypesResale = null,Object? submission = null,}) {
  return _then(_self.copyWith(
districts: null == districts ? _self.districts : districts // ignore: cast_nullable_to_non_nullable
as Loadable<List<DictionaryItem>>,developers: null == developers ? _self.developers : developers // ignore: cast_nullable_to_non_nullable
as Loadable<List<DictionaryItem>>,district: freezed == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as DictionaryItem?,developer: freezed == developer ? _self.developer : developer // ignore: cast_nullable_to_non_nullable
as DictionaryItem?,handover: freezed == handover ? _self.handover : handover // ignore: cast_nullable_to_non_nullable
as DateTime?,startOfSales: freezed == startOfSales ? _self.startOfSales : startOfSales // ignore: cast_nullable_to_non_nullable
as DateTime?,ownership: freezed == ownership ? _self.ownership : ownership // ignore: cast_nullable_to_non_nullable
as ProjectOwnership?,saleTypesDeveloper: null == saleTypesDeveloper ? _self.saleTypesDeveloper : saleTypesDeveloper // ignore: cast_nullable_to_non_nullable
as bool,saleTypesResale: null == saleTypesResale ? _self.saleTypesResale : saleTypesResale // ignore: cast_nullable_to_non_nullable
as bool,submission: null == submission ? _self.submission : submission // ignore: cast_nullable_to_non_nullable
as SubmissionStatus,
  ));
}
/// Create a copy of ProjectFormState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LoadableCopyWith<List<DictionaryItem>, $Res> get districts {
  
  return $LoadableCopyWith<List<DictionaryItem>, $Res>(_self.districts, (value) {
    return _then(_self.copyWith(districts: value));
  });
}/// Create a copy of ProjectFormState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LoadableCopyWith<List<DictionaryItem>, $Res> get developers {
  
  return $LoadableCopyWith<List<DictionaryItem>, $Res>(_self.developers, (value) {
    return _then(_self.copyWith(developers: value));
  });
}/// Create a copy of ProjectFormState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SubmissionStatusCopyWith<$Res> get submission {
  
  return $SubmissionStatusCopyWith<$Res>(_self.submission, (value) {
    return _then(_self.copyWith(submission: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProjectFormState].
extension ProjectFormStatePatterns on ProjectFormState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProjectFormState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProjectFormState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProjectFormState value)  $default,){
final _that = this;
switch (_that) {
case _ProjectFormState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProjectFormState value)?  $default,){
final _that = this;
switch (_that) {
case _ProjectFormState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Loadable<List<DictionaryItem>> districts,  Loadable<List<DictionaryItem>> developers,  DictionaryItem? district,  DictionaryItem? developer,  DateTime? handover,  DateTime? startOfSales,  ProjectOwnership? ownership,  bool saleTypesDeveloper,  bool saleTypesResale,  SubmissionStatus submission)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProjectFormState() when $default != null:
return $default(_that.districts,_that.developers,_that.district,_that.developer,_that.handover,_that.startOfSales,_that.ownership,_that.saleTypesDeveloper,_that.saleTypesResale,_that.submission);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Loadable<List<DictionaryItem>> districts,  Loadable<List<DictionaryItem>> developers,  DictionaryItem? district,  DictionaryItem? developer,  DateTime? handover,  DateTime? startOfSales,  ProjectOwnership? ownership,  bool saleTypesDeveloper,  bool saleTypesResale,  SubmissionStatus submission)  $default,) {final _that = this;
switch (_that) {
case _ProjectFormState():
return $default(_that.districts,_that.developers,_that.district,_that.developer,_that.handover,_that.startOfSales,_that.ownership,_that.saleTypesDeveloper,_that.saleTypesResale,_that.submission);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Loadable<List<DictionaryItem>> districts,  Loadable<List<DictionaryItem>> developers,  DictionaryItem? district,  DictionaryItem? developer,  DateTime? handover,  DateTime? startOfSales,  ProjectOwnership? ownership,  bool saleTypesDeveloper,  bool saleTypesResale,  SubmissionStatus submission)?  $default,) {final _that = this;
switch (_that) {
case _ProjectFormState() when $default != null:
return $default(_that.districts,_that.developers,_that.district,_that.developer,_that.handover,_that.startOfSales,_that.ownership,_that.saleTypesDeveloper,_that.saleTypesResale,_that.submission);case _:
  return null;

}
}

}

/// @nodoc


class _ProjectFormState implements ProjectFormState {
  const _ProjectFormState({this.districts = const Loadable<List<DictionaryItem>>.loading(), this.developers = const Loadable<List<DictionaryItem>>.loading(), this.district, this.developer, this.handover, this.startOfSales, this.ownership, this.saleTypesDeveloper = true, this.saleTypesResale = false, this.submission = const SubmissionStatus.idle()});
  

@override@JsonKey() final  Loadable<List<DictionaryItem>> districts;
@override@JsonKey() final  Loadable<List<DictionaryItem>> developers;
@override final  DictionaryItem? district;
@override final  DictionaryItem? developer;
@override final  DateTime? handover;
@override final  DateTime? startOfSales;
@override final  ProjectOwnership? ownership;
@override@JsonKey() final  bool saleTypesDeveloper;
@override@JsonKey() final  bool saleTypesResale;
@override@JsonKey() final  SubmissionStatus submission;

/// Create a copy of ProjectFormState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProjectFormStateCopyWith<_ProjectFormState> get copyWith => __$ProjectFormStateCopyWithImpl<_ProjectFormState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProjectFormState&&(identical(other.districts, districts) || other.districts == districts)&&(identical(other.developers, developers) || other.developers == developers)&&(identical(other.district, district) || other.district == district)&&(identical(other.developer, developer) || other.developer == developer)&&(identical(other.handover, handover) || other.handover == handover)&&(identical(other.startOfSales, startOfSales) || other.startOfSales == startOfSales)&&(identical(other.ownership, ownership) || other.ownership == ownership)&&(identical(other.saleTypesDeveloper, saleTypesDeveloper) || other.saleTypesDeveloper == saleTypesDeveloper)&&(identical(other.saleTypesResale, saleTypesResale) || other.saleTypesResale == saleTypesResale)&&(identical(other.submission, submission) || other.submission == submission));
}


@override
int get hashCode => Object.hash(runtimeType,districts,developers,district,developer,handover,startOfSales,ownership,saleTypesDeveloper,saleTypesResale,submission);

@override
String toString() {
  return 'ProjectFormState(districts: $districts, developers: $developers, district: $district, developer: $developer, handover: $handover, startOfSales: $startOfSales, ownership: $ownership, saleTypesDeveloper: $saleTypesDeveloper, saleTypesResale: $saleTypesResale, submission: $submission)';
}


}

/// @nodoc
abstract mixin class _$ProjectFormStateCopyWith<$Res> implements $ProjectFormStateCopyWith<$Res> {
  factory _$ProjectFormStateCopyWith(_ProjectFormState value, $Res Function(_ProjectFormState) _then) = __$ProjectFormStateCopyWithImpl;
@override @useResult
$Res call({
 Loadable<List<DictionaryItem>> districts, Loadable<List<DictionaryItem>> developers, DictionaryItem? district, DictionaryItem? developer, DateTime? handover, DateTime? startOfSales, ProjectOwnership? ownership, bool saleTypesDeveloper, bool saleTypesResale, SubmissionStatus submission
});


@override $LoadableCopyWith<List<DictionaryItem>, $Res> get districts;@override $LoadableCopyWith<List<DictionaryItem>, $Res> get developers;@override $SubmissionStatusCopyWith<$Res> get submission;

}
/// @nodoc
class __$ProjectFormStateCopyWithImpl<$Res>
    implements _$ProjectFormStateCopyWith<$Res> {
  __$ProjectFormStateCopyWithImpl(this._self, this._then);

  final _ProjectFormState _self;
  final $Res Function(_ProjectFormState) _then;

/// Create a copy of ProjectFormState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? districts = null,Object? developers = null,Object? district = freezed,Object? developer = freezed,Object? handover = freezed,Object? startOfSales = freezed,Object? ownership = freezed,Object? saleTypesDeveloper = null,Object? saleTypesResale = null,Object? submission = null,}) {
  return _then(_ProjectFormState(
districts: null == districts ? _self.districts : districts // ignore: cast_nullable_to_non_nullable
as Loadable<List<DictionaryItem>>,developers: null == developers ? _self.developers : developers // ignore: cast_nullable_to_non_nullable
as Loadable<List<DictionaryItem>>,district: freezed == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as DictionaryItem?,developer: freezed == developer ? _self.developer : developer // ignore: cast_nullable_to_non_nullable
as DictionaryItem?,handover: freezed == handover ? _self.handover : handover // ignore: cast_nullable_to_non_nullable
as DateTime?,startOfSales: freezed == startOfSales ? _self.startOfSales : startOfSales // ignore: cast_nullable_to_non_nullable
as DateTime?,ownership: freezed == ownership ? _self.ownership : ownership // ignore: cast_nullable_to_non_nullable
as ProjectOwnership?,saleTypesDeveloper: null == saleTypesDeveloper ? _self.saleTypesDeveloper : saleTypesDeveloper // ignore: cast_nullable_to_non_nullable
as bool,saleTypesResale: null == saleTypesResale ? _self.saleTypesResale : saleTypesResale // ignore: cast_nullable_to_non_nullable
as bool,submission: null == submission ? _self.submission : submission // ignore: cast_nullable_to_non_nullable
as SubmissionStatus,
  ));
}

/// Create a copy of ProjectFormState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LoadableCopyWith<List<DictionaryItem>, $Res> get districts {
  
  return $LoadableCopyWith<List<DictionaryItem>, $Res>(_self.districts, (value) {
    return _then(_self.copyWith(districts: value));
  });
}/// Create a copy of ProjectFormState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LoadableCopyWith<List<DictionaryItem>, $Res> get developers {
  
  return $LoadableCopyWith<List<DictionaryItem>, $Res>(_self.developers, (value) {
    return _then(_self.copyWith(developers: value));
  });
}/// Create a copy of ProjectFormState
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
