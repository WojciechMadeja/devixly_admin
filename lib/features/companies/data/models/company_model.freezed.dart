// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'company_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CompanyModel {
  int get id;
  String get name;
  @JsonKey(fromJson: stringFromJson)
  String get email;
  @JsonKey(fromJson: stringFromJson)
  String get address;
  @JsonKey(name: 'post_code', fromJson: stringFromJson)
  String get postCode;
  @JsonKey(fromJson: stringFromJson)
  String get city;
  @JsonKey(name: 'phone_number', fromJson: stringFromJson)
  String get phoneNumber;
  @JsonKey(name: 'company_representative', fromJson: stringFromJson)
  String get representative;
  @JsonKey(name: 'number_of_agents')
  int get agentsCount;
  @JsonKey(name: 'is_blocked')
  bool get isBlocked;

  /// Create a copy of CompanyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CompanyModelCopyWith<CompanyModel> get copyWith =>
      _$CompanyModelCopyWithImpl<CompanyModel>(
          this as CompanyModel, _$identity);

  /// Serializes this CompanyModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CompanyModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.postCode, postCode) ||
                other.postCode == postCode) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.representative, representative) ||
                other.representative == representative) &&
            (identical(other.agentsCount, agentsCount) ||
                other.agentsCount == agentsCount) &&
            (identical(other.isBlocked, isBlocked) ||
                other.isBlocked == isBlocked));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, email, address,
      postCode, city, phoneNumber, representative, agentsCount, isBlocked);

  @override
  String toString() {
    return 'CompanyModel(id: $id, name: $name, email: $email, address: $address, postCode: $postCode, city: $city, phoneNumber: $phoneNumber, representative: $representative, agentsCount: $agentsCount, isBlocked: $isBlocked)';
  }
}

/// @nodoc
abstract mixin class $CompanyModelCopyWith<$Res> {
  factory $CompanyModelCopyWith(
          CompanyModel value, $Res Function(CompanyModel) _then) =
      _$CompanyModelCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      String name,
      @JsonKey(fromJson: stringFromJson) String email,
      @JsonKey(fromJson: stringFromJson) String address,
      @JsonKey(name: 'post_code', fromJson: stringFromJson) String postCode,
      @JsonKey(fromJson: stringFromJson) String city,
      @JsonKey(name: 'phone_number', fromJson: stringFromJson)
      String phoneNumber,
      @JsonKey(name: 'company_representative', fromJson: stringFromJson)
      String representative,
      @JsonKey(name: 'number_of_agents') int agentsCount,
      @JsonKey(name: 'is_blocked') bool isBlocked});
}

/// @nodoc
class _$CompanyModelCopyWithImpl<$Res> implements $CompanyModelCopyWith<$Res> {
  _$CompanyModelCopyWithImpl(this._self, this._then);

  final CompanyModel _self;
  final $Res Function(CompanyModel) _then;

