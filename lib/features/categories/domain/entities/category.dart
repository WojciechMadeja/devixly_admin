import 'package:equatable/equatable.dart';

import '../../../../core/constants/business_rules.dart';

/// Kategoria aktualności.
class Category extends Equatable {
  const Category({required this.id, required this.name, this.newsCount = 0});

  final int id;
  final String name;

  /// Liczba aktualności w kategorii.
  final int newsCount;

  /// Kategorii właściciela platformy nie można edytować ani usuwać.
  bool get isProtected => name == kProtectedOwnerName;

  Category copyWith({String? name}) =>
      Category(id: id, name: name ?? this.name, newsCount: newsCount);

  @override
  List<Object?> get props => [id, name, newsCount];
}
