// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'csv_import_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CsvFileStatus {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CsvFileStatus);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CsvFileStatus()';
  }
}

/// @nodoc
class $CsvFileStatusCopyWith<$Res> {
  $CsvFileStatusCopyWith(CsvFileStatus _, $Res Function(CsvFileStatus) __);
}

/// Adds pattern-matching-related methods to [CsvFileStatus].
extension CsvFileStatusPatterns on CsvFileStatus {
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
    TResult Function(CsvFileIdle value)? idle,
    TResult Function(CsvFileNotRecognized value)? notRecognized,
    TResult Function(CsvFileMissingHeaders value)? missingHeaders,
    TResult Function(CsvFileInvalidEmails value)? invalidEmails,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case CsvFileIdle() when idle != null:
        return idle(_that);
      case CsvFileNotRecognized() when notRecognized != null:
        return notRecognized(_that);
      case CsvFileMissingHeaders() when missingHeaders != null:
        return missingHeaders(_that);
      case CsvFileInvalidEmails() when invalidEmails != null:
        return invalidEmails(_that);
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
    required TResult Function(CsvFileIdle value) idle,
    required TResult Function(CsvFileNotRecognized value) notRecognized,
    required TResult Function(CsvFileMissingHeaders value) missingHeaders,
    required TResult Function(CsvFileInvalidEmails value) invalidEmails,
  }) {
    final _that = this;
    switch (_that) {
      case CsvFileIdle():
        return idle(_that);
      case CsvFileNotRecognized():
        return notRecognized(_that);
      case CsvFileMissingHeaders():
        return missingHeaders(_that);
      case CsvFileInvalidEmails():
        return invalidEmails(_that);
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
    TResult? Function(CsvFileIdle value)? idle,
    TResult? Function(CsvFileNotRecognized value)? notRecognized,
    TResult? Function(CsvFileMissingHeaders value)? missingHeaders,
    TResult? Function(CsvFileInvalidEmails value)? invalidEmails,
  }) {
    final _that = this;
    switch (_that) {
      case CsvFileIdle() when idle != null:
        return idle(_that);
      case CsvFileNotRecognized() when notRecognized != null:
        return notRecognized(_that);
      case CsvFileMissingHeaders() when missingHeaders != null:
        return missingHeaders(_that);
      case CsvFileInvalidEmails() when invalidEmails != null:
        return invalidEmails(_that);
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
    TResult Function()? idle,
    TResult Function()? notRecognized,
    TResult Function(List<String> required)? missingHeaders,
    TResult Function(List<String> errors)? invalidEmails,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case CsvFileIdle() when idle != null:
        return idle();
      case CsvFileNotRecognized() when notRecognized != null:
        return notRecognized();
      case CsvFileMissingHeaders() when missingHeaders != null:
        return missingHeaders(_that.required);
      case CsvFileInvalidEmails() when invalidEmails != null:
        return invalidEmails(_that.errors);
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
    required TResult Function() idle,
    required TResult Function() notRecognized,
    required TResult Function(List<String> required) missingHeaders,
    required TResult Function(List<String> errors) invalidEmails,
  }) {
    final _that = this;
    switch (_that) {
      case CsvFileIdle():
        return idle();
      case CsvFileNotRecognized():
        return notRecognized();
      case CsvFileMissingHeaders():
        return missingHeaders(_that.required);
      case CsvFileInvalidEmails():
        return invalidEmails(_that.errors);
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
    TResult? Function()? idle,
    TResult? Function()? notRecognized,
    TResult? Function(List<String> required)? missingHeaders,
    TResult? Function(List<String> errors)? invalidEmails,
  }) {
    final _that = this;
    switch (_that) {
      case CsvFileIdle() when idle != null:
        return idle();
      case CsvFileNotRecognized() when notRecognized != null:
        return notRecognized();
      case CsvFileMissingHeaders() when missingHeaders != null:
        return missingHeaders(_that.required);
      case CsvFileInvalidEmails() when invalidEmails != null:
        return invalidEmails(_that.errors);
      case _:
        return null;
    }
  }
}

/// @nodoc

class CsvFileIdle implements CsvFileStatus {
  const CsvFileIdle();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CsvFileIdle);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CsvFileStatus.idle()';
  }
}

/// @nodoc

