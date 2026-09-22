// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NewsModel _$NewsModelFromJson(Map<String, dynamic> json) => $checkedCreate(
  '_NewsModel',
  json,
  ($checkedConvert) {
    final val = _NewsModel(
      id: $checkedConvert('id', (v) => (v as num).toInt()),
      createdAt: $checkedConvert(
        'created_at',
        (v) => (v as num?)?.toInt() ?? 0,
      ),
      title: $checkedConvert(
        'title',
        (v) => v == null ? '' : stringFromJson(v),
      ),
      content: $checkedConvert(
        'content',
        (v) => v == null ? '' : stringFromJson(v),
      ),
      imageUrl: $checkedConvert(
        'image',
        (v) => v == null ? '' : _readImageUrl(v),
      ),
      author: $checkedConvert(
        'author',
        (v) => v == null ? '' : stringFromJson(v),
      ),
      ratio: $checkedConvert(
        'ratio',
        (v) => v == null ? '' : stringFromJson(v),
      ),
      categoryIds: $checkedConvert(
        'categories',
        (v) => v == null ? const <int>[] : _readCategoryIds(v),
      ),
      date: $checkedConvert('date', (v) => v == null ? '' : stringFromJson(v)),
    );
    return val;
  },
  fieldKeyMap: const {
    'createdAt': 'created_at',
    'imageUrl': 'image',
    'categoryIds': 'categories',
  },
);

Map<String, dynamic> _$NewsModelToJson(_NewsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt,
      'title': instance.title,
      'content': instance.content,
      'image': instance.imageUrl,
      'author': instance.author,
      'ratio': instance.ratio,
      'categories': instance.categoryIds,
      'date': instance.date,
    };
