import 'package:background_devixly_client/background_devixly_client.dart' as sp;

import '../../../../core/utils/date_formatters.dart';
import '../../domain/entities/news.dart';
import '../../domain/entities/news_ratio.dart';

extension NewsMapper on sp.News {
  News toEntity() => News(
    id: id!,
    createdAt: createdAt.millisecondsSinceEpoch,
    title: title,
    content: content,
    imageUrl: image ?? '',
    author: author,
    ratio: NewsRatio.fromApi(ratio.name),
    categoryIds: [
      for (final link in categories ?? const <sp.NewsCategory>[])
        link.categoryId,
    ],
    date: switch (date) {
      final date? => DateFormatters.toApiDate(date.toUtc()),
      null => '',
    },
  );
}

/// Data aktualności z formularza (`rrrr-mm-d`) jako data backendu; pusty
/// albo błędny tekst daje `null`.
DateTime? newsDateFromApi(String date) {
  final parts = date.split('-').map(int.tryParse).toList();
  if (parts.length != 3 || parts.contains(null)) return null;
  return DateTime.utc(parts[0]!, parts[1]!, parts[2]!);
}
