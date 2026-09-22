// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'managed_user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ManagedUserModel {
  int get id;
  @JsonKey(name: 'first_name', fromJson: stringFromJson)
  String get firstName;
  @JsonKey(name: 'last_name', fromJson: stringFromJson)
  String get lastName;
  @JsonKey(fromJson: stringFromJson)
  String get email;
  @JsonKey(name: 'phone_number', fromJson: stringFromJson)
  String get phoneNumber;
  @JsonKey(name: 'is_administrator')
  bool get isAdministrator;
  @JsonKey(name: 'is_blocked')
  bool get isBlocked;
  UserCompanyModel? get company;

  /// Create a copy of ManagedUserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ManagedUserModelCopyWith<ManagedUserModel> get copyWith =>
      _$ManagedUserModelCopyWithImpl<ManagedUserModel>(
          this as ManagedUserModel, _$identity);

  /// Serializes this ManagedUserModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ManagedUserModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.isAdministrator, isAdministrator) ||
                other.isAdministrator == isAdministrator) &&
            (identical(other.isBlocked, isBlocked) ||
                other.isBlocked == isBlocked) &&
            (identical(other.company, company) || other.company == company));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, firstName, lastName, email,
      phoneNumber, isAdministrator, isBlocked, company);

  @override
  String toString() {
    return 'ManagedUserModel(id: $id, firstName: $firstName, lastName: $lastName, email: $email, phoneNumber: $phoneNumber, isAdministrator: $isAdministrator, isBlocked: $isBlocked, company: $company)';
  }
}

/// @nodoc
abstract mixin class $ManagedUserModelCopyWith<$Res> {
  factory $ManagedUserModelCopyWith(
          ManagedUserModel value, $Res Function(ManagedUserModel) _then) =
      _$ManagedUserModelCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'first_name', fromJson: stringFromJson) String firstName,
      @JsonKey(name: 'last_name', fromJson: stringFromJson) String lastName,
      @JsonKey(fromJson: stringFromJson) String email,
      @JsonKey(name: 'phone_number', fromJson: stringFromJson)
      String phoneNumber,
      @JsonKey(name: 'is_administrator') bool isAdministrator,
      @JsonKey(name: 'is_blocked') bool isBlocked,
      UserCompanyModel? company});

  $UserCompanyModelCopyWith<$Res>? get company;
}