  /// Create a copy of CompanyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? address = null,
    Object? postCode = null,
    Object? city = null,
    Object? phoneNumber = null,
    Object? representative = null,
    Object? agentsCount = null,
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
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      postCode: null == postCode
          ? _self.postCode
          : postCode // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _self.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _self.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      representative: null == representative
          ? _self.representative
          : representative // ignore: cast_nullable_to_non_nullable
              as String,
      agentsCount: null == agentsCount
          ? _self.agentsCount
          : agentsCount // ignore: cast_nullable_to_non_nullable
              as int,
      isBlocked: null == isBlocked
          ? _self.isBlocked
          : isBlocked // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [CompanyModel].
extension CompanyModelPatterns on CompanyModel {
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
    TResult Function(_CompanyModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CompanyModel() when $default != null:
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
    TResult Function(_CompanyModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CompanyModel():
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
    TResult? Function(_CompanyModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CompanyModel() when $default != null:
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
            String name,
            @JsonKey(fromJson: stringFromJson) String email,
            @JsonKey(fromJson: stringFromJson) String address,
            @JsonKey(name: 'post_code', fromJson: stringFromJson)
            String postCode,
            @JsonKey(fromJson: stringFromJson) String city,
            @JsonKey(name: 'phone_number', fromJson: stringFromJson)
            String phoneNumber,
            @JsonKey(name: 'company_representative', fromJson: stringFromJson)
            String representative,
            @JsonKey(name: 'number_of_agents') int agentsCount,
            @JsonKey(name: 'is_blocked') bool isBlocked)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CompanyModel() when $default != null:
        return $default(
            _that.id,
            _that.name,
            _that.email,
            _that.address,
            _that.postCode,
            _that.city,
            _that.phoneNumber,
            _that.representative,
            _that.agentsCount,
            _that.isBlocked);
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
            String name,
            @JsonKey(fromJson: stringFromJson) String email,
            @JsonKey(fromJson: stringFromJson) String address,
            @JsonKey(name: 'post_code', fromJson: stringFromJson)
            String postCode,
            @JsonKey(fromJson: stringFromJson) String city,
            @JsonKey(name: 'phone_number', fromJson: stringFromJson)
            String phoneNumber,
            @JsonKey(name: 'company_representative', fromJson: stringFromJson)
            String representative,
            @JsonKey(name: 'number_of_agents') int agentsCount,
            @JsonKey(name: 'is_blocked') bool isBlocked)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CompanyModel():
        return $default(
            _that.id,
            _that.name,
            _that.email,
            _that.address,
            _that.postCode,
            _that.city,
            _that.phoneNumber,
            _that.representative,
            _that.agentsCount,
            _that.isBlocked);
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
            String name,
            @JsonKey(fromJson: stringFromJson) String email,
            @JsonKey(fromJson: stringFromJson) String address,
            @JsonKey(name: 'post_code', fromJson: stringFromJson)
            String postCode,
            @JsonKey(fromJson: stringFromJson) String city,
            @JsonKey(name: 'phone_number', fromJson: stringFromJson)
            String phoneNumber,
            @JsonKey(name: 'company_representative', fromJson: stringFromJson)
            String representative,
            @JsonKey(name: 'number_of_agents') int agentsCount,
            @JsonKey(name: 'is_blocked') bool isBlocked)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CompanyModel() when $default != null:
        return $default(
            _that.id,
            _that.name,
            _that.email,
            _that.address,
            _that.postCode,
            _that.city,
            _that.phoneNumber,
            _that.representative,
            _that.agentsCount,
            _that.isBlocked);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CompanyModel extends CompanyModel {
  const _CompanyModel(
      {required this.id,
      this.name = '',
      @JsonKey(fromJson: stringFromJson) this.email = '',
      @JsonKey(fromJson: stringFromJson) this.address = '',
      @JsonKey(name: 'post_code', fromJson: stringFromJson) this.postCode = '',
      @JsonKey(fromJson: stringFromJson) this.city = '',
      @JsonKey(name: 'phone_number', fromJson: stringFromJson)
      this.phoneNumber = '',
      @JsonKey(name: 'company_representative', fromJson: stringFromJson)
      this.representative = '',
      @JsonKey(name: 'number_of_agents') this.agentsCount = 0,
      @JsonKey(name: 'is_blocked') this.isBlocked = false})
      : super._();
  factory _CompanyModel.fromJson(Map<String, dynamic> json) =>
      _$CompanyModelFromJson(json);

  @override
  final int id;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey(fromJson: stringFromJson)
  final String email;
  @override
  @JsonKey(fromJson: stringFromJson)
  final String address;
  @override
  @JsonKey(name: 'post_code', fromJson: stringFromJson)
  final String postCode;
  @override
  @JsonKey(fromJson: stringFromJson)
  final String city;
  @override
  @JsonKey(name: 'phone_number', fromJson: stringFromJson)
  final String phoneNumber;
  @override
  @JsonKey(name: 'company_representative', fromJson: stringFromJson)
  final String representative;
  @override
  @JsonKey(name: 'number_of_agents')
  final int agentsCount;
  @override
  @JsonKey(name: 'is_blocked')
  final bool isBlocked;

  /// Create a copy of CompanyModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CompanyModelCopyWith<_CompanyModel> get copyWith =>
      __$CompanyModelCopyWithImpl<_CompanyModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CompanyModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CompanyModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.postCode, postCode) ||
                other.postCode == postCode) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.representative, representative) ||
                other.representative == representative) &&
            (identical(other.agentsCount, agentsCount) ||
                other.agentsCount == agentsCount) &&
            (identical(other.isBlocked, isBlocked) ||
                other.isBlocked == isBlocked));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, email, address,
      postCode, city, phoneNumber, representative, agentsCount, isBlocked);

  @override
  String toString() {
    return 'CompanyModel(id: $id, name: $name, email: $email, address: $address, postCode: $postCode, city: $city, phoneNumber: $phoneNumber, representative: $representative, agentsCount: $agentsCount, isBlocked: $isBlocked)';
  }
}

/// @nodoc
abstract mixin class _$CompanyModelCopyWith<$Res>
    implements $CompanyModelCopyWith<$Res> {
  factory _$CompanyModelCopyWith(
          _CompanyModel value, $Res Function(_CompanyModel) _then) =
      __$CompanyModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      @JsonKey(fromJson: stringFromJson) String email,
      @JsonKey(fromJson: stringFromJson) String address,
      @JsonKey(name: 'post_code', fromJson: stringFromJson) String postCode,
      @JsonKey(fromJson: stringFromJson) String city,
      @JsonKey(name: 'phone_number', fromJson: stringFromJson)
      String phoneNumber,
      @JsonKey(name: 'company_representative', fromJson: stringFromJson)
      String representative,
      @JsonKey(name: 'number_of_agents') int agentsCount,
      @JsonKey(name: 'is_blocked') bool isBlocked});
}

/// @nodoc
class __$CompanyModelCopyWithImpl<$Res>
    implements _$CompanyModelCopyWith<$Res> {
  __$CompanyModelCopyWithImpl(this._self, this._then);

  final _CompanyModel _self;
  final $Res Function(_CompanyModel) _then;

  /// Create a copy of CompanyModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? address = null,
    Object? postCode = null,
    Object? city = null,
    Object? phoneNumber = null,
    Object? representative = null,
    Object? agentsCount = null,
    Object? isBlocked = null,
  }) {
    return _then(_CompanyModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      postCode: null == postCode
          ? _self.postCode
          : postCode // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _self.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _self.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      representative: null == representative
          ? _self.representative
          : representative // ignore: cast_nullable_to_non_nullable
              as String,
      agentsCount: null == agentsCount
          ? _self.agentsCount
          : agentsCount // ignore: cast_nullable_to_non_nullable
              as int,
      isBlocked: null == isBlocked
          ? _self.isBlocked
          : isBlocked // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
