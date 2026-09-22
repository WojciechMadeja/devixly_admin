import 'package:bloc_test/bloc_test.dart';
import 'package:devixly_admin/core/errors/failures.dart';
import 'package:devixly_admin/features/categories/domain/entities/category.dart';
import 'package:devixly_admin/features/categories/domain/repositories/categories_repository.dart';
import 'package:devixly_admin/features/news/domain/entities/news.dart';
import 'package:devixly_admin/features/news/domain/repositories/news_repository.dart';
import 'package:devixly_admin/features/news/presentation/view_model/news_list_cubit.dart';
import 'package:devixly_admin/features/news/presentation/view_model/news_list_state.dart';
import 'package:fpdart/fpdart.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockNews extends Mock implements NewsRepository {}

class _MockCategories extends Mock implements CategoriesRepository {}

void main() {
  const older = News(
    id: 1,
    title: 'Starsza',
    createdAt: 100,
    categoryIds: [3, 9],
  );
  const newer = News(id: 2, title: 'Nowsza', createdAt: 200);
  const categories = [
    Category(id: 3, name: 'Wydarzenia'),
    Category(id: 4, name: 'Inwestycje'),
  ];

  late _MockNews news;
  late _MockCategories categoriesRepository;

  setUp(() {
    news = _MockNews();
    categoriesRepository = _MockCategories();
    when(
      categoriesRepository.getCategories,
    ).thenAnswer((_) async => const Right(categories));
  });

  blocTest<NewsListCubit, NewsListState>(
    'load sortuje od najnowszej aktualności',
    build: () => NewsListCubit(news, categoriesRepository),
    setUp: () =>
        when(news.getNews).thenAnswer((_) async => const Right([older, newer])),
    act: (cubit) => cubit.load(),
    expect: () => [
      const NewsListState.loading(),
      const NewsListState.loaded(news: [newer, older], categories: categories),
    ],
    verify: (cubit) => expect(
      (cubit.state as NewsListLoaded).categoryNamesOf(older),
      ['Wydarzenia'],
    ),
  );

  blocTest<NewsListCubit, NewsListState>(
    'błąd pobierania kategorii kończy się stanem błędu',
    build: () => NewsListCubit(news, categoriesRepository),
    setUp: () {
      when(news.getNews).thenAnswer((_) async => const Right([older]));
      when(
        categoriesRepository.getCategories,
      ).thenAnswer((_) async => const Left(NetworkFailure()));
    },
    act: (cubit) => cubit.load(),
    expect: () => [
      const NewsListState.loading(),
      const NewsListState.error(NetworkFailure()),
    ],
  );

  blocTest<NewsListCubit, NewsListState>(
    'usunięcie usuwa aktualność z listy',
    build: () => NewsListCubit(news, categoriesRepository)
      ..emit(
        const NewsListState.loaded(
          news: [newer, older],
          categories: categories,
        ),
      ),
    setUp: () => when(
      () => news.deleteNews(2),
    ).thenAnswer((_) async => const Right(unit)),
    act: (cubit) async => expect(await cubit.delete(newer), isTrue),
    expect: () => [
      const NewsListState.loaded(news: [older], categories: categories),
    ],
  );
}
