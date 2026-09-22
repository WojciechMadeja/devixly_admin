// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'token_response_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LoginResponseModel {
  LoginUserModel get user;

  /// Create a copy of LoginResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LoginResponseModelCopyWith<LoginResponseModel> get copyWith =>
      _$LoginResponseModelCopyWithImpl<LoginResponseModel>(
          this as LoginResponseModel, _$identity);

  /// Serializes this LoginResponseModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoginResponseModel &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, user);

  @override
  String toString() {
    return 'LoginResponseModel(user: $user)';
  }
}

/// @nodoc
abstract mixin class $LoginResponseModelCopyWith<$Res> {
  factory $LoginResponseModelCopyWith(
          LoginResponseModel value, $Res Function(LoginResponseModel) _then) =
      _$LoginResponseModelCopyWithImpl;
  @useResult
  $Res call({LoginUserModel user});

  $LoginUserModelCopyWith<$Res> get user;
}

/// @nodoc
class _$LoginResponseModelCopyWithImpl<$Res>
    implements $LoginResponseModelCopyWith<$Res> {
  _$LoginResponseModelCopyWithImpl(this._self, this._then);

  final LoginResponseModel _self;
  final $Res Function(LoginResponseModel) _then;

  /// Create a copy of LoginResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_self.copyWith(
      user: null == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as LoginUserModel,
    ));
  }

  /// Create a copy of LoginResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LoginUserModelCopyWith<$Res> get user {
    return $LoginUserModelCopyWith<$Res>(_self.user, (value) {
      return _then(_self.copyWith(user: value));
    });
  }
}

/// Adds pattern-matching-related methods to [LoginResponseModel].
extension LoginResponseModelPatterns on LoginResponseModel {
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
    TResult Function(_LoginResponseModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LoginResponseModel() when $default != null:
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
    TResult Function(_LoginResponseModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LoginResponseModel():
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
    TResult? Function(_LoginResponseModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LoginResponseModel() when $default != null:
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
    TResult Function(LoginUserModel user)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LoginResponseModel() when $default != null:
        return $default(_that.user);
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
    TResult Function(LoginUserModel user) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LoginResponseModel():
        return $default(_that.user);
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
    TResult? Function(LoginUserModel user)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LoginResponseModel() when $default != null:
        return $default(_that.user);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _LoginResponseModel extends LoginResponseModel {
  const _LoginResponseModel({required this.user}) : super._();
  factory _LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);

  @override
  final LoginUserModel user;

  /// Create a copy of LoginResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LoginResponseModelCopyWith<_LoginResponseModel> get copyWith =>
      __$LoginResponseModelCopyWithImpl<_LoginResponseModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$LoginResponseModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoginResponseModel &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, user);

  @override
  String toString() {
    return 'LoginResponseModel(user: $user)';
  }
}

/// @nodoc
abstract mixin class _$LoginResponseModelCopyWith<$Res>
    implements $LoginResponseModelCopyWith<$Res> {
  factory _$LoginResponseModelCopyWith(
          _LoginResponseModel value, $Res Function(_LoginResponseModel) _then) =
      __$LoginResponseModelCopyWithImpl;
  @override
  @useResult
  $Res call({LoginUserModel user});

  @override
  $LoginUserModelCopyWith<$Res> get user;
}

/// @nodoc
class __$LoginResponseModelCopyWithImpl<$Res>
    implements _$LoginResponseModelCopyWith<$Res> {
  __$LoginResponseModelCopyWithImpl(this._self, this._then);

  final _LoginResponseModel _self;
  final $Res Function(_LoginResponseModel) _then;

  /// Create a copy of LoginResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? user = null,
  }) {
    return _then(_LoginResponseModel(
      user: null == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as LoginUserModel,
    ));
  }