/// @nodoc
class _$ManagedUserModelCopyWithImpl<$Res>
    implements $ManagedUserModelCopyWith<$Res> {
  _$ManagedUserModelCopyWithImpl(this._self, this._then);

  final ManagedUserModel _self;
  final $Res Function(ManagedUserModel) _then;

  /// Create a copy of ManagedUserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? email = null,
    Object? phoneNumber = null,
    Object? isAdministrator = null,
    Object? isBlocked = null,
    Object? company = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      firstName: null == firstName
          ? _self.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _self.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _self.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      isAdministrator: null == isAdministrator
          ? _self.isAdministrator
          : isAdministrator // ignore: cast_nullable_to_non_nullable
              as bool,
      isBlocked: null == isBlocked
          ? _self.isBlocked
          : isBlocked // ignore: cast_nullable_to_non_nullable
              as bool,
      company: freezed == company
          ? _self.company
          : company // ignore: cast_nullable_to_non_nullable
              as UserCompanyModel?,
    ));
  }

  /// Create a copy of ManagedUserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCompanyModelCopyWith<$Res>? get company {
    if (_self.company == null) {
      return null;
    }

    return $UserCompanyModelCopyWith<$Res>(_self.company!, (value) {
      return _then(_self.copyWith(company: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ManagedUserModel].
extension ManagedUserModelPatterns on ManagedUserModel {
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
    TResult Function(_ManagedUserModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ManagedUserModel() when $default != null:
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
    TResult Function(_ManagedUserModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ManagedUserModel():
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
    TResult? Function(_ManagedUserModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ManagedUserModel() when $default != null:
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
            @JsonKey(name: 'first_name', fromJson: stringFromJson)
            String firstName,
            @JsonKey(name: 'last_name', fromJson: stringFromJson)
            String lastName,
            @JsonKey(fromJson: stringFromJson) String email,
            @JsonKey(name: 'phone_number', fromJson: stringFromJson)
            String phoneNumber,
            @JsonKey(name: 'is_administrator') bool isAdministrator,
            @JsonKey(name: 'is_blocked') bool isBlocked,
            UserCompanyModel? company)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ManagedUserModel() when $default != null:
        return $default(
            _that.id,
            _that.firstName,
            _that.lastName,
            _that.email,
            _that.phoneNumber,
            _that.isAdministrator,
            _that.isBlocked,
            _that.company);
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
            @JsonKey(name: 'first_name', fromJson: stringFromJson)
            String firstName,
            @JsonKey(name: 'last_name', fromJson: stringFromJson)
            String lastName,
            @JsonKey(fromJson: stringFromJson) String email,
            @JsonKey(name: 'phone_number', fromJson: stringFromJson)
            String phoneNumber,
            @JsonKey(name: 'is_administrator') bool isAdministrator,
            @JsonKey(name: 'is_blocked') bool isBlocked,
            UserCompanyModel? company)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ManagedUserModel():
        return $default(
            _that.id,
            _that.firstName,
            _that.lastName,
            _that.email,
            _that.phoneNumber,
            _that.isAdministrator,
            _that.isBlocked,
            _that.company);
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
            @JsonKey(name: 'first_name', fromJson: stringFromJson)
            String firstName,
            @JsonKey(name: 'last_name', fromJson: stringFromJson)
            String lastName,
            @JsonKey(fromJson: stringFromJson) String email,
            @JsonKey(name: 'phone_number', fromJson: stringFromJson)
            String phoneNumber,
            @JsonKey(name: 'is_administrator') bool isAdministrator,
            @JsonKey(name: 'is_blocked') bool isBlocked,
            UserCompanyModel? company)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ManagedUserModel() when $default != null:
        return $default(
            _that.id,
            _that.firstName,
            _that.lastName,
            _that.email,
            _that.phoneNumber,
            _that.isAdministrator,
            _that.isBlocked,
            _that.company);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ManagedUserModel extends ManagedUserModel {
  const _ManagedUserModel(
      {required this.id,
      @JsonKey(name: 'first_name', fromJson: stringFromJson)
      this.firstName = '',
      @JsonKey(name: 'last_name', fromJson: stringFromJson) this.lastName = '',
      @JsonKey(fromJson: stringFromJson) this.email = '',
      @JsonKey(name: 'phone_number', fromJson: stringFromJson)
      this.phoneNumber = '',
      @JsonKey(name: 'is_administrator') this.isAdministrator = false,
      @JsonKey(name: 'is_blocked') this.isBlocked = false,
      this.company})
      : super._();
  factory _ManagedUserModel.fromJson(Map<String, dynamic> json) =>
      _$ManagedUserModelFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'first_name', fromJson: stringFromJson)
  final String firstName;
  @override
  @JsonKey(name: 'last_name', fromJson: stringFromJson)
  final String lastName;
  @override
  @JsonKey(fromJson: stringFromJson)
  final String email;
  @override
  @JsonKey(name: 'phone_number', fromJson: stringFromJson)
  final String phoneNumber;
  @override
  @JsonKey(name: 'is_administrator')
  final bool isAdministrator;
  @override
  @JsonKey(name: 'is_blocked')
  final bool isBlocked;
  @override
  final UserCompanyModel? company;

  /// Create a copy of ManagedUserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ManagedUserModelCopyWith<_ManagedUserModel> get copyWith =>
      __$ManagedUserModelCopyWithImpl<_ManagedUserModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ManagedUserModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ManagedUserModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.isAdministrator, isAdministrator) ||
                other.isAdministrator == isAdministrator) &&
            (identical(other.isBlocked, isBlocked) ||
                other.isBlocked == isBlocked) &&
            (identical(other.company, company) || other.company == company));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, firstName, lastName, email,
      phoneNumber, isAdministrator, isBlocked, company);

  @override
  String toString() {
    return 'ManagedUserModel(id: $id, firstName: $firstName, lastName: $lastName, email: $email, phoneNumber: $phoneNumber, isAdministrator: $isAdministrator, isBlocked: $isBlocked, company: $company)';
  }
}

/// @nodoc
abstract mixin class _$ManagedUserModelCopyWith<$Res>
    implements $ManagedUserModelCopyWith<$Res> {
  factory _$ManagedUserModelCopyWith(
          _ManagedUserModel value, $Res Function(_ManagedUserModel) _then) =
      __$ManagedUserModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'first_name', fromJson: stringFromJson) String firstName,
      @JsonKey(name: 'last_name', fromJson: stringFromJson) String lastName,
      @JsonKey(fromJson: stringFromJson) String email,
      @JsonKey(name: 'phone_number', fromJson: stringFromJson)
      String phoneNumber,
      @JsonKey(name: 'is_administrator') bool isAdministrator,
      @JsonKey(name: 'is_blocked') bool isBlocked,
      UserCompanyModel? company});

  @override
  $UserCompanyModelCopyWith<$Res>? get company;
}

/// @nodoc
class __$ManagedUserModelCopyWithImpl<$Res>
    implements _$ManagedUserModelCopyWith<$Res> {
  __$ManagedUserModelCopyWithImpl(this._self, this._then);

  final _ManagedUserModel _self;
  final $Res Function(_ManagedUserModel) _then;

  /// Create a copy of ManagedUserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? email = null,
    Object? phoneNumber = null,
    Object? isAdministrator = null,
    Object? isBlocked = null,
    Object? company = freezed,
  }) {
    return _then(_ManagedUserModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      firstName: null == firstName
          ? _self.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _self.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _self.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      isAdministrator: null == isAdministrator
          ? _self.isAdministrator
          : isAdministrator // ignore: cast_nullable_to_non_nullable
              as bool,
      isBlocked: null == isBlocked
          ? _self.isBlocked
          : isBlocked // ignore: cast_nullable_to_non_nullable
              as bool,
      company: freezed == company
          ? _self.company
          : company // ignore: cast_nullable_to_non_nullable
              as UserCompanyModel?,
    ));
  }

  /// Create a copy of ManagedUserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCompanyModelCopyWith<$Res>? get company {
    if (_self.company == null) {
      return null;
    }

    return $UserCompanyModelCopyWith<$Res>(_self.company!, (value) {
      return _then(_self.copyWith(company: value));
    });
  }
}

