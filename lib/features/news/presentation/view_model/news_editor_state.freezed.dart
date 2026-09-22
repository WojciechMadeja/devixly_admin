// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_editor_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NewsEditorMode {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is NewsEditorMode);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'NewsEditorMode()';
  }
}

/// @nodoc
class $NewsEditorModeCopyWith<$Res> {
  $NewsEditorModeCopyWith(NewsEditorMode _, $Res Function(NewsEditorMode) __);
}

/// Adds pattern-matching-related methods to [NewsEditorMode].
extension NewsEditorModePatterns on NewsEditorMode {
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
    TResult Function(AddingNews value)? adding,
    TResult Function(LoadingNews value)? loading,
    TResult Function(EditingNews value)? editing,
    TResult Function(NewsNotFound value)? notFound,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case AddingNews() when adding != null:
        return adding(_that);
      case LoadingNews() when loading != null:
        return loading(_that);
      case EditingNews() when editing != null:
        return editing(_that);
      case NewsNotFound() when notFound != null:
        return notFound(_that);
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
    required TResult Function(AddingNews value) adding,
    required TResult Function(LoadingNews value) loading,
    required TResult Function(EditingNews value) editing,
    required TResult Function(NewsNotFound value) notFound,
  }) {
    final _that = this;
    switch (_that) {
      case AddingNews():
        return adding(_that);
      case LoadingNews():
        return loading(_that);
      case EditingNews():
        return editing(_that);
      case NewsNotFound():
        return notFound(_that);
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
    TResult? Function(AddingNews value)? adding,
    TResult? Function(LoadingNews value)? loading,
    TResult? Function(EditingNews value)? editing,
    TResult? Function(NewsNotFound value)? notFound,
  }) {
    final _that = this;
    switch (_that) {
      case AddingNews() when adding != null:
        return adding(_that);
      case LoadingNews() when loading != null:
        return loading(_that);
      case EditingNews() when editing != null:
        return editing(_that);
      case NewsNotFound() when notFound != null:
        return notFound(_that);
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
    TResult Function()? adding,
    TResult Function()? loading,
    TResult Function(News original)? editing,
    TResult Function()? notFound,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case AddingNews() when adding != null:
        return adding();
      case LoadingNews() when loading != null:
        return loading();
      case EditingNews() when editing != null:
        return editing(_that.original);
      case NewsNotFound() when notFound != null:
        return notFound();
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
    required TResult Function() adding,
    required TResult Function() loading,
    required TResult Function(News original) editing,
    required TResult Function() notFound,
  }) {
    final _that = this;
    switch (_that) {
      case AddingNews():
        return adding();
      case LoadingNews():
        return loading();
      case EditingNews():
        return editing(_that.original);
      case NewsNotFound():
        return notFound();
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
    TResult? Function()? adding,
    TResult? Function()? loading,
    TResult? Function(News original)? editing,
    TResult? Function()? notFound,
  }) {
    final _that = this;
    switch (_that) {
      case AddingNews() when adding != null:
        return adding();
      case LoadingNews() when loading != null:
        return loading();
      case EditingNews() when editing != null:
        return editing(_that.original);
      case NewsNotFound() when notFound != null:
        return notFound();
      case _:
        return null;
    }
  }
}

/// @nodoc

class AddingNews implements NewsEditorMode {
  const AddingNews();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AddingNews);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'NewsEditorMode.adding()';
  }
}

/// @nodoc

class LoadingNews implements NewsEditorMode {
  const LoadingNews();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LoadingNews);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'NewsEditorMode.loading()';
  }
}

/// @nodoc

class EditingNews implements NewsEditorMode {
  const EditingNews(this.original);

  final News original;

  /// Create a copy of NewsEditorMode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $EditingNewsCopyWith<EditingNews> get copyWith =>
      _$EditingNewsCopyWithImpl<EditingNews>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EditingNews &&
            (identical(other.original, original) ||
                other.original == original));
  }

  @override
  int get hashCode => Object.hash(runtimeType, original);

  @override
  String toString() {
    return 'NewsEditorMode.editing(original: $original)';
  }
}

