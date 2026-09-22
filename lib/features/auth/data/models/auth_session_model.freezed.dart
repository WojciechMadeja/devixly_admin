// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_session_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuthSessionModel {
  String get accessToken;
  String get refreshToken;
  int get refreshTokenId;
  AdminUserModel get user;
  int? get accessTokenExpiresAt;
  int? get sessionExpiresAt;

  /// Create a copy of AuthSessionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AuthSessionModelCopyWith<AuthSessionModel> get copyWith =>
      _$AuthSessionModelCopyWithImpl<AuthSessionModel>(
          this as AuthSessionModel, _$identity);

  /// Serializes this AuthSessionModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AuthSessionModel &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.refreshTokenId, refreshTokenId) ||
                other.refreshTokenId == refreshTokenId) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.accessTokenExpiresAt, accessTokenExpiresAt) ||
                other.accessTokenExpiresAt == accessTokenExpiresAt) &&
            (identical(other.sessionExpiresAt, sessionExpiresAt) ||
                other.sessionExpiresAt == sessionExpiresAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, accessToken, refreshToken,
      refreshTokenId, user, accessTokenExpiresAt, sessionExpiresAt);

  @override
  String toString() {
    return 'AuthSessionModel(accessToken: $accessToken, refreshToken: $refreshToken, refreshTokenId: $refreshTokenId, user: $user, accessTokenExpiresAt: $accessTokenExpiresAt, sessionExpiresAt: $sessionExpiresAt)';
  }
}

/// @nodoc
abstract mixin class $AuthSessionModelCopyWith<$Res> {
  factory $AuthSessionModelCopyWith(
          AuthSessionModel value, $Res Function(AuthSessionModel) _then) =
      _$AuthSessionModelCopyWithImpl;
  @useResult
  $Res call(
      {String accessToken,
      String refreshToken,
      int refreshTokenId,
      AdminUserModel user,
      int? accessTokenExpiresAt,
      int? sessionExpiresAt});

  $AdminUserModelCopyWith<$Res> get user;
}

