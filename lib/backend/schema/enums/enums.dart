import 'package:collection/collection.dart';

enum Ratio {
  horizontal,
  vertical,
  square,
}

enum SortKey {
  name,
  company,
  admin,
  block,
}

enum SortOrder {
  ascending,
  descendig,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (Ratio):
      return Ratio.values.deserialize(value) as T?;
    case (SortKey):
      return SortKey.values.deserialize(value) as T?;
    case (SortOrder):
      return SortOrder.values.deserialize(value) as T?;
    default:
      return null;
  }
}
