// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NewsStruct extends BaseStruct {
  NewsStruct({
    int? id,
    int? createdAt,
    String? date,
    String? title,
    String? content,
    String? image,
    String? author,
    String? ratio,
    List<int>? categories,
  })  : _id = id,
        _createdAt = createdAt,
        _date = date,
        _title = title,
        _content = content,
        _image = image,
        _author = author,
        _ratio = ratio,
        _categories = categories;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "created_at" field.
  int? _createdAt;
  int get createdAt => _createdAt ?? 0;
  set createdAt(int? val) => _createdAt = val;

  void incrementCreatedAt(int amount) => createdAt = createdAt + amount;

  bool hasCreatedAt() => _createdAt != null;

  // "date" field.
  String? _date;
  String get date => _date ?? '';
  set date(String? val) => _date = val;

  bool hasDate() => _date != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  set content(String? val) => _content = val;

  bool hasContent() => _content != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;

  bool hasImage() => _image != null;

  // "author" field.
  String? _author;
  String get author => _author ?? '';
  set author(String? val) => _author = val;

  bool hasAuthor() => _author != null;

  // "ratio" field.
  String? _ratio;
  String get ratio => _ratio ?? '';
  set ratio(String? val) => _ratio = val;

  bool hasRatio() => _ratio != null;

  // "categories" field.
  List<int>? _categories;
  List<int> get categories => _categories ?? const [];
  set categories(List<int>? val) => _categories = val;

  void updateCategories(Function(List<int>) updateFn) {
    updateFn(_categories ??= []);
  }

  bool hasCategories() => _categories != null;

  static NewsStruct fromMap(Map<String, dynamic> data) => NewsStruct(
        id: castToType<int>(data['id']),
        createdAt: castToType<int>(data['created_at']),
        date: data['date'] as String?,
        title: data['title'] as String?,
        content: data['content'] as String?,
        image: data['image'] as String?,
        author: data['author'] as String?,
        ratio: data['ratio'] as String?,
        categories: getDataList(data['categories']),
      );

  static NewsStruct? maybeFromMap(dynamic data) =>
      data is Map ? NewsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'created_at': _createdAt,
        'date': _date,
        'title': _title,
        'content': _content,
        'image': _image,
        'author': _author,
        'ratio': _ratio,
        'categories': _categories,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'created_at': serializeParam(
          _createdAt,
          ParamType.int,
        ),
        'date': serializeParam(
          _date,
          ParamType.String,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'content': serializeParam(
          _content,
          ParamType.String,
        ),
        'image': serializeParam(
          _image,
          ParamType.String,
        ),
        'author': serializeParam(
          _author,
          ParamType.String,
        ),
        'ratio': serializeParam(
          _ratio,
          ParamType.String,
        ),
        'categories': serializeParam(
          _categories,
          ParamType.int,
          isList: true,
        ),
      }.withoutNulls;

  static NewsStruct fromSerializableMap(Map<String, dynamic> data) =>
      NewsStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        createdAt: deserializeParam(
          data['created_at'],
          ParamType.int,
          false,
        ),
        date: deserializeParam(
          data['date'],
          ParamType.String,
          false,
        ),
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        content: deserializeParam(
          data['content'],
          ParamType.String,
          false,
        ),
        image: deserializeParam(
          data['image'],
          ParamType.String,
          false,
        ),
        author: deserializeParam(
          data['author'],
          ParamType.String,
          false,
        ),
        ratio: deserializeParam(
          data['ratio'],
          ParamType.String,
          false,
        ),
        categories: deserializeParam<int>(
          data['categories'],
          ParamType.int,
          true,
        ),
      );

  @override
  String toString() => 'NewsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is NewsStruct &&
        id == other.id &&
        createdAt == other.createdAt &&
        date == other.date &&
        title == other.title &&
        content == other.content &&
        image == other.image &&
        author == other.author &&
        ratio == other.ratio &&
        listEquality.equals(categories, other.categories);
  }

  @override
  int get hashCode => const ListEquality().hash(
      [id, createdAt, date, title, content, image, author, ratio, categories]);
}

NewsStruct createNewsStruct({
  int? id,
  int? createdAt,
  String? date,
  String? title,
  String? content,
  String? image,
  String? author,
  String? ratio,
}) =>
    NewsStruct(
      id: id,
      createdAt: createdAt,
      date: date,
      title: title,
      content: content,
      image: image,
      author: author,
      ratio: ratio,
    );