  /// Create a copy of LoginResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LoginUserModelCopyWith<$Res> get user {
    return $LoginUserModelCopyWith<$Res>(_self.user, (value) {
      return _then(_self.copyWith(user: value));
    });
  }
}

/// @nodoc
mixin _$LoginUserModel {
  int get id;
  String get authToken;
  String get refreshToken;
  int get refreshTokenId;
  int? get authTokenExpireAt;
  int? get expiresAt;
  String get email;
  String get firstName;
  String get lastName;
  @JsonKey(fromJson: stringFromJson)
  String get phoneNumber;
  @JsonKey(fromJson: stringFromJson)
  String get company;

  /// Create a copy of LoginUserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LoginUserModelCopyWith<LoginUserModel> get copyWith =>
      _$LoginUserModelCopyWithImpl<LoginUserModel>(
          this as LoginUserModel, _$identity);

  /// Serializes this LoginUserModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoginUserModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.authToken, authToken) ||
                other.authToken == authToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.refreshTokenId, refreshTokenId) ||
                other.refreshTokenId == refreshTokenId) &&
            (identical(other.authTokenExpireAt, authTokenExpireAt) ||
                other.authTokenExpireAt == authTokenExpireAt) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
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
      runtimeType,
      id,
      authToken,
      refreshToken,
      refreshTokenId,
      authTokenExpireAt,
      expiresAt,
      email,
      firstName,
      lastName,
      phoneNumber,
      company);

  @override
  String toString() {
    return 'LoginUserModel(id: $id, authToken: $authToken, refreshToken: $refreshToken, refreshTokenId: $refreshTokenId, authTokenExpireAt: $authTokenExpireAt, expiresAt: $expiresAt, email: $email, firstName: $firstName, lastName: $lastName, phoneNumber: $phoneNumber, company: $company)';
  }
}

/// @nodoc
abstract mixin class $LoginUserModelCopyWith<$Res> {
  factory $LoginUserModelCopyWith(
          LoginUserModel value, $Res Function(LoginUserModel) _then) =
      _$LoginUserModelCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      String authToken,
      String refreshToken,
      int refreshTokenId,
      int? authTokenExpireAt,
      int? expiresAt,
      String email,
      String firstName,
      String lastName,
      @JsonKey(fromJson: stringFromJson) String phoneNumber,
      @JsonKey(fromJson: stringFromJson) String company});
}

