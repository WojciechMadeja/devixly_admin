import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../categories/domain/repositories/categories_repository.dart';
import '../../domain/entities/news.dart';
import '../../domain/repositories/news_repository.dart';
import 'news_list_state.dart';

class NewsListCubit extends Cubit<NewsListState> {
  NewsListCubit(this._news, this._categories)
      : super(const NewsListState.loading());

  final NewsRepository _news;
  final CategoriesRepository _categories;

  Future<void> load() async {
    emit(const NewsListState.loading());
    final (newsResult, categoriesResult) =
        await (_news.getNews(), _categories.getCategories()).wait;
    if (isClosed) return;
    emit(
      newsResult.match(
        NewsListState.error,
        (news) => categoriesResult.match(
          NewsListState.error,
          (categories) => NewsListState.loaded(
            news: [...news]..sort((a, b) => b.createdAt.compareTo(a.createdAt)),
            categories: categories,
          ),
        ),
      ),
    );
  }

  /// Zwraca, czy usunięcie się udało (dialog zamyka się tylko przy sukcesie).
  Future<bool> delete(News item) async {
    final result = await _news.deleteNews(item.id);
    return result.match((_) => false, (_) {
      final current = state;
      if (current is NewsListLoaded && !isClosed) {
        emit(
          current.copyWith(
            news: [
              for (final n in current.news)
                if (n.id != item.id) n,
            ],
          ),
        );
      }
      return true;
    });
  }
}
