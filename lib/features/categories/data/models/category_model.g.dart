// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_CategoryModel',
      json,
      ($checkedConvert) {
        final val = _CategoryModel(
          id: $checkedConvert('id', (v) => (v as num).toInt()),
          name: $checkedConvert('name', (v) => v as String? ?? ''),
          newsCount: $checkedConvert(
              'number_of_news', (v) => (v as num?)?.toInt() ?? 0),
        );
        return val;
      },
      fieldKeyMap: const {'newsCount': 'number_of_news'},
    );

Map<String, dynamic> _$CategoryModelToJson(_CategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'number_of_news': instance.newsCount,
    };
