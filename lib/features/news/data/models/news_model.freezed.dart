// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NewsModel {
  int get id;
  @JsonKey(name: 'created_at')
  int get createdAt;
  @JsonKey(fromJson: stringFromJson)
  String get title;
  @JsonKey(fromJson: stringFromJson)
  String get content;
  @JsonKey(name: 'image', fromJson: _readImageUrl)
  String get imageUrl;
  @JsonKey(fromJson: stringFromJson)
  String get author;
  @JsonKey(fromJson: stringFromJson)
  String get ratio;
  @JsonKey(name: 'categories', fromJson: _readCategoryIds)
  List<int> get categoryIds;
  @JsonKey(fromJson: stringFromJson)
  String get date;

  /// Create a copy of NewsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NewsModelCopyWith<NewsModel> get copyWith =>
      _$NewsModelCopyWithImpl<NewsModel>(this as NewsModel, _$identity);

  /// Serializes this NewsModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NewsModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.ratio, ratio) || other.ratio == ratio) &&
            const DeepCollectionEquality()
                .equals(other.categoryIds, categoryIds) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      createdAt,
      title,
      content,
      imageUrl,
      author,
      ratio,
      const DeepCollectionEquality().hash(categoryIds),
      date);

  @override
  String toString() {
    return 'NewsModel(id: $id, createdAt: $createdAt, title: $title, content: $content, imageUrl: $imageUrl, author: $author, ratio: $ratio, categoryIds: $categoryIds, date: $date)';
  }
}

/// @nodoc
abstract mixin class $NewsModelCopyWith<$Res> {
  factory $NewsModelCopyWith(NewsModel value, $Res Function(NewsModel) _then) =
      _$NewsModelCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'created_at') int createdAt,
      @JsonKey(fromJson: stringFromJson) String title,
      @JsonKey(fromJson: stringFromJson) String content,
      @JsonKey(name: 'image', fromJson: _readImageUrl) String imageUrl,
      @JsonKey(fromJson: stringFromJson) String author,
      @JsonKey(fromJson: stringFromJson) String ratio,
      @JsonKey(name: 'categories', fromJson: _readCategoryIds)
      List<int> categoryIds,
      @JsonKey(fromJson: stringFromJson) String date});
}

/// @nodoc
class _$NewsModelCopyWithImpl<$Res> implements $NewsModelCopyWith<$Res> {
  _$NewsModelCopyWithImpl(this._self, this._then);

  final NewsModel _self;
  final $Res Function(NewsModel) _then;

