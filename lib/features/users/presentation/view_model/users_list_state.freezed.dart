// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'users_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UsersListState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UsersListState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UsersListState()';
}


}

/// @nodoc
class $UsersListStateCopyWith<$Res>  {
$UsersListStateCopyWith(UsersListState _, $Res Function(UsersListState) __);
}


/// Adds pattern-matching-related methods to [UsersListState].
extension UsersListStatePatterns on UsersListState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( UsersListLoading value)?  loading,TResult Function( UsersListLoaded value)?  loaded,TResult Function( UsersListError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case UsersListLoading() when loading != null:
return loading(_that);case UsersListLoaded() when loaded != null:
return loaded(_that);case UsersListError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( UsersListLoading value)  loading,required TResult Function( UsersListLoaded value)  loaded,required TResult Function( UsersListError value)  error,}){
final _that = this;
switch (_that) {
case UsersListLoading():
return loading(_that);case UsersListLoaded():
return loaded(_that);case UsersListError():
return error(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( UsersListLoading value)?  loading,TResult? Function( UsersListLoaded value)?  loaded,TResult? Function( UsersListError value)?  error,}){
final _that = this;
switch (_that) {
case UsersListLoading() when loading != null:
return loading(_that);case UsersListLoaded() when loaded != null:
return loaded(_that);case UsersListError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( List<ManagedUser> users,  List<Company> companies,  UserSortKey? sortKey,  bool ascending)?  loaded,TResult Function( Failure failure)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case UsersListLoading() when loading != null:
return loading();case UsersListLoaded() when loaded != null:
return loaded(_that.users,_that.companies,_that.sortKey,_that.ascending);case UsersListError() when error != null:
return error(_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( List<ManagedUser> users,  List<Company> companies,  UserSortKey? sortKey,  bool ascending)  loaded,required TResult Function( Failure failure)  error,}) {final _that = this;
switch (_that) {
case UsersListLoading():
return loading();case UsersListLoaded():
return loaded(_that.users,_that.companies,_that.sortKey,_that.ascending);case UsersListError():
return error(_that.failure);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( List<ManagedUser> users,  List<Company> companies,  UserSortKey? sortKey,  bool ascending)?  loaded,TResult? Function( Failure failure)?  error,}) {final _that = this;
switch (_that) {
case UsersListLoading() when loading != null:
return loading();case UsersListLoaded() when loaded != null:
return loaded(_that.users,_that.companies,_that.sortKey,_that.ascending);case UsersListError() when error != null:
return error(_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class UsersListLoading implements UsersListState {
  const UsersListLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UsersListLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UsersListState.loading()';
}


}




/// @nodoc


class UsersListLoaded implements UsersListState {
  const UsersListLoaded({required final  List<ManagedUser> users, required final  List<Company> companies, this.sortKey, this.ascending = true}): _users = users,_companies = companies;
  

 final  List<ManagedUser> _users;
 List<ManagedUser> get users {
  if (_users is EqualUnmodifiableListView) return _users;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_users);
}

 final  List<Company> _companies;
 List<Company> get companies {
  if (_companies is EqualUnmodifiableListView) return _companies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_companies);
}

 final  UserSortKey? sortKey;
@JsonKey() final  bool ascending;

/// Create a copy of UsersListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UsersListLoadedCopyWith<UsersListLoaded> get copyWith => _$UsersListLoadedCopyWithImpl<UsersListLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UsersListLoaded&&const DeepCollectionEquality().equals(other._users, _users)&&const DeepCollectionEquality().equals(other._companies, _companies)&&(identical(other.sortKey, sortKey) || other.sortKey == sortKey)&&(identical(other.ascending, ascending) || other.ascending == ascending));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_users),const DeepCollectionEquality().hash(_companies),sortKey,ascending);

@override
String toString() {
  return 'UsersListState.loaded(users: $users, companies: $companies, sortKey: $sortKey, ascending: $ascending)';
}


}

/// @nodoc
abstract mixin class $UsersListLoadedCopyWith<$Res> implements $UsersListStateCopyWith<$Res> {
  factory $UsersListLoadedCopyWith(UsersListLoaded value, $Res Function(UsersListLoaded) _then) = _$UsersListLoadedCopyWithImpl;
@useResult
$Res call({
 List<ManagedUser> users, List<Company> companies, UserSortKey? sortKey, bool ascending
});




}
/// @nodoc
class _$UsersListLoadedCopyWithImpl<$Res>
    implements $UsersListLoadedCopyWith<$Res> {
  _$UsersListLoadedCopyWithImpl(this._self, this._then);

  final UsersListLoaded _self;
  final $Res Function(UsersListLoaded) _then;

/// Create a copy of UsersListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? users = null,Object? companies = null,Object? sortKey = freezed,Object? ascending = null,}) {
  return _then(UsersListLoaded(
users: null == users ? _self._users : users // ignore: cast_nullable_to_non_nullable
as List<ManagedUser>,companies: null == companies ? _self._companies : companies // ignore: cast_nullable_to_non_nullable
as List<Company>,sortKey: freezed == sortKey ? _self.sortKey : sortKey // ignore: cast_nullable_to_non_nullable
as UserSortKey?,ascending: null == ascending ? _self.ascending : ascending // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class UsersListError implements UsersListState {
  const UsersListError(this.failure);
  

 final  Failure failure;

/// Create a copy of UsersListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UsersListErrorCopyWith<UsersListError> get copyWith => _$UsersListErrorCopyWithImpl<UsersListError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UsersListError&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'UsersListState.error(failure: $failure)';
}


}

/// @nodoc
abstract mixin class $UsersListErrorCopyWith<$Res> implements $UsersListStateCopyWith<$Res> {
  factory $UsersListErrorCopyWith(UsersListError value, $Res Function(UsersListError) _then) = _$UsersListErrorCopyWithImpl;
@useResult
$Res call({
 Failure failure
});




}
/// @nodoc
class _$UsersListErrorCopyWithImpl<$Res>
    implements $UsersListErrorCopyWith<$Res> {
  _$UsersListErrorCopyWithImpl(this._self, this._then);

  final UsersListError _self;
  final $Res Function(UsersListError) _then;

/// Create a copy of UsersListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(UsersListError(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}


}

// dart format on
