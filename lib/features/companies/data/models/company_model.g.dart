// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CompanyModel _$CompanyModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_CompanyModel',
      json,
      ($checkedConvert) {
        final val = _CompanyModel(
          id: $checkedConvert('id', (v) => (v as num).toInt()),
          name: $checkedConvert('name', (v) => v as String? ?? ''),
          email: $checkedConvert(
              'email', (v) => v == null ? '' : stringFromJson(v)),
          address: $checkedConvert(
              'address', (v) => v == null ? '' : stringFromJson(v)),
          postCode: $checkedConvert(
              'post_code', (v) => v == null ? '' : stringFromJson(v)),
          city: $checkedConvert(
              'city', (v) => v == null ? '' : stringFromJson(v)),
          phoneNumber: $checkedConvert(
              'phone_number', (v) => v == null ? '' : stringFromJson(v)),
          representative: $checkedConvert('company_representative',
              (v) => v == null ? '' : stringFromJson(v)),
          agentsCount: $checkedConvert(
              'number_of_agents', (v) => (v as num?)?.toInt() ?? 0),
          isBlocked: $checkedConvert('is_blocked', (v) => v as bool? ?? false),
        );
        return val;
      },
      fieldKeyMap: const {
        'postCode': 'post_code',
        'phoneNumber': 'phone_number',
        'representative': 'company_representative',
        'agentsCount': 'number_of_agents',
        'isBlocked': 'is_blocked'
      },
    );

Map<String, dynamic> _$CompanyModelToJson(_CompanyModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'address': instance.address,
      'post_code': instance.postCode,
      'city': instance.city,
      'phone_number': instance.phoneNumber,
      'company_representative': instance.representative,
      'number_of_agents': instance.agentsCount,
      'is_blocked': instance.isBlocked,
    };