/// @nodoc
mixin _$UserCompanyModel {
  int get id;
  @JsonKey(fromJson: stringFromJson)
  String get name;
  @JsonKey(name: 'is_blocked')
  bool get isBlocked;

  /// Create a copy of UserCompanyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserCompanyModelCopyWith<UserCompanyModel> get copyWith =>
      _$UserCompanyModelCopyWithImpl<UserCompanyModel>(
          this as UserCompanyModel, _$identity);

  /// Serializes this UserCompanyModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserCompanyModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.isBlocked, isBlocked) ||
                other.isBlocked == isBlocked));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, isBlocked);

  @override
  String toString() {
    return 'UserCompanyModel(id: $id, name: $name, isBlocked: $isBlocked)';
  }
}

/// @nodoc
abstract mixin class $UserCompanyModelCopyWith<$Res> {
  factory $UserCompanyModelCopyWith(
          UserCompanyModel value, $Res Function(UserCompanyModel) _then) =
      _$UserCompanyModelCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      @JsonKey(fromJson: stringFromJson) String name,
      @JsonKey(name: 'is_blocked') bool isBlocked});
}

/// @nodoc
class _$UserCompanyModelCopyWithImpl<$Res>
    implements $UserCompanyModelCopyWith<$Res> {
  _$UserCompanyModelCopyWithImpl(this._self, this._then);

  final UserCompanyModel _self;
  final $Res Function(UserCompanyModel) _then;

  /// Create a copy of UserCompanyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? isBlocked = null,
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
      isBlocked: null == isBlocked
          ? _self.isBlocked
          : isBlocked // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [UserCompanyModel].
extension UserCompanyModelPatterns on UserCompanyModel {
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
    TResult Function(_UserCompanyModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserCompanyModel() when $default != null:
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
    TResult Function(_UserCompanyModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserCompanyModel():
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
    TResult? Function(_UserCompanyModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserCompanyModel() when $default != null:
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
    TResult Function(int id, @JsonKey(fromJson: stringFromJson) String name,
            @JsonKey(name: 'is_blocked') bool isBlocked)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserCompanyModel() when $default != null:
        return $default(_that.id, _that.name, _that.isBlocked);
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
    TResult Function(int id, @JsonKey(fromJson: stringFromJson) String name,
            @JsonKey(name: 'is_blocked') bool isBlocked)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserCompanyModel():
        return $default(_that.id, _that.name, _that.isBlocked);
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
    TResult? Function(int id, @JsonKey(fromJson: stringFromJson) String name,
            @JsonKey(name: 'is_blocked') bool isBlocked)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserCompanyModel() when $default != null:
        return $default(_that.id, _that.name, _that.isBlocked);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _UserCompanyModel extends UserCompanyModel {
  const _UserCompanyModel(
      {required this.id,
      @JsonKey(fromJson: stringFromJson) this.name = '',
      @JsonKey(name: 'is_blocked') this.isBlocked = false})
      : super._();
  factory _UserCompanyModel.fromJson(Map<String, dynamic> json) =>
      _$UserCompanyModelFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(fromJson: stringFromJson)
  final String name;
  @override
  @JsonKey(name: 'is_blocked')
  final bool isBlocked;

  /// Create a copy of UserCompanyModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserCompanyModelCopyWith<_UserCompanyModel> get copyWith =>
      __$UserCompanyModelCopyWithImpl<_UserCompanyModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserCompanyModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserCompanyModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.isBlocked, isBlocked) ||
                other.isBlocked == isBlocked));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, isBlocked);

  @override
  String toString() {
    return 'UserCompanyModel(id: $id, name: $name, isBlocked: $isBlocked)';
  }
}

/// @nodoc
abstract mixin class _$UserCompanyModelCopyWith<$Res>
    implements $UserCompanyModelCopyWith<$Res> {
  factory _$UserCompanyModelCopyWith(
          _UserCompanyModel value, $Res Function(_UserCompanyModel) _then) =
      __$UserCompanyModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(fromJson: stringFromJson) String name,
      @JsonKey(name: 'is_blocked') bool isBlocked});
}

/// @nodoc
class __$UserCompanyModelCopyWithImpl<$Res>
    implements _$UserCompanyModelCopyWith<$Res> {
  __$UserCompanyModelCopyWithImpl(this._self, this._then);

  final _UserCompanyModel _self;
  final $Res Function(_UserCompanyModel) _then;

  /// Create a copy of UserCompanyModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? isBlocked = null,
  }) {
    return _then(_UserCompanyModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isBlocked: null == isBlocked
          ? _self.isBlocked
          : isBlocked // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
