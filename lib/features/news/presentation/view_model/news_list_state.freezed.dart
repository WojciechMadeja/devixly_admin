// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NewsListState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is NewsListState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'NewsListState()';
  }
}

/// @nodoc
class $NewsListStateCopyWith<$Res> {
  $NewsListStateCopyWith(NewsListState _, $Res Function(NewsListState) __);
}

/// Adds pattern-matching-related methods to [NewsListState].
extension NewsListStatePatterns on NewsListState {
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
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NewsListLoading value)? loading,
    TResult Function(NewsListLoaded value)? loaded,
    TResult Function(NewsListError value)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case NewsListLoading() when loading != null:
        return loading(_that);
      case NewsListLoaded() when loaded != null:
        return loaded(_that);
      case NewsListError() when error != null:
        return error(_that);
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
  TResult map<TResult extends Object?>({
    required TResult Function(NewsListLoading value) loading,
    required TResult Function(NewsListLoaded value) loaded,
    required TResult Function(NewsListError value) error,
  }) {
    final _that = this;
    switch (_that) {
      case NewsListLoading():
        return loading(_that);
      case NewsListLoaded():
        return loaded(_that);
      case NewsListError():
        return error(_that);
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NewsListLoading value)? loading,
    TResult? Function(NewsListLoaded value)? loaded,
    TResult? Function(NewsListError value)? error,
  }) {
    final _that = this;
    switch (_that) {
      case NewsListLoading() when loading != null:
        return loading(_that);
      case NewsListLoaded() when loaded != null:
        return loaded(_that);
      case NewsListError() when error != null:
        return error(_that);
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
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<News> news, List<Category> categories)? loaded,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case NewsListLoading() when loading != null:
        return loading();
      case NewsListLoaded() when loaded != null:
        return loaded(_that.news, _that.categories);
      case NewsListError() when error != null:
        return error(_that.failure);
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
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<News> news, List<Category> categories)
        loaded,
    required TResult Function(Failure failure) error,
  }) {
    final _that = this;
    switch (_that) {
      case NewsListLoading():
        return loading();
      case NewsListLoaded():
        return loaded(_that.news, _that.categories);
      case NewsListError():
        return error(_that.failure);
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
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<News> news, List<Category> categories)? loaded,
    TResult? Function(Failure failure)? error,
  }) {
    final _that = this;
    switch (_that) {
      case NewsListLoading() when loading != null:
        return loading();
      case NewsListLoaded() when loaded != null:
        return loaded(_that.news, _that.categories);
      case NewsListError() when error != null:
        return error(_that.failure);
      case _:
        return null;
    }
  }
}

/// @nodoc

class NewsListLoading implements NewsListState {
  const NewsListLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is NewsListLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'NewsListState.loading()';
  }
}

/// @nodoc

class NewsListLoaded implements NewsListState {
  const NewsListLoaded(
      {required final List<News> news,
      required final List<Category> categories})
      : _news = news,
        _categories = categories;

  final List<News> _news;
  List<News> get news {
    if (_news is EqualUnmodifiableListView) return _news;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_news);
  }

  final List<Category> _categories;
  List<Category> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  /// Create a copy of NewsListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NewsListLoadedCopyWith<NewsListLoaded> get copyWith =>
      _$NewsListLoadedCopyWithImpl<NewsListLoaded>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NewsListLoaded &&
            const DeepCollectionEquality().equals(other._news, _news) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_news),
      const DeepCollectionEquality().hash(_categories));

  @override
  String toString() {
    return 'NewsListState.loaded(news: $news, categories: $categories)';
  }
}

/// @nodoc
abstract mixin class $NewsListLoadedCopyWith<$Res>
    implements $NewsListStateCopyWith<$Res> {
  factory $NewsListLoadedCopyWith(
          NewsListLoaded value, $Res Function(NewsListLoaded) _then) =
      _$NewsListLoadedCopyWithImpl;
  @useResult
  $Res call({List<News> news, List<Category> categories});
}

/// @nodoc
class _$NewsListLoadedCopyWithImpl<$Res>
    implements $NewsListLoadedCopyWith<$Res> {
  _$NewsListLoadedCopyWithImpl(this._self, this._then);

  final NewsListLoaded _self;
  final $Res Function(NewsListLoaded) _then;

  /// Create a copy of NewsListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? news = null,
    Object? categories = null,
  }) {
    return _then(NewsListLoaded(
      news: null == news
          ? _self._news
          : news // ignore: cast_nullable_to_non_nullable
              as List<News>,
      categories: null == categories
          ? _self._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Category>,
    ));
  }
}

/// @nodoc

class NewsListError implements NewsListState {
  const NewsListError(this.failure);

  final Failure failure;

  /// Create a copy of NewsListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NewsListErrorCopyWith<NewsListError> get copyWith =>
      _$NewsListErrorCopyWithImpl<NewsListError>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NewsListError &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failure);

  @override
  String toString() {
    return 'NewsListState.error(failure: $failure)';
  }
}

/// @nodoc
abstract mixin class $NewsListErrorCopyWith<$Res>
    implements $NewsListStateCopyWith<$Res> {
  factory $NewsListErrorCopyWith(
          NewsListError value, $Res Function(NewsListError) _then) =
      _$NewsListErrorCopyWithImpl;
  @useResult
  $Res call({Failure failure});
}

/// @nodoc
class _$NewsListErrorCopyWithImpl<$Res>
    implements $NewsListErrorCopyWith<$Res> {
  _$NewsListErrorCopyWithImpl(this._self, this._then);

  final NewsListError _self;
  final $Res Function(NewsListError) _then;

  /// Create a copy of NewsListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? failure = null,
  }) {
    return _then(NewsListError(
      null == failure
          ? _self.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
    ));
  }
}

// dart format on
