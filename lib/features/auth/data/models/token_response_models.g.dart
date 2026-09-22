// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_response_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LoginResponseModel _$LoginResponseModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_LoginResponseModel', json, ($checkedConvert) {
      final val = _LoginResponseModel(
        user: $checkedConvert(
          'user',
          (v) => LoginUserModel.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$LoginResponseModelToJson(_LoginResponseModel instance) =>
    <String, dynamic>{'user': instance.user.toJson()};

_LoginUserModel _$LoginUserModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_LoginUserModel', json, ($checkedConvert) {
      final val = _LoginUserModel(
        id: $checkedConvert('id', (v) => (v as num).toInt()),
        authToken: $checkedConvert('authToken', (v) => v as String),
        refreshToken: $checkedConvert('refreshToken', (v) => v as String),
        refreshTokenId: $checkedConvert(
          'refreshTokenId',
          (v) => (v as num).toInt(),
        ),
        authTokenExpireAt: $checkedConvert(
          'authTokenExpireAt',
          (v) => (v as num?)?.toInt(),
        ),
        expiresAt: $checkedConvert('expiresAt', (v) => (v as num?)?.toInt()),
        email: $checkedConvert('email', (v) => v as String? ?? ''),
        firstName: $checkedConvert('firstName', (v) => v as String? ?? ''),
        lastName: $checkedConvert('lastName', (v) => v as String? ?? ''),
        phoneNumber: $checkedConvert(
          'phoneNumber',
          (v) => v == null ? '' : stringFromJson(v),
        ),
        company: $checkedConvert(
          'company',
          (v) => v == null ? '' : stringFromJson(v),
        ),
      );
      return val;
    });

Map<String, dynamic> _$LoginUserModelToJson(_LoginUserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'authToken': instance.authToken,
      'refreshToken': instance.refreshToken,
      'refreshTokenId': instance.refreshTokenId,
      'authTokenExpireAt': instance.authTokenExpireAt,
      'expiresAt': instance.expiresAt,
      'email': instance.email,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'phoneNumber': instance.phoneNumber,
      'company': instance.company,
    };

_RefreshResponseModel _$RefreshResponseModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_RefreshResponseModel', json, ($checkedConvert) {
  final val = _RefreshResponseModel(
    userId: $checkedConvert('userId', (v) => (v as num).toInt()),
    authToken: $checkedConvert('authToken', (v) => v as String),
    refreshToken: $checkedConvert('refreshToken', (v) => v as String),
    refreshTokenId: $checkedConvert(
      'refreshTokenId',
      (v) => (v as num).toInt(),
    ),
    authTokenExpireAt: $checkedConvert(
      'authTokenExpireAt',
      (v) => (v as num?)?.toInt(),
    ),
    expiresAt: $checkedConvert('expiresAt', (v) => (v as num?)?.toInt()),
    email: $checkedConvert('email', (v) => v as String?),
    firstName: $checkedConvert('firstName', (v) => v as String?),
    lastName: $checkedConvert('lastName', (v) => v as String?),
    phoneNumber: $checkedConvert('phoneNumber', (v) => _optionalString(v)),
    company: $checkedConvert('company', (v) => _optionalString(v)),
  );
  return val;
});

Map<String, dynamic> _$RefreshResponseModelToJson(
  _RefreshResponseModel instance,
) => <String, dynamic>{
  'userId': instance.userId,
  'authToken': instance.authToken,
  'refreshToken': instance.refreshToken,
  'refreshTokenId': instance.refreshTokenId,
  'authTokenExpireAt': instance.authTokenExpireAt,
  'expiresAt': instance.expiresAt,
  'email': instance.email,
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'phoneNumber': instance.phoneNumber,
  'company': instance.company,
};