/// @nodoc
abstract mixin class $EditingNewsCopyWith<$Res>
    implements $NewsEditorModeCopyWith<$Res> {
  factory $EditingNewsCopyWith(
          EditingNews value, $Res Function(EditingNews) _then) =
      _$EditingNewsCopyWithImpl;
  @useResult
  $Res call({News original});
}

/// @nodoc
class _$EditingNewsCopyWithImpl<$Res> implements $EditingNewsCopyWith<$Res> {
  _$EditingNewsCopyWithImpl(this._self, this._then);

  final EditingNews _self;
  final $Res Function(EditingNews) _then;

  /// Create a copy of NewsEditorMode
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? original = null,
  }) {
    return _then(EditingNews(
      null == original
          ? _self.original
          : original // ignore: cast_nullable_to_non_nullable
              as News,
    ));
  }
}

/// @nodoc

class NewsNotFound implements NewsEditorMode {
  const NewsNotFound();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is NewsNotFound);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'NewsEditorMode.notFound()';
  }
}

/// @nodoc
mixin _$NewsEditorState {
  NewsEditorMode get mode;
  Loadable<List<Category>> get categories;
  NewsRatio get ratio;
  Set<int> get selectedCategoryIds;

  /// Data wybrana w kalendarzu (przy edycji `null` = bez zmiany).
  DateTime? get pickedDate;

  /// Nowo wybrany obrazek (przy edycji `null` = bez zmiany).
  PickedFile? get image;
  SubmissionStatus get submission;

  /// Create a copy of NewsEditorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NewsEditorStateCopyWith<NewsEditorState> get copyWith =>
      _$NewsEditorStateCopyWithImpl<NewsEditorState>(
          this as NewsEditorState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NewsEditorState &&
            (identical(other.mode, mode) || other.mode == mode) &&
            (identical(other.categories, categories) ||
                other.categories == categories) &&
            (identical(other.ratio, ratio) || other.ratio == ratio) &&
            const DeepCollectionEquality()
                .equals(other.selectedCategoryIds, selectedCategoryIds) &&
            (identical(other.pickedDate, pickedDate) ||
                other.pickedDate == pickedDate) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.submission, submission) ||
                other.submission == submission));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      mode,
      categories,
      ratio,
      const DeepCollectionEquality().hash(selectedCategoryIds),
      pickedDate,
      image,
      submission);

  @override
  String toString() {
    return 'NewsEditorState(mode: $mode, categories: $categories, ratio: $ratio, selectedCategoryIds: $selectedCategoryIds, pickedDate: $pickedDate, image: $image, submission: $submission)';
  }
}

/// @nodoc
abstract mixin class $NewsEditorStateCopyWith<$Res> {
  factory $NewsEditorStateCopyWith(
          NewsEditorState value, $Res Function(NewsEditorState) _then) =
      _$NewsEditorStateCopyWithImpl;
  @useResult
  $Res call(
      {NewsEditorMode mode,
      Loadable<List<Category>> categories,
      NewsRatio ratio,
      Set<int> selectedCategoryIds,
      DateTime? pickedDate,
      PickedFile? image,
      SubmissionStatus submission});

  $NewsEditorModeCopyWith<$Res> get mode;
  $LoadableCopyWith<List<Category>, $Res> get categories;
  $SubmissionStatusCopyWith<$Res> get submission;
}

