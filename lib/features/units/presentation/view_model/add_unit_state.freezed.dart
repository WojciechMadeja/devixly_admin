// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_unit_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AddUnitState {

 Loadable<List<ProjectOption>> get projects; ProjectOption? get project; Loadable<List<DictionaryItem>> get unitTypes; Loadable<List<DictionaryItem>> get layouts; DictionaryItem? get unitType; DictionaryItem? get layout; SubmissionStatus get submission;
/// Create a copy of AddUnitState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddUnitStateCopyWith<AddUnitState> get copyWith => _$AddUnitStateCopyWithImpl<AddUnitState>(this as AddUnitState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddUnitState&&(identical(other.projects, projects) || other.projects == projects)&&(identical(other.project, project) || other.project == project)&&(identical(other.unitTypes, unitTypes) || other.unitTypes == unitTypes)&&(identical(other.layouts, layouts) || other.layouts == layouts)&&(identical(other.unitType, unitType) || other.unitType == unitType)&&(identical(other.layout, layout) || other.layout == layout)&&(identical(other.submission, submission) || other.submission == submission));
}


@override
int get hashCode => Object.hash(runtimeType,projects,project,unitTypes,layouts,unitType,layout,submission);

@override
String toString() {
  return 'AddUnitState(projects: $projects, project: $project, unitTypes: $unitTypes, layouts: $layouts, unitType: $unitType, layout: $layout, submission: $submission)';
}


}

/// @nodoc
abstract mixin class $AddUnitStateCopyWith<$Res>  {
  factory $AddUnitStateCopyWith(AddUnitState value, $Res Function(AddUnitState) _then) = _$AddUnitStateCopyWithImpl;
@useResult
$Res call({
 Loadable<List<ProjectOption>> projects, ProjectOption? project, Loadable<List<DictionaryItem>> unitTypes, Loadable<List<DictionaryItem>> layouts, DictionaryItem? unitType, DictionaryItem? layout, SubmissionStatus submission
});


$LoadableCopyWith<List<ProjectOption>, $Res> get projects;$LoadableCopyWith<List<DictionaryItem>, $Res> get unitTypes;$LoadableCopyWith<List<DictionaryItem>, $Res> get layouts;$SubmissionStatusCopyWith<$Res> get submission;

}
/// @nodoc
class _$AddUnitStateCopyWithImpl<$Res>
    implements $AddUnitStateCopyWith<$Res> {
  _$AddUnitStateCopyWithImpl(this._self, this._then);

  final AddUnitState _self;
  final $Res Function(AddUnitState) _then;

/// Create a copy of AddUnitState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? projects = null,Object? project = freezed,Object? unitTypes = null,Object? layouts = null,Object? unitType = freezed,Object? layout = freezed,Object? submission = null,}) {
  return _then(_self.copyWith(
projects: null == projects ? _self.projects : projects // ignore: cast_nullable_to_non_nullable
as Loadable<List<ProjectOption>>,project: freezed == project ? _self.project : project // ignore: cast_nullable_to_non_nullable
as ProjectOption?,unitTypes: null == unitTypes ? _self.unitTypes : unitTypes // ignore: cast_nullable_to_non_nullable
as Loadable<List<DictionaryItem>>,layouts: null == layouts ? _self.layouts : layouts // ignore: cast_nullable_to_non_nullable
as Loadable<List<DictionaryItem>>,unitType: freezed == unitType ? _self.unitType : unitType // ignore: cast_nullable_to_non_nullable
as DictionaryItem?,layout: freezed == layout ? _self.layout : layout // ignore: cast_nullable_to_non_nullable
as DictionaryItem?,submission: null == submission ? _self.submission : submission // ignore: cast_nullable_to_non_nullable
as SubmissionStatus,
  ));
}
/// Create a copy of AddUnitState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LoadableCopyWith<List<ProjectOption>, $Res> get projects {
  
  return $LoadableCopyWith<List<ProjectOption>, $Res>(_self.projects, (value) {
    return _then(_self.copyWith(projects: value));
  });
}/// Create a copy of AddUnitState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LoadableCopyWith<List<DictionaryItem>, $Res> get unitTypes {
  
  return $LoadableCopyWith<List<DictionaryItem>, $Res>(_self.unitTypes, (value) {
    return _then(_self.copyWith(unitTypes: value));
  });
}/// Create a copy of AddUnitState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LoadableCopyWith<List<DictionaryItem>, $Res> get layouts {
  
  return $LoadableCopyWith<List<DictionaryItem>, $Res>(_self.layouts, (value) {
    return _then(_self.copyWith(layouts: value));
  });
}/// Create a copy of AddUnitState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SubmissionStatusCopyWith<$Res> get submission {
  
  return $SubmissionStatusCopyWith<$Res>(_self.submission, (value) {
    return _then(_self.copyWith(submission: value));
  });
}
}


