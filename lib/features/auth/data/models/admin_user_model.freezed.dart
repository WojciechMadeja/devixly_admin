// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AdminUserModel {
  int get id;
  String get email;
  String get firstName;
  String get lastName;
  String get phoneNumber;
  String get company;

  /// Create a copy of AdminUserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AdminUserModelCopyWith<AdminUserModel> get copyWith =>
      _$AdminUserModelCopyWithImpl<AdminUserModel>(
          this as AdminUserModel, _$identity);

  /// Serializes this AdminUserModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AdminUserModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.company, company) || other.company == company));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, email, firstName, lastName, phoneNumber, company);

  @override
  String toString() {
    return 'AdminUserModel(id: $id, email: $email, firstName: $firstName, lastName: $lastName, phoneNumber: $phoneNumber, company: $company)';
  }
}

/// @nodoc
abstract mixin class $AdminUserModelCopyWith<$Res> {
  factory $AdminUserModelCopyWith(
          AdminUserModel value, $Res Function(AdminUserModel) _then) =
      _$AdminUserModelCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      String email,
      String firstName,
      String lastName,
      String phoneNumber,
      String company});
}

/// @nodoc
class _$AdminUserModelCopyWithImpl<$Res>
    implements $AdminUserModelCopyWith<$Res> {
  _$AdminUserModelCopyWithImpl(this._self, this._then);

  final AdminUserModel _self;
  final $Res Function(AdminUserModel) _then;

  /// Create a copy of AdminUserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? phoneNumber = null,
    Object? company = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _self.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _self.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _self.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      company: null == company
          ? _self.company
          : company // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [AdminUserModel].
extension AdminUserModelPatterns on AdminUserModel {
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AdminUserModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AdminUserModel() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AdminUserModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AdminUserModel():
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AdminUserModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AdminUserModel() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(int id, String email, String firstName, String lastName,
            String phoneNumber, String company)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AdminUserModel() when $default != null:
        return $default(_that.id, _that.email, _that.firstName, _that.lastName,
            _that.phoneNumber, _that.company);
      case _:
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

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(int id, String email, String firstName, String lastName,
            String phoneNumber, String company)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AdminUserModel():
        return $default(_that.id, _that.email, _that.firstName, _that.lastName,
            _that.phoneNumber, _that.company);
      case _:
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(int id, String email, String firstName, String lastName,
            String phoneNumber, String company)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AdminUserModel() when $default != null:
        return $default(_that.id, _that.email, _that.firstName, _that.lastName,
            _that.phoneNumber, _that.company);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _AdminUserModel extends AdminUserModel {
  const _AdminUserModel(
      {required this.id,
      this.email = '',
      this.firstName = '',
      this.lastName = '',
      this.phoneNumber = '',
      this.company = ''})
      : super._();
  factory _AdminUserModel.fromJson(Map<String, dynamic> json) =>
      _$AdminUserModelFromJson(json);

  @override
  final int id;
  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String firstName;
  @override
  @JsonKey()
  final String lastName;
  @override
  @JsonKey()
  final String phoneNumber;
  @override
  @JsonKey()
  final String company;

  /// Create a copy of AdminUserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AdminUserModelCopyWith<_AdminUserModel> get copyWith =>
      __$AdminUserModelCopyWithImpl<_AdminUserModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AdminUserModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AdminUserModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.company, company) || other.company == company));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, email, firstName, lastName, phoneNumber, company);

  @override
  String toString() {
    return 'AdminUserModel(id: $id, email: $email, firstName: $firstName, lastName: $lastName, phoneNumber: $phoneNumber, company: $company)';
  }
}

/// @nodoc
abstract mixin class _$AdminUserModelCopyWith<$Res>
    implements $AdminUserModelCopyWith<$Res> {
  factory _$AdminUserModelCopyWith(
          _AdminUserModel value, $Res Function(_AdminUserModel) _then) =
      __$AdminUserModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      String email,
      String firstName,
      String lastName,
      String phoneNumber,
      String company});
}

/// @nodoc
class __$AdminUserModelCopyWithImpl<$Res>
    implements _$AdminUserModelCopyWith<$Res> {
  __$AdminUserModelCopyWithImpl(this._self, this._then);

  final _AdminUserModel _self;
  final $Res Function(_AdminUserModel) _then;

  /// Create a copy of AdminUserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? phoneNumber = null,
    Object? company = null,
  }) {
    return _then(_AdminUserModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _self.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _self.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _self.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      company: null == company
          ? _self.company
          : company // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
