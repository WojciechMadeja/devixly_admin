import 'package:equatable/equatable.dart';

import 'news_ratio.dart';

/// Aktualność publikowana w aplikacji Devixly.
class News extends Equatable {
  const News({
    required this.id,
    required this.title,
    this.createdAt = 0,
    this.content = '',
    this.imageUrl = '',
    this.author = '',
    this.ratio = NewsRatio.horizontal,
    this.categoryIds = const [],
    this.date = '',
  });

  final int id;

  /// Czas utworzenia (ms od epoki) — służy do sortowania listy.
  final int createdAt;
  final String title;
  final String content;
  final String imageUrl;
  final String author;
  final NewsRatio ratio;
  final List<int> categoryIds;

  /// Data publikacji w formacie API (`y-MM-d`) albo pusta.
  final String date;

  @override
  List<Object?> get props => [
        id,
        createdAt,
        title,
        content,
        imageUrl,
        author,
        ratio,
        categoryIds,
        date,
      ];
}