/// @nodoc
class _$NewsEditorStateCopyWithImpl<$Res>
    implements $NewsEditorStateCopyWith<$Res> {
  _$NewsEditorStateCopyWithImpl(this._self, this._then);

  final NewsEditorState _self;
  final $Res Function(NewsEditorState) _then;

  /// Create a copy of NewsEditorState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mode = null,
    Object? categories = null,
    Object? ratio = null,
    Object? selectedCategoryIds = null,
    Object? pickedDate = freezed,
    Object? image = freezed,
    Object? submission = null,
  }) {
    return _then(_self.copyWith(
      mode: null == mode
          ? _self.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as NewsEditorMode,
      categories: null == categories
          ? _self.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as Loadable<List<Category>>,
      ratio: null == ratio
          ? _self.ratio
          : ratio // ignore: cast_nullable_to_non_nullable
              as NewsRatio,
      selectedCategoryIds: null == selectedCategoryIds
          ? _self.selectedCategoryIds
          : selectedCategoryIds // ignore: cast_nullable_to_non_nullable
              as Set<int>,
      pickedDate: freezed == pickedDate
          ? _self.pickedDate
          : pickedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      image: freezed == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as PickedFile?,
      submission: null == submission
          ? _self.submission
          : submission // ignore: cast_nullable_to_non_nullable
              as SubmissionStatus,
    ));
  }

  /// Create a copy of NewsEditorState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NewsEditorModeCopyWith<$Res> get mode {
    return $NewsEditorModeCopyWith<$Res>(_self.mode, (value) {
      return _then(_self.copyWith(mode: value));
    });
  }

  /// Create a copy of NewsEditorState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LoadableCopyWith<List<Category>, $Res> get categories {
    return $LoadableCopyWith<List<Category>, $Res>(_self.categories, (value) {
      return _then(_self.copyWith(categories: value));
    });
  }

  /// Create a copy of NewsEditorState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SubmissionStatusCopyWith<$Res> get submission {
    return $SubmissionStatusCopyWith<$Res>(_self.submission, (value) {
      return _then(_self.copyWith(submission: value));
    });
  }
}

/// Adds pattern-matching-related methods to [NewsEditorState].
extension NewsEditorStatePatterns on NewsEditorState {
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
    TResult Function(_NewsEditorState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NewsEditorState() when $default != null:
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
    TResult Function(_NewsEditorState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NewsEditorState():
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
    TResult? Function(_NewsEditorState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NewsEditorState() when $default != null:
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
            NewsEditorMode mode,
            Loadable<List<Category>> categories,
            NewsRatio ratio,
            Set<int> selectedCategoryIds,
            DateTime? pickedDate,
            PickedFile? image,
            SubmissionStatus submission)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NewsEditorState() when $default != null:
        return $default(
            _that.mode,
            _that.categories,
            _that.ratio,
            _that.selectedCategoryIds,
            _that.pickedDate,
            _that.image,
            _that.submission);
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
            NewsEditorMode mode,
            Loadable<List<Category>> categories,
            NewsRatio ratio,
            Set<int> selectedCategoryIds,
            DateTime? pickedDate,
            PickedFile? image,
            SubmissionStatus submission)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NewsEditorState():
        return $default(
            _that.mode,
            _that.categories,
            _that.ratio,
            _that.selectedCategoryIds,
            _that.pickedDate,
            _that.image,
            _that.submission);
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
            NewsEditorMode mode,
            Loadable<List<Category>> categories,
            NewsRatio ratio,
            Set<int> selectedCategoryIds,
            DateTime? pickedDate,
            PickedFile? image,
            SubmissionStatus submission)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NewsEditorState() when $default != null:
        return $default(
            _that.mode,
            _that.categories,
            _that.ratio,
            _that.selectedCategoryIds,
            _that.pickedDate,
            _that.image,
            _that.submission);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _NewsEditorState implements NewsEditorState {
  const _NewsEditorState(
      {required this.mode,
      this.categories = const Loadable<List<Category>>.loading(),
      this.ratio = NewsRatio.horizontal,
      final Set<int> selectedCategoryIds = const <int>{},
      this.pickedDate,
      this.image,
      this.submission = const SubmissionStatus.idle()})
      : _selectedCategoryIds = selectedCategoryIds;

  @override
  final NewsEditorMode mode;
  @override
  @JsonKey()
  final Loadable<List<Category>> categories;
  @override
  @JsonKey()
  final NewsRatio ratio;
  final Set<int> _selectedCategoryIds;
  @override
  @JsonKey()
  Set<int> get selectedCategoryIds {
    if (_selectedCategoryIds is EqualUnmodifiableSetView)
      return _selectedCategoryIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_selectedCategoryIds);
  }

  /// Data wybrana w kalendarzu (przy edycji `null` = bez zmiany).
  @override
  final DateTime? pickedDate;