/// Adds pattern-matching-related methods to [AddUnitState].
extension AddUnitStatePatterns on AddUnitState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AddUnitState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AddUnitState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AddUnitState value)  $default,){
final _that = this;
switch (_that) {
case _AddUnitState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AddUnitState value)?  $default,){
final _that = this;
switch (_that) {
case _AddUnitState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Loadable<List<ProjectOption>> projects,  ProjectOption? project,  Loadable<List<DictionaryItem>> unitTypes,  Loadable<List<DictionaryItem>> layouts,  DictionaryItem? unitType,  DictionaryItem? layout,  SubmissionStatus submission)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AddUnitState() when $default != null:
return $default(_that.projects,_that.project,_that.unitTypes,_that.layouts,_that.unitType,_that.layout,_that.submission);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Loadable<List<ProjectOption>> projects,  ProjectOption? project,  Loadable<List<DictionaryItem>> unitTypes,  Loadable<List<DictionaryItem>> layouts,  DictionaryItem? unitType,  DictionaryItem? layout,  SubmissionStatus submission)  $default,) {final _that = this;
switch (_that) {
case _AddUnitState():
return $default(_that.projects,_that.project,_that.unitTypes,_that.layouts,_that.unitType,_that.layout,_that.submission);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Loadable<List<ProjectOption>> projects,  ProjectOption? project,  Loadable<List<DictionaryItem>> unitTypes,  Loadable<List<DictionaryItem>> layouts,  DictionaryItem? unitType,  DictionaryItem? layout,  SubmissionStatus submission)?  $default,) {final _that = this;
switch (_that) {
case _AddUnitState() when $default != null:
return $default(_that.projects,_that.project,_that.unitTypes,_that.layouts,_that.unitType,_that.layout,_that.submission);case _:
  return null;

}
}

}

/// @nodoc


class _AddUnitState implements AddUnitState {
  const _AddUnitState({this.projects = const Loadable<List<ProjectOption>>.loading(), this.project, this.unitTypes = const Loadable<List<DictionaryItem>>.loading(), this.layouts = const Loadable<List<DictionaryItem>>.loading(), this.unitType, this.layout, this.submission = const SubmissionStatus.idle()});
  

@override@JsonKey() final  Loadable<List<ProjectOption>> projects;
@override final  ProjectOption? project;
@override@JsonKey() final  Loadable<List<DictionaryItem>> unitTypes;
@override@JsonKey() final  Loadable<List<DictionaryItem>> layouts;
@override final  DictionaryItem? unitType;
@override final  DictionaryItem? layout;
@override@JsonKey() final  SubmissionStatus submission;

/// Create a copy of AddUnitState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddUnitStateCopyWith<_AddUnitState> get copyWith => __$AddUnitStateCopyWithImpl<_AddUnitState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddUnitState&&(identical(other.projects, projects) || other.projects == projects)&&(identical(other.project, project) || other.project == project)&&(identical(other.unitTypes, unitTypes) || other.unitTypes == unitTypes)&&(identical(other.layouts, layouts) || other.layouts == layouts)&&(identical(other.unitType, unitType) || other.unitType == unitType)&&(identical(other.layout, layout) || other.layout == layout)&&(identical(other.submission, submission) || other.submission == submission));
}