class CsvFileNotRecognized implements CsvFileStatus {
  const CsvFileNotRecognized();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CsvFileNotRecognized);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CsvFileStatus.notRecognized()';
  }
}

/// @nodoc

class CsvFileMissingHeaders implements CsvFileStatus {
  const CsvFileMissingHeaders(final List<String> required)
      : _required = required;

  final List<String> _required;
  List<String> get required {
    if (_required is EqualUnmodifiableListView) return _required;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_required);
  }

  /// Create a copy of CsvFileStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CsvFileMissingHeadersCopyWith<CsvFileMissingHeaders> get copyWith =>
      _$CsvFileMissingHeadersCopyWithImpl<CsvFileMissingHeaders>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CsvFileMissingHeaders &&
            const DeepCollectionEquality().equals(other._required, _required));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_required));

  @override
  String toString() {
    return 'CsvFileStatus.missingHeaders(required: $required)';
  }
}

/// @nodoc
abstract mixin class $CsvFileMissingHeadersCopyWith<$Res>
    implements $CsvFileStatusCopyWith<$Res> {
  factory $CsvFileMissingHeadersCopyWith(CsvFileMissingHeaders value,
          $Res Function(CsvFileMissingHeaders) _then) =
      _$CsvFileMissingHeadersCopyWithImpl;
  @useResult
  $Res call({List<String> required});
}

/// @nodoc
class _$CsvFileMissingHeadersCopyWithImpl<$Res>
    implements $CsvFileMissingHeadersCopyWith<$Res> {
  _$CsvFileMissingHeadersCopyWithImpl(this._self, this._then);

  final CsvFileMissingHeaders _self;
  final $Res Function(CsvFileMissingHeaders) _then;

  /// Create a copy of CsvFileStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? required = null,
  }) {
    return _then(CsvFileMissingHeaders(
      null == required
          ? _self._required
          : required // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class CsvFileInvalidEmails implements CsvFileStatus {
  const CsvFileInvalidEmails(final List<String> errors) : _errors = errors;

  final List<String> _errors;
  List<String> get errors {
    if (_errors is EqualUnmodifiableListView) return _errors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_errors);
  }

  /// Create a copy of CsvFileStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CsvFileInvalidEmailsCopyWith<CsvFileInvalidEmails> get copyWith =>
      _$CsvFileInvalidEmailsCopyWithImpl<CsvFileInvalidEmails>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CsvFileInvalidEmails &&
            const DeepCollectionEquality().equals(other._errors, _errors));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_errors));

  @override
  String toString() {
    return 'CsvFileStatus.invalidEmails(errors: $errors)';
  }
}

/// @nodoc
abstract mixin class $CsvFileInvalidEmailsCopyWith<$Res>
    implements $CsvFileStatusCopyWith<$Res> {
  factory $CsvFileInvalidEmailsCopyWith(CsvFileInvalidEmails value,
          $Res Function(CsvFileInvalidEmails) _then) =
      _$CsvFileInvalidEmailsCopyWithImpl;
  @useResult
  $Res call({List<String> errors});
}

