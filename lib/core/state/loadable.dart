import 'package:freezed_annotation/freezed_annotation.dart';

import '../errors/failures.dart';

part 'loadable.freezed.dart';

/// Dane pobierane asynchronicznie jako część większego stanu ekranu.
@freezed
sealed class Loadable<T> with _$Loadable<T> {
  const factory Loadable.loading() = Loading<T>;

  const factory Loadable.loaded(T value) = Loaded<T>;

  const factory Loadable.error(Failure failure) = LoadError<T>;
}
