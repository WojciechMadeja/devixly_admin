// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'managed_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ManagedUserModel _$ManagedUserModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_ManagedUserModel',
      json,
      ($checkedConvert) {
        final val = _ManagedUserModel(
          id: $checkedConvert('id', (v) => (v as num).toInt()),
          firstName: $checkedConvert(
            'first_name',
            (v) => v == null ? '' : stringFromJson(v),
          ),
          lastName: $checkedConvert(
            'last_name',
            (v) => v == null ? '' : stringFromJson(v),
          ),
          email: $checkedConvert(
            'email',
            (v) => v == null ? '' : stringFromJson(v),
          ),
          phoneNumber: $checkedConvert(
            'phone_number',
            (v) => v == null ? '' : stringFromJson(v),
          ),
          isAdministrator: $checkedConvert(
            'is_administrator',
            (v) => v as bool? ?? false,
          ),
          isBlocked: $checkedConvert('is_blocked', (v) => v as bool? ?? false),
          company: $checkedConvert(
            'company',
            (v) => v == null
                ? null
                : UserCompanyModel.fromJson(v as Map<String, dynamic>),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'firstName': 'first_name',
        'lastName': 'last_name',
        'phoneNumber': 'phone_number',
        'isAdministrator': 'is_administrator',
        'isBlocked': 'is_blocked',
      },
    );

Map<String, dynamic> _$ManagedUserModelToJson(_ManagedUserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'email': instance.email,
      'phone_number': instance.phoneNumber,
      'is_administrator': instance.isAdministrator,
      'is_blocked': instance.isBlocked,
      'company': instance.company?.toJson(),
    };

_UserCompanyModel _$UserCompanyModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_UserCompanyModel', json, ($checkedConvert) {
      final val = _UserCompanyModel(
        id: $checkedConvert('id', (v) => (v as num).toInt()),
        name: $checkedConvert(
          'name',
          (v) => v == null ? '' : stringFromJson(v),
        ),
        isBlocked: $checkedConvert('is_blocked', (v) => v as bool? ?? false),
      );
      return val;
    }, fieldKeyMap: const {'isBlocked': 'is_blocked'});

Map<String, dynamic> _$UserCompanyModelToJson(_UserCompanyModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'is_blocked': instance.isBlocked,
    };