@override
int get hashCode => Object.hash(runtimeType,projects,project,unitTypes,layouts,unitType,layout,submission);

@override
String toString() {
  return 'AddUnitState(projects: $projects, project: $project, unitTypes: $unitTypes, layouts: $layouts, unitType: $unitType, layout: $layout, submission: $submission)';
}


}

/// @nodoc
abstract mixin class _$AddUnitStateCopyWith<$Res> implements $AddUnitStateCopyWith<$Res> {
  factory _$AddUnitStateCopyWith(_AddUnitState value, $Res Function(_AddUnitState) _then) = __$AddUnitStateCopyWithImpl;
@override @useResult
$Res call({
 Loadable<List<ProjectOption>> projects, ProjectOption? project, Loadable<List<DictionaryItem>> unitTypes, Loadable<List<DictionaryItem>> layouts, DictionaryItem? unitType, DictionaryItem? layout, SubmissionStatus submission
});


@override $LoadableCopyWith<List<ProjectOption>, $Res> get projects;@override $LoadableCopyWith<List<DictionaryItem>, $Res> get unitTypes;@override $LoadableCopyWith<List<DictionaryItem>, $Res> get layouts;@override $SubmissionStatusCopyWith<$Res> get submission;

}
/// @nodoc
class __$AddUnitStateCopyWithImpl<$Res>
    implements _$AddUnitStateCopyWith<$Res> {
  __$AddUnitStateCopyWithImpl(this._self, this._then);

  final _AddUnitState _self;
  final $Res Function(_AddUnitState) _then;

/// Create a copy of AddUnitState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? projects = null,Object? project = freezed,Object? unitTypes = null,Object? layouts = null,Object? unitType = freezed,Object? layout = freezed,Object? submission = null,}) {
  return _then(_AddUnitState(
projects: null == projects ? _self.projects : projects // ignore: cast_nullable_to_non_nullable
as Loadable<List<ProjectOption>>,project: freezed == project ? _self.project : project // ignore: cast_nullable_to_non_nullable
as ProjectOption?,unitTypes: null == unitTypes ? _self.unitTypes : unitTypes // ignore: cast_nullable_to_non_nullable
as Loadable<List<DictionaryItem>>,layouts: null == layouts ? _self.layouts : layouts // ignore: cast_nullable_to_non_nullable
as Loadable<List<DictionaryItem>>,unitType: freezed == unitType ? _self.unitType : unitType // ignore: cast_nullable_to_non_nullable
as DictionaryItem?,layout: freezed == layout ? _self.layout : layout // ignore: cast_nullable_to_non_nullable
as DictionaryItem?,submission: null == submission ? _self.submission : submission // ignore: cast_nullable_to_non_nullable
as SubmissionStatus,
  ));
}

/// Create a copy of AddUnitState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LoadableCopyWith<List<ProjectOption>, $Res> get projects {
  
  return $LoadableCopyWith<List<ProjectOption>, $Res>(_self.projects, (value) {
    return _then(_self.copyWith(projects: value));
  });
}/// Create a copy of AddUnitState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LoadableCopyWith<List<DictionaryItem>, $Res> get unitTypes {
  
  return $LoadableCopyWith<List<DictionaryItem>, $Res>(_self.unitTypes, (value) {
    return _then(_self.copyWith(unitTypes: value));
  });
}/// Create a copy of AddUnitState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LoadableCopyWith<List<DictionaryItem>, $Res> get layouts {
  
  return $LoadableCopyWith<List<DictionaryItem>, $Res>(_self.layouts, (value) {
    return _then(_self.copyWith(layouts: value));
  });
}/// Create a copy of AddUnitState
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