/// @nodoc
class _$CsvFileInvalidEmailsCopyWithImpl<$Res>
    implements $CsvFileInvalidEmailsCopyWith<$Res> {
  _$CsvFileInvalidEmailsCopyWithImpl(this._self, this._then);

  final CsvFileInvalidEmails _self;
  final $Res Function(CsvFileInvalidEmails) _then;

  /// Create a copy of CsvFileStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? errors = null,
  }) {
    return _then(CsvFileInvalidEmails(
      null == errors
          ? _self._errors
          : errors // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
mixin _$CsvImportState {
  Loadable<List<Company>> get companies;
  Company? get selectedCompany;
  List<CsvUser> get users;
  CsvFileStatus get fileStatus;
  SubmissionStatus get submission;

  /// Create a copy of CsvImportState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CsvImportStateCopyWith<CsvImportState> get copyWith =>
      _$CsvImportStateCopyWithImpl<CsvImportState>(
          this as CsvImportState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CsvImportState &&
            (identical(other.companies, companies) ||
                other.companies == companies) &&
            (identical(other.selectedCompany, selectedCompany) ||
                other.selectedCompany == selectedCompany) &&
            const DeepCollectionEquality().equals(other.users, users) &&
            (identical(other.fileStatus, fileStatus) ||
                other.fileStatus == fileStatus) &&
            (identical(other.submission, submission) ||
                other.submission == submission));
  }

  @override
  int get hashCode => Object.hash(runtimeType, companies, selectedCompany,
      const DeepCollectionEquality().hash(users), fileStatus, submission);

  @override
  String toString() {
    return 'CsvImportState(companies: $companies, selectedCompany: $selectedCompany, users: $users, fileStatus: $fileStatus, submission: $submission)';
  }
}

/// @nodoc
abstract mixin class $CsvImportStateCopyWith<$Res> {
  factory $CsvImportStateCopyWith(
          CsvImportState value, $Res Function(CsvImportState) _then) =
      _$CsvImportStateCopyWithImpl;
  @useResult
  $Res call(
      {Loadable<List<Company>> companies,
      Company? selectedCompany,
      List<CsvUser> users,
      CsvFileStatus fileStatus,
      SubmissionStatus submission});

  $LoadableCopyWith<List<Company>, $Res> get companies;
  $CsvFileStatusCopyWith<$Res> get fileStatus;
  $SubmissionStatusCopyWith<$Res> get submission;
}

/// @nodoc
class _$CsvImportStateCopyWithImpl<$Res>
    implements $CsvImportStateCopyWith<$Res> {
  _$CsvImportStateCopyWithImpl(this._self, this._then);

  final CsvImportState _self;
  final $Res Function(CsvImportState) _then;

  /// Create a copy of CsvImportState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? companies = null,
    Object? selectedCompany = freezed,
    Object? users = null,
    Object? fileStatus = null,
    Object? submission = null,
  }) {
    return _then(_self.copyWith(
      companies: null == companies
          ? _self.companies
          : companies // ignore: cast_nullable_to_non_nullable
              as Loadable<List<Company>>,
      selectedCompany: freezed == selectedCompany
          ? _self.selectedCompany
          : selectedCompany // ignore: cast_nullable_to_non_nullable
              as Company?,
      users: null == users
          ? _self.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<CsvUser>,
      fileStatus: null == fileStatus
          ? _self.fileStatus
          : fileStatus // ignore: cast_nullable_to_non_nullable
              as CsvFileStatus,
      submission: null == submission
          ? _self.submission
          : submission // ignore: cast_nullable_to_non_nullable
              as SubmissionStatus,
    ));
  }

  /// Create a copy of CsvImportState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LoadableCopyWith<List<Company>, $Res> get companies {
    return $LoadableCopyWith<List<Company>, $Res>(_self.companies, (value) {
      return _then(_self.copyWith(companies: value));
    });
  }

  /// Create a copy of CsvImportState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CsvFileStatusCopyWith<$Res> get fileStatus {
    return $CsvFileStatusCopyWith<$Res>(_self.fileStatus, (value) {
      return _then(_self.copyWith(fileStatus: value));
    });
  }

  /// Create a copy of CsvImportState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SubmissionStatusCopyWith<$Res> get submission {
    return $SubmissionStatusCopyWith<$Res>(_self.submission, (value) {
      return _then(_self.copyWith(submission: value));
    });
  }
}

/// Adds pattern-matching-related methods to [CsvImportState].
extension CsvImportStatePatterns on CsvImportState {
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
    TResult Function(_CsvImportState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CsvImportState() when $default != null:
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
    TResult Function(_CsvImportState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CsvImportState():
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
    TResult? Function(_CsvImportState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CsvImportState() when $default != null:
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
            Loadable<List<Company>> companies,
            Company? selectedCompany,
            List<CsvUser> users,
            CsvFileStatus fileStatus,
            SubmissionStatus submission)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CsvImportState() when $default != null:
        return $default(_that.companies, _that.selectedCompany, _that.users,
            _that.fileStatus, _that.submission);
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
            Loadable<List<Company>> companies,
            Company? selectedCompany,
            List<CsvUser> users,
            CsvFileStatus fileStatus,
            SubmissionStatus submission)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CsvImportState():
        return $default(_that.companies, _that.selectedCompany, _that.users,
            _that.fileStatus, _that.submission);
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
            Loadable<List<Company>> companies,
            Company? selectedCompany,
            List<CsvUser> users,
            CsvFileStatus fileStatus,
            SubmissionStatus submission)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CsvImportState() when $default != null:
        return $default(_that.companies, _that.selectedCompany, _that.users,
            _that.fileStatus, _that.submission);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _CsvImportState implements CsvImportState {
  const _CsvImportState(
      {this.companies = const Loadable<List<Company>>.loading(),
      this.selectedCompany,
      final List<CsvUser> users = const <CsvUser>[],
      this.fileStatus = const CsvFileStatus.idle(),
      this.submission = const SubmissionStatus.idle()})
      : _users = users;

  @override
  @JsonKey()
  final Loadable<List<Company>> companies;
  @override
  final Company? selectedCompany;
  final List<CsvUser> _users;
  @override
  @JsonKey()
  List<CsvUser> get users {
    if (_users is EqualUnmodifiableListView) return _users;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_users);
  }