  /// Nowo wybrany obrazek (przy edycji `null` = bez zmiany).
  @override
  final PickedFile? image;
  @override
  @JsonKey()
  final SubmissionStatus submission;

  /// Create a copy of NewsEditorState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NewsEditorStateCopyWith<_NewsEditorState> get copyWith =>
      __$NewsEditorStateCopyWithImpl<_NewsEditorState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NewsEditorState &&
            (identical(other.mode, mode) || other.mode == mode) &&
            (identical(other.categories, categories) ||
                other.categories == categories) &&
            (identical(other.ratio, ratio) || other.ratio == ratio) &&
            const DeepCollectionEquality()
                .equals(other._selectedCategoryIds, _selectedCategoryIds) &&
            (identical(other.pickedDate, pickedDate) ||
                other.pickedDate == pickedDate) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.submission, submission) ||
                other.submission == submission));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      mode,
      categories,
      ratio,
      const DeepCollectionEquality().hash(_selectedCategoryIds),
      pickedDate,
      image,
      submission);

  @override
  String toString() {
    return 'NewsEditorState(mode: $mode, categories: $categories, ratio: $ratio, selectedCategoryIds: $selectedCategoryIds, pickedDate: $pickedDate, image: $image, submission: $submission)';
  }
}

/// @nodoc
abstract mixin class _$NewsEditorStateCopyWith<$Res>
    implements $NewsEditorStateCopyWith<$Res> {
  factory _$NewsEditorStateCopyWith(
          _NewsEditorState value, $Res Function(_NewsEditorState) _then) =
      __$NewsEditorStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {NewsEditorMode mode,
      Loadable<List<Category>> categories,
      NewsRatio ratio,
      Set<int> selectedCategoryIds,
      DateTime? pickedDate,
      PickedFile? image,
      SubmissionStatus submission});

  @override
  $NewsEditorModeCopyWith<$Res> get mode;
  @override
  $LoadableCopyWith<List<Category>, $Res> get categories;
  @override
  $SubmissionStatusCopyWith<$Res> get submission;
}

/// @nodoc
class __$NewsEditorStateCopyWithImpl<$Res>
    implements _$NewsEditorStateCopyWith<$Res> {
  __$NewsEditorStateCopyWithImpl(this._self, this._then);

  final _NewsEditorState _self;
  final $Res Function(_NewsEditorState) _then;

  /// Create a copy of NewsEditorState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? mode = null,
    Object? categories = null,
    Object? ratio = null,
    Object? selectedCategoryIds = null,
    Object? pickedDate = freezed,
    Object? image = freezed,
    Object? submission = null,
  }) {
    return _then(_NewsEditorState(
      mode: null == mode
          ? _self.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as NewsEditorMode,
      categories: null == categories
          ? _self.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as Loadable<List<Category>>,
      ratio: null == ratio
          ? _self.ratio
          : ratio // ignore: cast_nullable_to_non_nullable
              as NewsRatio,
      selectedCategoryIds: null == selectedCategoryIds
          ? _self._selectedCategoryIds
          : selectedCategoryIds // ignore: cast_nullable_to_non_nullable
              as Set<int>,
      pickedDate: freezed == pickedDate
          ? _self.pickedDate
          : pickedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      image: freezed == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as PickedFile?,
      submission: null == submission
          ? _self.submission
          : submission // ignore: cast_nullable_to_non_nullable
              as SubmissionStatus,
    ));
  }

  /// Create a copy of NewsEditorState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NewsEditorModeCopyWith<$Res> get mode {
    return $NewsEditorModeCopyWith<$Res>(_self.mode, (value) {
      return _then(_self.copyWith(mode: value));
    });
  }

  /// Create a copy of NewsEditorState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LoadableCopyWith<List<Category>, $Res> get categories {
    return $LoadableCopyWith<List<Category>, $Res>(_self.categories, (value) {
      return _then(_self.copyWith(categories: value));
    });
  }

  /// Create a copy of NewsEditorState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SubmissionStatusCopyWith<$Res> get submission {
    return $SubmissionStatusCopyWith<$Res>(_self.submission, (value) {
      return _then(_self.copyWith(submission: value));
    });
  }
}

// dart format on