/// @nodoc
class _$LoginUserModelCopyWithImpl<$Res>
    implements $LoginUserModelCopyWith<$Res> {
  _$LoginUserModelCopyWithImpl(this._self, this._then);

  final LoginUserModel _self;
  final $Res Function(LoginUserModel) _then;

  /// Create a copy of LoginUserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? authToken = null,
    Object? refreshToken = null,
    Object? refreshTokenId = null,
    Object? authTokenExpireAt = freezed,
    Object? expiresAt = freezed,
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
      authToken: null == authToken
          ? _self.authToken
          : authToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _self.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshTokenId: null == refreshTokenId
          ? _self.refreshTokenId
          : refreshTokenId // ignore: cast_nullable_to_non_nullable
              as int,
      authTokenExpireAt: freezed == authTokenExpireAt
          ? _self.authTokenExpireAt
          : authTokenExpireAt // ignore: cast_nullable_to_non_nullable
              as int?,
      expiresAt: freezed == expiresAt
          ? _self.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as int?,
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

/// Adds pattern-matching-related methods to [LoginUserModel].
extension LoginUserModelPatterns on LoginUserModel {
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
    TResult Function(_LoginUserModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LoginUserModel() when $default != null:
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
    TResult Function(_LoginUserModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LoginUserModel():
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
    TResult? Function(_LoginUserModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LoginUserModel() when $default != null:
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
            String authToken,
            String refreshToken,
            int refreshTokenId,
            int? authTokenExpireAt,
            int? expiresAt,
            String email,
            String firstName,
            String lastName,
            @JsonKey(fromJson: stringFromJson) String phoneNumber,
            @JsonKey(fromJson: stringFromJson) String company)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LoginUserModel() when $default != null:
        return $default(
            _that.id,
            _that.authToken,
            _that.refreshToken,
            _that.refreshTokenId,
            _that.authTokenExpireAt,
            _that.expiresAt,
            _that.email,
            _that.firstName,
            _that.lastName,
            _that.phoneNumber,
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
            String authToken,
            String refreshToken,
            int refreshTokenId,
            int? authTokenExpireAt,
            int? expiresAt,
            String email,
            String firstName,
            String lastName,
            @JsonKey(fromJson: stringFromJson) String phoneNumber,
            @JsonKey(fromJson: stringFromJson) String company)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LoginUserModel():
        return $default(
            _that.id,
            _that.authToken,
            _that.refreshToken,
            _that.refreshTokenId,
            _that.authTokenExpireAt,
            _that.expiresAt,
            _that.email,
            _that.firstName,
            _that.lastName,
            _that.phoneNumber,
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
            String authToken,
            String refreshToken,
            int refreshTokenId,
            int? authTokenExpireAt,
            int? expiresAt,
            String email,
            String firstName,
            String lastName,
            @JsonKey(fromJson: stringFromJson) String phoneNumber,
            @JsonKey(fromJson: stringFromJson) String company)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LoginUserModel() when $default != null:
        return $default(
            _that.id,
            _that.authToken,
            _that.refreshToken,
            _that.refreshTokenId,
            _that.authTokenExpireAt,
            _that.expiresAt,
            _that.email,
            _that.firstName,
            _that.lastName,
            _that.phoneNumber,
            _that.company);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _LoginUserModel implements LoginUserModel {
  const _LoginUserModel(
      {required this.id,
      required this.authToken,
      required this.refreshToken,
      required this.refreshTokenId,
      this.authTokenExpireAt,
      this.expiresAt,
      this.email = '',
      this.firstName = '',
      this.lastName = '',
      @JsonKey(fromJson: stringFromJson) this.phoneNumber = '',
      @JsonKey(fromJson: stringFromJson) this.company = ''});
  factory _LoginUserModel.fromJson(Map<String, dynamic> json) =>
      _$LoginUserModelFromJson(json);

  @override
  final int id;
  @override
  final String authToken;
  @override
  final String refreshToken;
  @override
  final int refreshTokenId;
  @override
  final int? authTokenExpireAt;
  @override
  final int? expiresAt;
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
  @JsonKey(fromJson: stringFromJson)
  final String phoneNumber;
  @override
  @JsonKey(fromJson: stringFromJson)
  final String company;

  /// Create a copy of LoginUserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LoginUserModelCopyWith<_LoginUserModel> get copyWith =>
      __$LoginUserModelCopyWithImpl<_LoginUserModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$LoginUserModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoginUserModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.authToken, authToken) ||
                other.authToken == authToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.refreshTokenId, refreshTokenId) ||
                other.refreshTokenId == refreshTokenId) &&
            (identical(other.authTokenExpireAt, authTokenExpireAt) ||
                other.authTokenExpireAt == authTokenExpireAt) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
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
      runtimeType,
      id,
      authToken,
      refreshToken,
      refreshTokenId,
      authTokenExpireAt,
      expiresAt,
      email,
      firstName,
      lastName,
      phoneNumber,
      company);

  @override
  String toString() {
    return 'LoginUserModel(id: $id, authToken: $authToken, refreshToken: $refreshToken, refreshTokenId: $refreshTokenId, authTokenExpireAt: $authTokenExpireAt, expiresAt: $expiresAt, email: $email, firstName: $firstName, lastName: $lastName, phoneNumber: $phoneNumber, company: $company)';
  }
}