  @override
  @JsonKey()
  final CsvFileStatus fileStatus;
  @override
  @JsonKey()
  final SubmissionStatus submission;

  /// Create a copy of CsvImportState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CsvImportStateCopyWith<_CsvImportState> get copyWith =>
      __$CsvImportStateCopyWithImpl<_CsvImportState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CsvImportState &&
            (identical(other.companies, companies) ||
                other.companies == companies) &&
            (identical(other.selectedCompany, selectedCompany) ||
                other.selectedCompany == selectedCompany) &&
            const DeepCollectionEquality().equals(other._users, _users) &&
            (identical(other.fileStatus, fileStatus) ||
                other.fileStatus == fileStatus) &&
            (identical(other.submission, submission) ||
                other.submission == submission));
  }

  @override
  int get hashCode => Object.hash(runtimeType, companies, selectedCompany,
      const DeepCollectionEquality().hash(_users), fileStatus, submission);

  @override
  String toString() {
    return 'CsvImportState(companies: $companies, selectedCompany: $selectedCompany, users: $users, fileStatus: $fileStatus, submission: $submission)';
  }
}

/// @nodoc
abstract mixin class _$CsvImportStateCopyWith<$Res>
    implements $CsvImportStateCopyWith<$Res> {
  factory _$CsvImportStateCopyWith(
          _CsvImportState value, $Res Function(_CsvImportState) _then) =
      __$CsvImportStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {Loadable<List<Company>> companies,
      Company? selectedCompany,
      List<CsvUser> users,
      CsvFileStatus fileStatus,
      SubmissionStatus submission});

  @override
  $LoadableCopyWith<List<Company>, $Res> get companies;
  @override
  $CsvFileStatusCopyWith<$Res> get fileStatus;
  @override
  $SubmissionStatusCopyWith<$Res> get submission;
}

/// @nodoc
class __$CsvImportStateCopyWithImpl<$Res>
    implements _$CsvImportStateCopyWith<$Res> {
  __$CsvImportStateCopyWithImpl(this._self, this._then);

  final _CsvImportState _self;
  final $Res Function(_CsvImportState) _then;

  /// Create a copy of CsvImportState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? companies = null,
    Object? selectedCompany = freezed,
    Object? users = null,
    Object? fileStatus = null,
    Object? submission = null,
  }) {
    return _then(_CsvImportState(
      companies: null == companies
          ? _self.companies
          : companies // ignore: cast_nullable_to_non_nullable
              as Loadable<List<Company>>,
      selectedCompany: freezed == selectedCompany
          ? _self.selectedCompany
          : selectedCompany // ignore: cast_nullable_to_non_nullable
              as Company?,
      users: null == users
          ? _self._users
          : users // ignore: cast_nullable_to_non_nullable
              as List<CsvUser>,
      fileStatus: null == fileStatus
          ? _self.fileStatus
          : fileStatus // ignore: cast_nullable_to_non_nullable
              as CsvFileStatus,
      submission: null == submission
          ? _self.submission
          : submission // ignore: cast_nullable_to_non_nullable
              as SubmissionStatus,
    ));
  }

  /// Create a copy of CsvImportState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LoadableCopyWith<List<Company>, $Res> get companies {
    return $LoadableCopyWith<List<Company>, $Res>(_self.companies, (value) {
      return _then(_self.copyWith(companies: value));
    });
  }

  /// Create a copy of CsvImportState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CsvFileStatusCopyWith<$Res> get fileStatus {
    return $CsvFileStatusCopyWith<$Res>(_self.fileStatus, (value) {
      return _then(_self.copyWith(fileStatus: value));
    });
  }

  /// Create a copy of CsvImportState
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