  /// Create a copy of NewsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? title = null,
    Object? content = null,
    Object? imageUrl = null,
    Object? author = null,
    Object? ratio = null,
    Object? categoryIds = null,
    Object? date = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _self.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _self.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      ratio: null == ratio
          ? _self.ratio
          : ratio // ignore: cast_nullable_to_non_nullable
              as String,
      categoryIds: null == categoryIds
          ? _self.categoryIds
          : categoryIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [NewsModel].
extension NewsModelPatterns on NewsModel {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_NewsModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NewsModel() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_NewsModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NewsModel():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_NewsModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NewsModel() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            int id,
            @JsonKey(name: 'created_at') int createdAt,
            @JsonKey(fromJson: stringFromJson) String title,
            @JsonKey(fromJson: stringFromJson) String content,
            @JsonKey(name: 'image', fromJson: _readImageUrl) String imageUrl,
            @JsonKey(fromJson: stringFromJson) String author,
            @JsonKey(fromJson: stringFromJson) String ratio,
            @JsonKey(name: 'categories', fromJson: _readCategoryIds)
            List<int> categoryIds,
            @JsonKey(fromJson: stringFromJson) String date)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NewsModel() when $default != null:
        return $default(
            _that.id,
            _that.createdAt,
            _that.title,
            _that.content,
            _that.imageUrl,
            _that.author,
            _that.ratio,
            _that.categoryIds,
            _that.date);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            int id,
            @JsonKey(name: 'created_at') int createdAt,
            @JsonKey(fromJson: stringFromJson) String title,
            @JsonKey(fromJson: stringFromJson) String content,
            @JsonKey(name: 'image', fromJson: _readImageUrl) String imageUrl,
            @JsonKey(fromJson: stringFromJson) String author,
            @JsonKey(fromJson: stringFromJson) String ratio,
            @JsonKey(name: 'categories', fromJson: _readCategoryIds)
            List<int> categoryIds,
            @JsonKey(fromJson: stringFromJson) String date)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NewsModel():
        return $default(
            _that.id,
            _that.createdAt,
            _that.title,
            _that.content,
            _that.imageUrl,
            _that.author,
            _that.ratio,
            _that.categoryIds,
            _that.date);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            int id,
            @JsonKey(name: 'created_at') int createdAt,
            @JsonKey(fromJson: stringFromJson) String title,
            @JsonKey(fromJson: stringFromJson) String content,
            @JsonKey(name: 'image', fromJson: _readImageUrl) String imageUrl,
            @JsonKey(fromJson: stringFromJson) String author,
            @JsonKey(fromJson: stringFromJson) String ratio,
            @JsonKey(name: 'categories', fromJson: _readCategoryIds)
            List<int> categoryIds,
            @JsonKey(fromJson: stringFromJson) String date)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NewsModel() when $default != null:
        return $default(
            _that.id,
            _that.createdAt,
            _that.title,
            _that.content,
            _that.imageUrl,
            _that.author,
            _that.ratio,
            _that.categoryIds,
            _that.date);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _NewsModel extends NewsModel {
  const _NewsModel(
      {required this.id,
      @JsonKey(name: 'created_at') this.createdAt = 0,
      @JsonKey(fromJson: stringFromJson) this.title = '',
      @JsonKey(fromJson: stringFromJson) this.content = '',
      @JsonKey(name: 'image', fromJson: _readImageUrl) this.imageUrl = '',
      @JsonKey(fromJson: stringFromJson) this.author = '',
      @JsonKey(fromJson: stringFromJson) this.ratio = '',
      @JsonKey(name: 'categories', fromJson: _readCategoryIds)
      final List<int> categoryIds = const <int>[],
      @JsonKey(fromJson: stringFromJson) this.date = ''})
      : _categoryIds = categoryIds,
        super._();
  factory _NewsModel.fromJson(Map<String, dynamic> json) =>
      _$NewsModelFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'created_at')
  final int createdAt;
  @override
  @JsonKey(fromJson: stringFromJson)
  final String title;
  @override
  @JsonKey(fromJson: stringFromJson)
  final String content;
  @override
  @JsonKey(name: 'image', fromJson: _readImageUrl)
  final String imageUrl;
  @override
  @JsonKey(fromJson: stringFromJson)
  final String author;
  @override
  @JsonKey(fromJson: stringFromJson)
  final String ratio;
  final List<int> _categoryIds;
  @override
  @JsonKey(name: 'categories', fromJson: _readCategoryIds)
  List<int> get categoryIds {
    if (_categoryIds is EqualUnmodifiableListView) return _categoryIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categoryIds);
  }

  @override
  @JsonKey(fromJson: stringFromJson)
  final String date;

  /// Create a copy of NewsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NewsModelCopyWith<_NewsModel> get copyWith =>
      __$NewsModelCopyWithImpl<_NewsModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$NewsModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NewsModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.ratio, ratio) || other.ratio == ratio) &&
            const DeepCollectionEquality()
                .equals(other._categoryIds, _categoryIds) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      createdAt,
      title,
      content,
      imageUrl,
      author,
      ratio,
      const DeepCollectionEquality().hash(_categoryIds),
      date);

  @override
  String toString() {
    return 'NewsModel(id: $id, createdAt: $createdAt, title: $title, content: $content, imageUrl: $imageUrl, author: $author, ratio: $ratio, categoryIds: $categoryIds, date: $date)';
  }
}

/// @nodoc
abstract mixin class _$NewsModelCopyWith<$Res>
    implements $NewsModelCopyWith<$Res> {
  factory _$NewsModelCopyWith(
          _NewsModel value, $Res Function(_NewsModel) _then) =
      __$NewsModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'created_at') int createdAt,
      @JsonKey(fromJson: stringFromJson) String title,
      @JsonKey(fromJson: stringFromJson) String content,
      @JsonKey(name: 'image', fromJson: _readImageUrl) String imageUrl,
      @JsonKey(fromJson: stringFromJson) String author,
      @JsonKey(fromJson: stringFromJson) String ratio,
      @JsonKey(name: 'categories', fromJson: _readCategoryIds)
      List<int> categoryIds,
      @JsonKey(fromJson: stringFromJson) String date});
}

/// @nodoc
class __$NewsModelCopyWithImpl<$Res> implements _$NewsModelCopyWith<$Res> {
  __$NewsModelCopyWithImpl(this._self, this._then);

  final _NewsModel _self;
  final $Res Function(_NewsModel) _then;

  /// Create a copy of NewsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? title = null,
    Object? content = null,
    Object? imageUrl = null,
    Object? author = null,
    Object? ratio = null,
    Object? categoryIds = null,
    Object? date = null,
  }) {
    return _then(_NewsModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _self.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _self.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      ratio: null == ratio
          ? _self.ratio
          : ratio // ignore: cast_nullable_to_non_nullable
              as String,
      categoryIds: null == categoryIds
          ? _self._categoryIds
          : categoryIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