/// @nodoc
abstract mixin class _$LoginUserModelCopyWith<$Res>
    implements $LoginUserModelCopyWith<$Res> {
  factory _$LoginUserModelCopyWith(
          _LoginUserModel value, $Res Function(_LoginUserModel) _then) =
      __$LoginUserModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      String authToken,
      String refreshToken,
      int refreshTokenId,
      int? authTokenExpireAt,
      int? expiresAt,
      String email,
      String firstName,
      String lastName,
      @JsonKey(fromJson: stringFromJson) String phoneNumber,
      @JsonKey(fromJson: stringFromJson) String company});
}

/// @nodoc
class __$LoginUserModelCopyWithImpl<$Res>
    implements _$LoginUserModelCopyWith<$Res> {
  __$LoginUserModelCopyWithImpl(this._self, this._then);

  final _LoginUserModel _self;
  final $Res Function(_LoginUserModel) _then;

  /// Create a copy of LoginUserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? authToken = null,
    Object? refreshToken = null,
    Object? refreshTokenId = null,
    Object? authTokenExpireAt = freezed,
    Object? expiresAt = freezed,
    Object? email = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? phoneNumber = null,
    Object? company = null,
  }) {
    return _then(_LoginUserModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      authToken: null == authToken
          ? _self.authToken
          : authToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _self.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshTokenId: null == refreshTokenId
          ? _self.refreshTokenId
          : refreshTokenId // ignore: cast_nullable_to_non_nullable
              as int,
      authTokenExpireAt: freezed == authTokenExpireAt
          ? _self.authTokenExpireAt
          : authTokenExpireAt // ignore: cast_nullable_to_non_nullable
              as int?,
      expiresAt: freezed == expiresAt
          ? _self.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as int?,
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

/// @nodoc
mixin _$RefreshResponseModel {
  int get userId;
  String get authToken;
  String get refreshToken;
  int get refreshTokenId;
  int? get authTokenExpireAt;
  int? get expiresAt;
  String? get email;
  String? get firstName;
  String? get lastName;
  @JsonKey(fromJson: _optionalString)
  String? get phoneNumber;
  @JsonKey(fromJson: _optionalString)
  String? get company;

  /// Create a copy of RefreshResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RefreshResponseModelCopyWith<RefreshResponseModel> get copyWith =>
      _$RefreshResponseModelCopyWithImpl<RefreshResponseModel>(
          this as RefreshResponseModel, _$identity);

  /// Serializes this RefreshResponseModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RefreshResponseModel &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.authToken, authToken) ||
                other.authToken == authToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.refreshTokenId, refreshTokenId) ||
                other.refreshTokenId == refreshTokenId) &&
            (identical(other.authTokenExpireAt, authTokenExpireAt) ||
                other.authTokenExpireAt == authTokenExpireAt) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
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
      runtimeType,
      userId,
      authToken,
      refreshToken,
      refreshTokenId,
      authTokenExpireAt,
      expiresAt,
      email,
      firstName,
      lastName,
      phoneNumber,
      company);

  @override
  String toString() {
    return 'RefreshResponseModel(userId: $userId, authToken: $authToken, refreshToken: $refreshToken, refreshTokenId: $refreshTokenId, authTokenExpireAt: $authTokenExpireAt, expiresAt: $expiresAt, email: $email, firstName: $firstName, lastName: $lastName, phoneNumber: $phoneNumber, company: $company)';
  }
}

/// @nodoc
abstract mixin class $RefreshResponseModelCopyWith<$Res> {
  factory $RefreshResponseModelCopyWith(RefreshResponseModel value,
          $Res Function(RefreshResponseModel) _then) =
      _$RefreshResponseModelCopyWithImpl;
  @useResult
  $Res call(
      {int userId,
      String authToken,
      String refreshToken,
      int refreshTokenId,
      int? authTokenExpireAt,
      int? expiresAt,
      String? email,
      String? firstName,
      String? lastName,
      @JsonKey(fromJson: _optionalString) String? phoneNumber,
      @JsonKey(fromJson: _optionalString) String? company});
}