/// @nodoc
class _$AuthSessionModelCopyWithImpl<$Res>
    implements $AuthSessionModelCopyWith<$Res> {
  _$AuthSessionModelCopyWithImpl(this._self, this._then);

  final AuthSessionModel _self;
  final $Res Function(AuthSessionModel) _then;

  /// Create a copy of AuthSessionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = null,
    Object? refreshTokenId = null,
    Object? user = null,
    Object? accessTokenExpiresAt = freezed,
    Object? sessionExpiresAt = freezed,
  }) {
    return _then(_self.copyWith(
      accessToken: null == accessToken
          ? _self.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _self.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshTokenId: null == refreshTokenId
          ? _self.refreshTokenId
          : refreshTokenId // ignore: cast_nullable_to_non_nullable
              as int,
      user: null == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as AdminUserModel,
      accessTokenExpiresAt: freezed == accessTokenExpiresAt
          ? _self.accessTokenExpiresAt
          : accessTokenExpiresAt // ignore: cast_nullable_to_non_nullable
              as int?,
      sessionExpiresAt: freezed == sessionExpiresAt
          ? _self.sessionExpiresAt
          : sessionExpiresAt // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }

  /// Create a copy of AuthSessionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AdminUserModelCopyWith<$Res> get user {
    return $AdminUserModelCopyWith<$Res>(_self.user, (value) {
      return _then(_self.copyWith(user: value));
    });
  }
}

/// Adds pattern-matching-related methods to [AuthSessionModel].
extension AuthSessionModelPatterns on AuthSessionModel {
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
    TResult Function(_AuthSessionModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AuthSessionModel() when $default != null:
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
    TResult Function(_AuthSessionModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AuthSessionModel():
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
    TResult? Function(_AuthSessionModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AuthSessionModel() when $default != null:
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
            String accessToken,
            String refreshToken,
            int refreshTokenId,
            AdminUserModel user,
            int? accessTokenExpiresAt,
            int? sessionExpiresAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AuthSessionModel() when $default != null:
        return $default(
            _that.accessToken,
            _that.refreshToken,
            _that.refreshTokenId,
            _that.user,
            _that.accessTokenExpiresAt,
            _that.sessionExpiresAt);
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
            String accessToken,
            String refreshToken,
            int refreshTokenId,
            AdminUserModel user,
            int? accessTokenExpiresAt,
            int? sessionExpiresAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AuthSessionModel():
        return $default(
            _that.accessToken,
            _that.refreshToken,
            _that.refreshTokenId,
            _that.user,
            _that.accessTokenExpiresAt,
            _that.sessionExpiresAt);
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
            String accessToken,
            String refreshToken,
            int refreshTokenId,
            AdminUserModel user,
            int? accessTokenExpiresAt,
            int? sessionExpiresAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AuthSessionModel() when $default != null:
        return $default(
            _that.accessToken,
            _that.refreshToken,
            _that.refreshTokenId,
            _that.user,
            _that.accessTokenExpiresAt,
            _that.sessionExpiresAt);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _AuthSessionModel extends AuthSessionModel {
  const _AuthSessionModel(
      {required this.accessToken,
      required this.refreshToken,
      required this.refreshTokenId,
      required this.user,
      this.accessTokenExpiresAt,
      this.sessionExpiresAt})
      : super._();
  factory _AuthSessionModel.fromJson(Map<String, dynamic> json) =>
      _$AuthSessionModelFromJson(json);

  @override
  final String accessToken;
  @override
  final String refreshToken;
  @override
  final int refreshTokenId;
  @override
  final AdminUserModel user;
  @override
  final int? accessTokenExpiresAt;
  @override
  final int? sessionExpiresAt;

  /// Create a copy of AuthSessionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AuthSessionModelCopyWith<_AuthSessionModel> get copyWith =>
      __$AuthSessionModelCopyWithImpl<_AuthSessionModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AuthSessionModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AuthSessionModel &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.refreshTokenId, refreshTokenId) ||
                other.refreshTokenId == refreshTokenId) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.accessTokenExpiresAt, accessTokenExpiresAt) ||
                other.accessTokenExpiresAt == accessTokenExpiresAt) &&
            (identical(other.sessionExpiresAt, sessionExpiresAt) ||
                other.sessionExpiresAt == sessionExpiresAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, accessToken, refreshToken,
      refreshTokenId, user, accessTokenExpiresAt, sessionExpiresAt);

  @override
  String toString() {
    return 'AuthSessionModel(accessToken: $accessToken, refreshToken: $refreshToken, refreshTokenId: $refreshTokenId, user: $user, accessTokenExpiresAt: $accessTokenExpiresAt, sessionExpiresAt: $sessionExpiresAt)';
  }
}

/// @nodoc
abstract mixin class _$AuthSessionModelCopyWith<$Res>
    implements $AuthSessionModelCopyWith<$Res> {
  factory _$AuthSessionModelCopyWith(
          _AuthSessionModel value, $Res Function(_AuthSessionModel) _then) =
      __$AuthSessionModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String accessToken,
      String refreshToken,
      int refreshTokenId,
      AdminUserModel user,
      int? accessTokenExpiresAt,
      int? sessionExpiresAt});

  @override
  $AdminUserModelCopyWith<$Res> get user;
}

/// @nodoc
class __$AuthSessionModelCopyWithImpl<$Res>
    implements _$AuthSessionModelCopyWith<$Res> {
  __$AuthSessionModelCopyWithImpl(this._self, this._then);

  final _AuthSessionModel _self;
  final $Res Function(_AuthSessionModel) _then;

  /// Create a copy of AuthSessionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = null,
    Object? refreshTokenId = null,
    Object? user = null,
    Object? accessTokenExpiresAt = freezed,
    Object? sessionExpiresAt = freezed,
  }) {
    return _then(_AuthSessionModel(
      accessToken: null == accessToken
          ? _self.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _self.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshTokenId: null == refreshTokenId
          ? _self.refreshTokenId
          : refreshTokenId // ignore: cast_nullable_to_non_nullable
              as int,
      user: null == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as AdminUserModel,
      accessTokenExpiresAt: freezed == accessTokenExpiresAt
          ? _self.accessTokenExpiresAt
          : accessTokenExpiresAt // ignore: cast_nullable_to_non_nullable
              as int?,
      sessionExpiresAt: freezed == sessionExpiresAt
          ? _self.sessionExpiresAt
          : sessionExpiresAt // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }

  /// Create a copy of AuthSessionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AdminUserModelCopyWith<$Res> get user {
    return $AdminUserModelCopyWith<$Res>(_self.user, (value) {
      return _then(_self.copyWith(user: value));
    });
  }
}

// dart format on
