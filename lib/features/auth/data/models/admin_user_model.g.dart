// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminUserModel _$AdminUserModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_AdminUserModel', json, ($checkedConvert) {
      final val = _AdminUserModel(
        id: $checkedConvert('id', (v) => (v as num).toInt()),
        email: $checkedConvert('email', (v) => v as String? ?? ''),
        firstName: $checkedConvert('firstName', (v) => v as String? ?? ''),
        lastName: $checkedConvert('lastName', (v) => v as String? ?? ''),
        phoneNumber: $checkedConvert('phoneNumber', (v) => v as String? ?? ''),
        company: $checkedConvert('company', (v) => v as String? ?? ''),
      );
      return val;
    });

Map<String, dynamic> _$AdminUserModelToJson(_AdminUserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'phoneNumber': instance.phoneNumber,
      'company': instance.company,
    };
