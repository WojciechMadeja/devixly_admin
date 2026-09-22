// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_profile_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AdminProfileModel {
  int get id;
  @JsonKey(fromJson: stringFromJson)
  String get email;
  @JsonKey(name: 'first_name', fromJson: stringFromJson)
  String get firstName;
  @JsonKey(name: 'last_name', fromJson: stringFromJson)
  String get lastName;
  @JsonKey(name: 'phone_number', fromJson: stringFromJson)
  String get phoneNumber;
  ProfileCompanyModel? get company;

  /// Create a copy of AdminProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AdminProfileModelCopyWith<AdminProfileModel> get copyWith =>
      _$AdminProfileModelCopyWithImpl<AdminProfileModel>(
          this as AdminProfileModel, _$identity);

  /// Serializes this AdminProfileModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AdminProfileModel &&
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
    return 'AdminProfileModel(id: $id, email: $email, firstName: $firstName, lastName: $lastName, phoneNumber: $phoneNumber, company: $company)';
  }
}

/// @nodoc
abstract mixin class $AdminProfileModelCopyWith<$Res> {
  factory $AdminProfileModelCopyWith(
          AdminProfileModel value, $Res Function(AdminProfileModel) _then) =
      _$AdminProfileModelCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      @JsonKey(fromJson: stringFromJson) String email,
      @JsonKey(name: 'first_name', fromJson: stringFromJson) String firstName,
      @JsonKey(name: 'last_name', fromJson: stringFromJson) String lastName,
      @JsonKey(name: 'phone_number', fromJson: stringFromJson)
      String phoneNumber,
      ProfileCompanyModel? company});

  $ProfileCompanyModelCopyWith<$Res>? get company;
}

/// @nodoc
class _$AdminProfileModelCopyWithImpl<$Res>
    implements $AdminProfileModelCopyWith<$Res> {
  _$AdminProfileModelCopyWithImpl(this._self, this._then);

  final AdminProfileModel _self;
  final $Res Function(AdminProfileModel) _then;

  /// Create a copy of AdminProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? phoneNumber = null,
    Object? company = freezed,
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
      company: freezed == company
          ? _self.company
          : company // ignore: cast_nullable_to_non_nullable
              as ProfileCompanyModel?,
    ));
  }

  /// Create a copy of AdminProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProfileCompanyModelCopyWith<$Res>? get company {
    if (_self.company == null) {
      return null;
    }

    return $ProfileCompanyModelCopyWith<$Res>(_self.company!, (value) {
      return _then(_self.copyWith(company: value));
    });
  }
}

/// Adds pattern-matching-related methods to [AdminProfileModel].
extension AdminProfileModelPatterns on AdminProfileModel {
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
    TResult Function(_AdminProfileModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AdminProfileModel() when $default != null:
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
    TResult Function(_AdminProfileModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AdminProfileModel():
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
    TResult? Function(_AdminProfileModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AdminProfileModel() when $default != null:
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
    TResult Function(
            int id,
            @JsonKey(fromJson: stringFromJson) String email,
            @JsonKey(name: 'first_name', fromJson: stringFromJson)
            String firstName,
            @JsonKey(name: 'last_name', fromJson: stringFromJson)
            String lastName,
            @JsonKey(name: 'phone_number', fromJson: stringFromJson)
            String phoneNumber,
            ProfileCompanyModel? company)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AdminProfileModel() when $default != null:
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
    TResult Function(
            int id,
            @JsonKey(fromJson: stringFromJson) String email,
            @JsonKey(name: 'first_name', fromJson: stringFromJson)
            String firstName,
            @JsonKey(name: 'last_name', fromJson: stringFromJson)
            String lastName,
            @JsonKey(name: 'phone_number', fromJson: stringFromJson)
            String phoneNumber,
            ProfileCompanyModel? company)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AdminProfileModel():
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
    TResult? Function(
            int id,
            @JsonKey(fromJson: stringFromJson) String email,
            @JsonKey(name: 'first_name', fromJson: stringFromJson)
            String firstName,
            @JsonKey(name: 'last_name', fromJson: stringFromJson)
            String lastName,
            @JsonKey(name: 'phone_number', fromJson: stringFromJson)
            String phoneNumber,
            ProfileCompanyModel? company)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AdminProfileModel() when $default != null:
        return $default(_that.id, _that.email, _that.firstName, _that.lastName,
            _that.phoneNumber, _that.company);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _AdminProfileModel extends AdminProfileModel {
  const _AdminProfileModel(
      {required this.id,
      @JsonKey(fromJson: stringFromJson) this.email = '',
      @JsonKey(name: 'first_name', fromJson: stringFromJson)
      this.firstName = '',
      @JsonKey(name: 'last_name', fromJson: stringFromJson) this.lastName = '',
      @JsonKey(name: 'phone_number', fromJson: stringFromJson)
      this.phoneNumber = '',
      this.company})
      : super._();
  factory _AdminProfileModel.fromJson(Map<String, dynamic> json) =>
      _$AdminProfileModelFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(fromJson: stringFromJson)
  final String email;
  @override
  @JsonKey(name: 'first_name', fromJson: stringFromJson)
  final String firstName;
  @override
  @JsonKey(name: 'last_name', fromJson: stringFromJson)
  final String lastName;
  @override
  @JsonKey(name: 'phone_number', fromJson: stringFromJson)
  final String phoneNumber;
  @override
  final ProfileCompanyModel? company;

  /// Create a copy of AdminProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AdminProfileModelCopyWith<_AdminProfileModel> get copyWith =>
      __$AdminProfileModelCopyWithImpl<_AdminProfileModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AdminProfileModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AdminProfileModel &&
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
    return 'AdminProfileModel(id: $id, email: $email, firstName: $firstName, lastName: $lastName, phoneNumber: $phoneNumber, company: $company)';
  }
}

/// @nodoc
abstract mixin class _$AdminProfileModelCopyWith<$Res>
    implements $AdminProfileModelCopyWith<$Res> {
  factory _$AdminProfileModelCopyWith(
          _AdminProfileModel value, $Res Function(_AdminProfileModel) _then) =
      __$AdminProfileModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(fromJson: stringFromJson) String email,
      @JsonKey(name: 'first_name', fromJson: stringFromJson) String firstName,
      @JsonKey(name: 'last_name', fromJson: stringFromJson) String lastName,
      @JsonKey(name: 'phone_number', fromJson: stringFromJson)
      String phoneNumber,
      ProfileCompanyModel? company});

  @override
  $ProfileCompanyModelCopyWith<$Res>? get company;
}

/// @nodoc
class __$AdminProfileModelCopyWithImpl<$Res>
    implements _$AdminProfileModelCopyWith<$Res> {
  __$AdminProfileModelCopyWithImpl(this._self, this._then);

  final _AdminProfileModel _self;
  final $Res Function(_AdminProfileModel) _then;

  /// Create a copy of AdminProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? phoneNumber = null,
    Object? company = freezed,
  }) {
    return _then(_AdminProfileModel(
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
      company: freezed == company
          ? _self.company
          : company // ignore: cast_nullable_to_non_nullable
              as ProfileCompanyModel?,
    ));
  }

  /// Create a copy of AdminProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProfileCompanyModelCopyWith<$Res>? get company {
    if (_self.company == null) {
      return null;
    }

    return $ProfileCompanyModelCopyWith<$Res>(_self.company!, (value) {
      return _then(_self.copyWith(company: value));
    });
  }
}