/// @nodoc
class _$RefreshResponseModelCopyWithImpl<$Res>
    implements $RefreshResponseModelCopyWith<$Res> {
  _$RefreshResponseModelCopyWithImpl(this._self, this._then);

  final RefreshResponseModel _self;
  final $Res Function(RefreshResponseModel) _then;

  /// Create a copy of RefreshResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? authToken = null,
    Object? refreshToken = null,
    Object? refreshTokenId = null,
    Object? authTokenExpireAt = freezed,
    Object? expiresAt = freezed,
    Object? email = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? phoneNumber = freezed,
    Object? company = freezed,
  }) {
    return _then(_self.copyWith(
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      authToken: null == authToken
          ? _self.authToken
          : authToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _self.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshTokenId: null == refreshTokenId
          ? _self.refreshTokenId
          : refreshTokenId // ignore: cast_nullable_to_non_nullable
              as int,
      authTokenExpireAt: freezed == authTokenExpireAt
          ? _self.authTokenExpireAt
          : authTokenExpireAt // ignore: cast_nullable_to_non_nullable
              as int?,
      expiresAt: freezed == expiresAt
          ? _self.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as int?,
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _self.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _self.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _self.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      company: freezed == company
          ? _self.company
          : company // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [RefreshResponseModel].
extension RefreshResponseModelPatterns on RefreshResponseModel {
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
    TResult Function(_RefreshResponseModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RefreshResponseModel() when $default != null:
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
    TResult Function(_RefreshResponseModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RefreshResponseModel():
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
    TResult? Function(_RefreshResponseModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RefreshResponseModel() when $default != null:
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
            int userId,
            String authToken,
            String refreshToken,
            int refreshTokenId,
            int? authTokenExpireAt,
            int? expiresAt,
            String? email,
            String? firstName,
            String? lastName,
            @JsonKey(fromJson: _optionalString) String? phoneNumber,
            @JsonKey(fromJson: _optionalString) String? company)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RefreshResponseModel() when $default != null:
        return $default(
            _that.userId,
            _that.authToken,
            _that.refreshToken,
            _that.refreshTokenId,
            _that.authTokenExpireAt,
            _that.expiresAt,
            _that.email,
            _that.firstName,
            _that.lastName,
            _that.phoneNumber,
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
            int userId,
            String authToken,
            String refreshToken,
            int refreshTokenId,
            int? authTokenExpireAt,
            int? expiresAt,
            String? email,
            String? firstName,
            String? lastName,
            @JsonKey(fromJson: _optionalString) String? phoneNumber,
            @JsonKey(fromJson: _optionalString) String? company)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RefreshResponseModel():
        return $default(
            _that.userId,
            _that.authToken,
            _that.refreshToken,
            _that.refreshTokenId,
            _that.authTokenExpireAt,
            _that.expiresAt,
            _that.email,
            _that.firstName,
            _that.lastName,
            _that.phoneNumber,
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
            int userId,
            String authToken,
            String refreshToken,
            int refreshTokenId,
            int? authTokenExpireAt,
            int? expiresAt,
            String? email,
            String? firstName,
            String? lastName,
            @JsonKey(fromJson: _optionalString) String? phoneNumber,
            @JsonKey(fromJson: _optionalString) String? company)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RefreshResponseModel() when $default != null:
        return $default(
            _that.userId,
            _that.authToken,
            _that.refreshToken,
            _that.refreshTokenId,
            _that.authTokenExpireAt,
            _that.expiresAt,
            _that.email,
            _that.firstName,
            _that.lastName,
            _that.phoneNumber,
            _that.company);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _RefreshResponseModel extends RefreshResponseModel {
  const _RefreshResponseModel(
      {required this.userId,
      required this.authToken,
      required this.refreshToken,
      required this.refreshTokenId,
      this.authTokenExpireAt,
      this.expiresAt,
      this.email,
      this.firstName,
      this.lastName,
      @JsonKey(fromJson: _optionalString) this.phoneNumber,
      @JsonKey(fromJson: _optionalString) this.company})
      : super._();
  factory _RefreshResponseModel.fromJson(Map<String, dynamic> json) =>
      _$RefreshResponseModelFromJson(json);

  @override
  final int userId;
  @override
  final String authToken;
  @override
  final String refreshToken;
  @override
  final int refreshTokenId;
  @override
  final int? authTokenExpireAt;
  @override
  final int? expiresAt;
  @override
  final String? email;
  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  @JsonKey(fromJson: _optionalString)
  final String? phoneNumber;
  @override
  @JsonKey(fromJson: _optionalString)
  final String? company;

  /// Create a copy of RefreshResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RefreshResponseModelCopyWith<_RefreshResponseModel> get copyWith =>
      __$RefreshResponseModelCopyWithImpl<_RefreshResponseModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RefreshResponseModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RefreshResponseModel &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.authToken, authToken) ||
                other.authToken == authToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.refreshTokenId, refreshTokenId) ||
                other.refreshTokenId == refreshTokenId) &&
            (identical(other.authTokenExpireAt, authTokenExpireAt) ||
                other.authTokenExpireAt == authTokenExpireAt) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
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
      runtimeType,
      userId,
      authToken,
      refreshToken,
      refreshTokenId,
      authTokenExpireAt,
      expiresAt,
      email,
      firstName,
      lastName,
      phoneNumber,
      company);

  @override
  String toString() {
    return 'RefreshResponseModel(userId: $userId, authToken: $authToken, refreshToken: $refreshToken, refreshTokenId: $refreshTokenId, authTokenExpireAt: $authTokenExpireAt, expiresAt: $expiresAt, email: $email, firstName: $firstName, lastName: $lastName, phoneNumber: $phoneNumber, company: $company)';
  }
}

/// @nodoc
abstract mixin class _$RefreshResponseModelCopyWith<$Res>
    implements $RefreshResponseModelCopyWith<$Res> {
  factory _$RefreshResponseModelCopyWith(_RefreshResponseModel value,
          $Res Function(_RefreshResponseModel) _then) =
      __$RefreshResponseModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int userId,
      String authToken,
      String refreshToken,
      int refreshTokenId,
      int? authTokenExpireAt,
      int? expiresAt,
      String? email,
      String? firstName,
      String? lastName,
      @JsonKey(fromJson: _optionalString) String? phoneNumber,
      @JsonKey(fromJson: _optionalString) String? company});
}

