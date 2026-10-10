// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_details_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProjectDetailsState {

 Loadable<ProjectDetails> get details; Loadable<List<ProjectUnit>> get units; List<DictionaryItem> get unitTypes; List<DictionaryItem> get layouts;
/// Create a copy of ProjectDetailsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectDetailsStateCopyWith<ProjectDetailsState> get copyWith => _$ProjectDetailsStateCopyWithImpl<ProjectDetailsState>(this as ProjectDetailsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectDetailsState&&(identical(other.details, details) || other.details == details)&&(identical(other.units, units) || other.units == units)&&const DeepCollectionEquality().equals(other.unitTypes, unitTypes)&&const DeepCollectionEquality().equals(other.layouts, layouts));
}


@override
int get hashCode => Object.hash(runtimeType,details,units,const DeepCollectionEquality().hash(unitTypes),const DeepCollectionEquality().hash(layouts));

@override
String toString() {
  return 'ProjectDetailsState(details: $details, units: $units, unitTypes: $unitTypes, layouts: $layouts)';
}


}

/// @nodoc
abstract mixin class $ProjectDetailsStateCopyWith<$Res>  {
  factory $ProjectDetailsStateCopyWith(ProjectDetailsState value, $Res Function(ProjectDetailsState) _then) = _$ProjectDetailsStateCopyWithImpl;
@useResult
$Res call({
 Loadable<ProjectDetails> details, Loadable<List<ProjectUnit>> units, List<DictionaryItem> unitTypes, List<DictionaryItem> layouts
});


$LoadableCopyWith<ProjectDetails, $Res> get details;$LoadableCopyWith<List<ProjectUnit>, $Res> get units;

}
/// @nodoc
class _$ProjectDetailsStateCopyWithImpl<$Res>
    implements $ProjectDetailsStateCopyWith<$Res> {
  _$ProjectDetailsStateCopyWithImpl(this._self, this._then);

  final ProjectDetailsState _self;
  final $Res Function(ProjectDetailsState) _then;

/// Create a copy of ProjectDetailsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? details = null,Object? units = null,Object? unitTypes = null,Object? layouts = null,}) {
  return _then(_self.copyWith(
details: null == details ? _self.details : details // ignore: cast_nullable_to_non_nullable
as Loadable<ProjectDetails>,units: null == units ? _self.units : units // ignore: cast_nullable_to_non_nullable
as Loadable<List<ProjectUnit>>,unitTypes: null == unitTypes ? _self.unitTypes : unitTypes // ignore: cast_nullable_to_non_nullable
as List<DictionaryItem>,layouts: null == layouts ? _self.layouts : layouts // ignore: cast_nullable_to_non_nullable
as List<DictionaryItem>,
  ));
}
/// Create a copy of ProjectDetailsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LoadableCopyWith<ProjectDetails, $Res> get details {
  
  return $LoadableCopyWith<ProjectDetails, $Res>(_self.details, (value) {
    return _then(_self.copyWith(details: value));
  });
}/// Create a copy of ProjectDetailsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LoadableCopyWith<List<ProjectUnit>, $Res> get units {
  
  return $LoadableCopyWith<List<ProjectUnit>, $Res>(_self.units, (value) {
    return _then(_self.copyWith(units: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProjectDetailsState].
extension ProjectDetailsStatePatterns on ProjectDetailsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProjectDetailsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProjectDetailsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProjectDetailsState value)  $default,){
final _that = this;
switch (_that) {
case _ProjectDetailsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProjectDetailsState value)?  $default,){
final _that = this;
switch (_that) {
case _ProjectDetailsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Loadable<ProjectDetails> details,  Loadable<List<ProjectUnit>> units,  List<DictionaryItem> unitTypes,  List<DictionaryItem> layouts)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProjectDetailsState() when $default != null:
return $default(_that.details,_that.units,_that.unitTypes,_that.layouts);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Loadable<ProjectDetails> details,  Loadable<List<ProjectUnit>> units,  List<DictionaryItem> unitTypes,  List<DictionaryItem> layouts)  $default,) {final _that = this;
switch (_that) {
case _ProjectDetailsState():
return $default(_that.details,_that.units,_that.unitTypes,_that.layouts);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Loadable<ProjectDetails> details,  Loadable<List<ProjectUnit>> units,  List<DictionaryItem> unitTypes,  List<DictionaryItem> layouts)?  $default,) {final _that = this;
switch (_that) {
case _ProjectDetailsState() when $default != null:
return $default(_that.details,_that.units,_that.unitTypes,_that.layouts);case _:
  return null;

}
}

}