/// @nodoc
mixin _$ProfileCompanyModel {
  int get id;
  @JsonKey(fromJson: stringFromJson)
  String get name;

  /// Create a copy of ProfileCompanyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProfileCompanyModelCopyWith<ProfileCompanyModel> get copyWith =>
      _$ProfileCompanyModelCopyWithImpl<ProfileCompanyModel>(
          this as ProfileCompanyModel, _$identity);

  /// Serializes this ProfileCompanyModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProfileCompanyModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @override
  String toString() {
    return 'ProfileCompanyModel(id: $id, name: $name)';
  }
}

/// @nodoc
abstract mixin class $ProfileCompanyModelCopyWith<$Res> {
  factory $ProfileCompanyModelCopyWith(
          ProfileCompanyModel value, $Res Function(ProfileCompanyModel) _then) =
      _$ProfileCompanyModelCopyWithImpl;
  @useResult
  $Res call({int id, @JsonKey(fromJson: stringFromJson) String name});
}

/// @nodoc
class _$ProfileCompanyModelCopyWithImpl<$Res>
    implements $ProfileCompanyModelCopyWith<$Res> {
  _$ProfileCompanyModelCopyWithImpl(this._self, this._then);

  final ProfileCompanyModel _self;
  final $Res Function(ProfileCompanyModel) _then;

  /// Create a copy of ProfileCompanyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [ProfileCompanyModel].
extension ProfileCompanyModelPatterns on ProfileCompanyModel {
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
    TResult Function(_ProfileCompanyModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProfileCompanyModel() when $default != null:
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
    TResult Function(_ProfileCompanyModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProfileCompanyModel():
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
    TResult? Function(_ProfileCompanyModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProfileCompanyModel() when $default != null:
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
    TResult Function(int id, @JsonKey(fromJson: stringFromJson) String name)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProfileCompanyModel() when $default != null:
        return $default(_that.id, _that.name);
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
    TResult Function(int id, @JsonKey(fromJson: stringFromJson) String name)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProfileCompanyModel():
        return $default(_that.id, _that.name);
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
    TResult? Function(int id, @JsonKey(fromJson: stringFromJson) String name)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProfileCompanyModel() when $default != null:
        return $default(_that.id, _that.name);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ProfileCompanyModel implements ProfileCompanyModel {
  const _ProfileCompanyModel(
      {required this.id, @JsonKey(fromJson: stringFromJson) this.name = ''});
  factory _ProfileCompanyModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileCompanyModelFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(fromJson: stringFromJson)
  final String name;

  /// Create a copy of ProfileCompanyModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProfileCompanyModelCopyWith<_ProfileCompanyModel> get copyWith =>
      __$ProfileCompanyModelCopyWithImpl<_ProfileCompanyModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ProfileCompanyModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProfileCompanyModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @override
  String toString() {
    return 'ProfileCompanyModel(id: $id, name: $name)';
  }
}

/// @nodoc
abstract mixin class _$ProfileCompanyModelCopyWith<$Res>
    implements $ProfileCompanyModelCopyWith<$Res> {
  factory _$ProfileCompanyModelCopyWith(_ProfileCompanyModel value,
          $Res Function(_ProfileCompanyModel) _then) =
      __$ProfileCompanyModelCopyWithImpl;
  @override
  @useResult
  $Res call({int id, @JsonKey(fromJson: stringFromJson) String name});
}

/// @nodoc
class __$ProfileCompanyModelCopyWithImpl<$Res>
    implements _$ProfileCompanyModelCopyWith<$Res> {
  __$ProfileCompanyModelCopyWithImpl(this._self, this._then);

  final _ProfileCompanyModel _self;
  final $Res Function(_ProfileCompanyModel) _then;

  /// Create a copy of ProfileCompanyModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_ProfileCompanyModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
