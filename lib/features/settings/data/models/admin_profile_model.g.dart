// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminProfileModel _$AdminProfileModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_AdminProfileModel',
      json,
      ($checkedConvert) {
        final val = _AdminProfileModel(
          id: $checkedConvert('id', (v) => (v as num).toInt()),
          email: $checkedConvert(
              'email', (v) => v == null ? '' : stringFromJson(v)),
          firstName: $checkedConvert(
              'first_name', (v) => v == null ? '' : stringFromJson(v)),
          lastName: $checkedConvert(
              'last_name', (v) => v == null ? '' : stringFromJson(v)),
          phoneNumber: $checkedConvert(
              'phone_number', (v) => v == null ? '' : stringFromJson(v)),
          company: $checkedConvert(
              'company',
              (v) => v == null
                  ? null
                  : ProfileCompanyModel.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
      fieldKeyMap: const {
        'firstName': 'first_name',
        'lastName': 'last_name',
        'phoneNumber': 'phone_number'
      },
    );

Map<String, dynamic> _$AdminProfileModelToJson(_AdminProfileModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'phone_number': instance.phoneNumber,
      'company': instance.company?.toJson(),
    };

_ProfileCompanyModel _$ProfileCompanyModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_ProfileCompanyModel',
      json,
      ($checkedConvert) {
        final val = _ProfileCompanyModel(
          id: $checkedConvert('id', (v) => (v as num).toInt()),
          name: $checkedConvert(
              'name', (v) => v == null ? '' : stringFromJson(v)),
        );
        return val;
      },
    );

Map<String, dynamic> _$ProfileCompanyModelToJson(
        _ProfileCompanyModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
