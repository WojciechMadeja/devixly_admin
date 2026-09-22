import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/utils/json_readers.dart';
import '../../domain/entities/news.dart';
import '../../domain/entities/news_ratio.dart';

part 'news_model.freezed.dart';
part 'news_model.g.dart';

@freezed
abstract class NewsModel with _$NewsModel {
  const NewsModel._();

  const factory NewsModel({
    required int id,
    @JsonKey(name: 'created_at') @Default(0) int createdAt,
    @JsonKey(fromJson: stringFromJson) @Default('') String title,
    @JsonKey(fromJson: stringFromJson) @Default('') String content,
    @JsonKey(name: 'image', fromJson: _readImageUrl)
    @Default('')
    String imageUrl,
    @JsonKey(fromJson: stringFromJson) @Default('') String author,
    @JsonKey(fromJson: stringFromJson) @Default('') String ratio,
    @JsonKey(name: 'categories', fromJson: _readCategoryIds)
    @Default(<int>[])
    List<int> categoryIds,
    @JsonKey(fromJson: stringFromJson) @Default('') String date,
  }) = _NewsModel;

  factory NewsModel.fromJson(Map<String, dynamic> json) =>
      _$NewsModelFromJson(json);

  News toEntity() => News(
    id: id,
    createdAt: createdAt,
    title: title,
    content: content,
    imageUrl: imageUrl,
    author: author,
    ratio: NewsRatio.fromApi(ratio),
    categoryIds: categoryIds,
    date: date,
  );
}

/// Obrazek przychodzi jako obiekt pliku Xano (`{url, ...}`).
String _readImageUrl(Object? value) =>
    value is Map ? (value['url'] ?? '').toString() : '';

/// Kategorie przychodzą jako lista id albo lista obiektów `{id, name}`.
List<int> _readCategoryIds(Object? value) => [
  if (value is List)
    for (final item in value)
      if (item is num)
        item.toInt()
      else if (item is Map && item['id'] is num)
        (item['id'] as num).toInt(),
];
