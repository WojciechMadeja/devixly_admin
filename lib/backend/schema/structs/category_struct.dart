// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CategoryStruct extends BaseStruct {
  CategoryStruct({
    int? id,
    String? name,
    int? numberOfNews,
  })  : _id = id,
        _name = name,
        _numberOfNews = numberOfNews;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "numberOfNews" field.
  int? _numberOfNews;
  int get numberOfNews => _numberOfNews ?? 0;
  set numberOfNews(int? val) => _numberOfNews = val;

  void incrementNumberOfNews(int amount) =>
      numberOfNews = numberOfNews + amount;

  bool hasNumberOfNews() => _numberOfNews != null;

  static CategoryStruct fromMap(Map<String, dynamic> data) => CategoryStruct(
        id: castToType<int>(data['id']),
        name: data['name'] as String?,
        numberOfNews: castToType<int>(data['numberOfNews']),
      );

  static CategoryStruct? maybeFromMap(dynamic data) =>
      data is Map ? CategoryStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'numberOfNews': _numberOfNews,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'numberOfNews': serializeParam(
          _numberOfNews,
          ParamType.int,
        ),
      }.withoutNulls;

  static CategoryStruct fromSerializableMap(Map<String, dynamic> data) =>
      CategoryStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        numberOfNews: deserializeParam(
          data['numberOfNews'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'CategoryStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CategoryStruct &&
        id == other.id &&
        name == other.name &&
        numberOfNews == other.numberOfNews;
  }

  @override
  int get hashCode => const ListEquality().hash([id, name, numberOfNews]);
}

CategoryStruct createCategoryStruct({
  int? id,
  String? name,
  int? numberOfNews,
}) =>
    CategoryStruct(
      id: id,
      name: name,
      numberOfNews: numberOfNews,
    );
