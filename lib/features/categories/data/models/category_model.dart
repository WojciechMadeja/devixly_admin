import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/category.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

@freezed
abstract class CategoryModel with _$CategoryModel {
  const CategoryModel._();

  const factory CategoryModel({
    required int id,
    @Default('') String name,
    @JsonKey(name: 'number_of_news') @Default(0) int newsCount,
  }) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  Category toEntity() => Category(id: id, name: name, newsCount: newsCount);
}