/// @nodoc
class __$RefreshResponseModelCopyWithImpl<$Res>
    implements _$RefreshResponseModelCopyWith<$Res> {
  __$RefreshResponseModelCopyWithImpl(this._self, this._then);

  final _RefreshResponseModel _self;
  final $Res Function(_RefreshResponseModel) _then;

  /// Create a copy of RefreshResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? userId = null,
    Object? authToken = null,
    Object? refreshToken = null,
    Object? refreshTokenId = null,
    Object? authTokenExpireAt = freezed,
    Object? expiresAt = freezed,
    Object? email = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? phoneNumber = freezed,
    Object? company = freezed,
  }) {
    return _then(_RefreshResponseModel(
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      authToken: null == authToken
          ? _self.authToken
          : authToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _self.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshTokenId: null == refreshTokenId
          ? _self.refreshTokenId
          : refreshTokenId // ignore: cast_nullable_to_non_nullable
              as int,
      authTokenExpireAt: freezed == authTokenExpireAt
          ? _self.authTokenExpireAt
          : authTokenExpireAt // ignore: cast_nullable_to_non_nullable
              as int?,
      expiresAt: freezed == expiresAt
          ? _self.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as int?,
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _self.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _self.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _self.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      company: freezed == company
          ? _self.company
          : company // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
