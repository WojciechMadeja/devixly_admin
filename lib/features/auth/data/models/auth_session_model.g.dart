// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_session_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthSessionModel _$AuthSessionModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_AuthSessionModel',
      json,
      ($checkedConvert) {
        final val = _AuthSessionModel(
          accessToken: $checkedConvert('accessToken', (v) => v as String),
          refreshToken: $checkedConvert('refreshToken', (v) => v as String),
          refreshTokenId:
              $checkedConvert('refreshTokenId', (v) => (v as num).toInt()),
          user: $checkedConvert('user',
              (v) => AdminUserModel.fromJson(v as Map<String, dynamic>)),
          accessTokenExpiresAt: $checkedConvert(
              'accessTokenExpiresAt', (v) => (v as num?)?.toInt()),
          sessionExpiresAt:
              $checkedConvert('sessionExpiresAt', (v) => (v as num?)?.toInt()),
        );
        return val;
      },
    );

Map<String, dynamic> _$AuthSessionModelToJson(_AuthSessionModel instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'refreshTokenId': instance.refreshTokenId,
      'user': instance.user.toJson(),
      'accessTokenExpiresAt': instance.accessTokenExpiresAt,
      'sessionExpiresAt': instance.sessionExpiresAt,
    };