/// @nodoc


class _ProjectDetailsState implements ProjectDetailsState {
  const _ProjectDetailsState({this.details = const Loadable<ProjectDetails>.loading(), this.units = const Loadable<List<ProjectUnit>>.loading(), final  List<DictionaryItem> unitTypes = const <DictionaryItem>[], final  List<DictionaryItem> layouts = const <DictionaryItem>[]}): _unitTypes = unitTypes,_layouts = layouts;
  

@override@JsonKey() final  Loadable<ProjectDetails> details;
@override@JsonKey() final  Loadable<List<ProjectUnit>> units;
 final  List<DictionaryItem> _unitTypes;
@override@JsonKey() List<DictionaryItem> get unitTypes {
  if (_unitTypes is EqualUnmodifiableListView) return _unitTypes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_unitTypes);
}

 final  List<DictionaryItem> _layouts;
@override@JsonKey() List<DictionaryItem> get layouts {
  if (_layouts is EqualUnmodifiableListView) return _layouts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_layouts);
}


/// Create a copy of ProjectDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProjectDetailsStateCopyWith<_ProjectDetailsState> get copyWith => __$ProjectDetailsStateCopyWithImpl<_ProjectDetailsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProjectDetailsState&&(identical(other.details, details) || other.details == details)&&(identical(other.units, units) || other.units == units)&&const DeepCollectionEquality().equals(other._unitTypes, _unitTypes)&&const DeepCollectionEquality().equals(other._layouts, _layouts));
}


@override
int get hashCode => Object.hash(runtimeType,details,units,const DeepCollectionEquality().hash(_unitTypes),const DeepCollectionEquality().hash(_layouts));

@override
String toString() {
  return 'ProjectDetailsState(details: $details, units: $units, unitTypes: $unitTypes, layouts: $layouts)';
}


}

/// @nodoc
abstract mixin class _$ProjectDetailsStateCopyWith<$Res> implements $ProjectDetailsStateCopyWith<$Res> {
  factory _$ProjectDetailsStateCopyWith(_ProjectDetailsState value, $Res Function(_ProjectDetailsState) _then) = __$ProjectDetailsStateCopyWithImpl;
@override @useResult
$Res call({
 Loadable<ProjectDetails> details, Loadable<List<ProjectUnit>> units, List<DictionaryItem> unitTypes, List<DictionaryItem> layouts
});


@override $LoadableCopyWith<ProjectDetails, $Res> get details;@override $LoadableCopyWith<List<ProjectUnit>, $Res> get units;

}
/// @nodoc
class __$ProjectDetailsStateCopyWithImpl<$Res>
    implements _$ProjectDetailsStateCopyWith<$Res> {
  __$ProjectDetailsStateCopyWithImpl(this._self, this._then);

  final _ProjectDetailsState _self;
  final $Res Function(_ProjectDetailsState) _then;

/// Create a copy of ProjectDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? details = null,Object? units = null,Object? unitTypes = null,Object? layouts = null,}) {
  return _then(_ProjectDetailsState(
details: null == details ? _self.details : details // ignore: cast_nullable_to_non_nullable
as Loadable<ProjectDetails>,units: null == units ? _self.units : units // ignore: cast_nullable_to_non_nullable
as Loadable<List<ProjectUnit>>,unitTypes: null == unitTypes ? _self._unitTypes : unitTypes // ignore: cast_nullable_to_non_nullable
as List<DictionaryItem>,layouts: null == layouts ? _self._layouts : layouts // ignore: cast_nullable_to_non_nullable
as List<DictionaryItem>,
  ));
}

/// Create a copy of ProjectDetailsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LoadableCopyWith<ProjectDetails, $Res> get details {
  
  return $LoadableCopyWith<ProjectDetails, $Res>(_self.details, (value) {
    return _then(_self.copyWith(details: value));
  });
}/// Create a copy of ProjectDetailsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LoadableCopyWith<List<ProjectUnit>, $Res> get units {
  
  return $LoadableCopyWith<List<ProjectUnit>, $Res>(_self.units, (value) {
    return _then(_self.copyWith(units: value));
  });
}
}

// dart format on
