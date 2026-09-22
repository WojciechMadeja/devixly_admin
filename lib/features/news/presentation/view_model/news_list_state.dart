import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/errors/failures.dart';
import '../../../categories/domain/entities/category.dart';
import '../../domain/entities/news.dart';

part 'news_list_state.freezed.dart';

@freezed
sealed class NewsListState with _$NewsListState {
  const factory NewsListState.loading() = NewsListLoading;

  /// Aktualności od najnowszej oraz kategorie (do opisu aktualności).
  const factory NewsListState.loaded({
    required List<News> news,
    required List<Category> categories,
  }) = NewsListLoaded;

  const factory NewsListState.error(Failure failure) = NewsListError;
}

extension NewsListLoadedX on NewsListLoaded {
  /// Nazwy kategorii aktualności w kolejności jej id (nieznane pomijamy).
  List<String> categoryNamesOf(News item) => [
        for (final id in item.categoryIds)
          for (final category in categories)
            if (category.id == id) category.name,
      ];
}
