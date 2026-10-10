// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'projects_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProjectsListState {

 Loadable<List<ProjectSummary>> get projects; String get search;
/// Create a copy of ProjectsListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectsListStateCopyWith<ProjectsListState> get copyWith => _$ProjectsListStateCopyWithImpl<ProjectsListState>(this as ProjectsListState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectsListState&&(identical(other.projects, projects) || other.projects == projects)&&(identical(other.search, search) || other.search == search));
}


@override
int get hashCode => Object.hash(runtimeType,projects,search);

@override
String toString() {
  return 'ProjectsListState(projects: $projects, search: $search)';
}


}

/// @nodoc
abstract mixin class $ProjectsListStateCopyWith<$Res>  {
  factory $ProjectsListStateCopyWith(ProjectsListState value, $Res Function(ProjectsListState) _then) = _$ProjectsListStateCopyWithImpl;
@useResult
$Res call({
 Loadable<List<ProjectSummary>> projects, String search
});


$LoadableCopyWith<List<ProjectSummary>, $Res> get projects;

}
/// @nodoc
class _$ProjectsListStateCopyWithImpl<$Res>
    implements $ProjectsListStateCopyWith<$Res> {
  _$ProjectsListStateCopyWithImpl(this._self, this._then);

  final ProjectsListState _self;
  final $Res Function(ProjectsListState) _then;

/// Create a copy of ProjectsListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? projects = null,Object? search = null,}) {
  return _then(_self.copyWith(
projects: null == projects ? _self.projects : projects // ignore: cast_nullable_to_non_nullable
as Loadable<List<ProjectSummary>>,search: null == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of ProjectsListState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LoadableCopyWith<List<ProjectSummary>, $Res> get projects {
  
  return $LoadableCopyWith<List<ProjectSummary>, $Res>(_self.projects, (value) {
    return _then(_self.copyWith(projects: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProjectsListState].
extension ProjectsListStatePatterns on ProjectsListState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProjectsListState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProjectsListState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProjectsListState value)  $default,){
final _that = this;
switch (_that) {
case _ProjectsListState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProjectsListState value)?  $default,){
final _that = this;
switch (_that) {
case _ProjectsListState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Loadable<List<ProjectSummary>> projects,  String search)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProjectsListState() when $default != null:
return $default(_that.projects,_that.search);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Loadable<List<ProjectSummary>> projects,  String search)  $default,) {final _that = this;
switch (_that) {
case _ProjectsListState():
return $default(_that.projects,_that.search);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Loadable<List<ProjectSummary>> projects,  String search)?  $default,) {final _that = this;
switch (_that) {
case _ProjectsListState() when $default != null:
return $default(_that.projects,_that.search);case _:
  return null;

}
}

}

/// @nodoc


class _ProjectsListState implements ProjectsListState {
  const _ProjectsListState({this.projects = const Loadable<List<ProjectSummary>>.loading(), this.search = ''});
  

@override@JsonKey() final  Loadable<List<ProjectSummary>> projects;
@override@JsonKey() final  String search;

/// Create a copy of ProjectsListState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProjectsListStateCopyWith<_ProjectsListState> get copyWith => __$ProjectsListStateCopyWithImpl<_ProjectsListState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProjectsListState&&(identical(other.projects, projects) || other.projects == projects)&&(identical(other.search, search) || other.search == search));
}


@override
int get hashCode => Object.hash(runtimeType,projects,search);

@override
String toString() {
  return 'ProjectsListState(projects: $projects, search: $search)';
}


}

/// @nodoc
abstract mixin class _$ProjectsListStateCopyWith<$Res> implements $ProjectsListStateCopyWith<$Res> {
  factory _$ProjectsListStateCopyWith(_ProjectsListState value, $Res Function(_ProjectsListState) _then) = __$ProjectsListStateCopyWithImpl;
@override @useResult
$Res call({
 Loadable<List<ProjectSummary>> projects, String search
});


@override $LoadableCopyWith<List<ProjectSummary>, $Res> get projects;

}
/// @nodoc
class __$ProjectsListStateCopyWithImpl<$Res>
    implements _$ProjectsListStateCopyWith<$Res> {
  __$ProjectsListStateCopyWithImpl(this._self, this._then);

  final _ProjectsListState _self;
  final $Res Function(_ProjectsListState) _then;

/// Create a copy of ProjectsListState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? projects = null,Object? search = null,}) {
  return _then(_ProjectsListState(
projects: null == projects ? _self.projects : projects // ignore: cast_nullable_to_non_nullable
as Loadable<List<ProjectSummary>>,search: null == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of ProjectsListState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LoadableCopyWith<List<ProjectSummary>, $Res> get projects {
  
  return $LoadableCopyWith<List<ProjectSummary>, $Res>(_self.projects, (value) {
    return _then(_self.copyWith(projects: value));
  });
}
}

// dart format on
