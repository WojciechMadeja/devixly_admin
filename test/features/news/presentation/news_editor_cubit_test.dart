import 'dart:typed_data';

import 'package:bloc_test/bloc_test.dart';
import 'package:devixly_admin/core/errors/failures.dart';
import 'package:devixly_admin/core/services/media_picker.dart';
import 'package:devixly_admin/core/state/loadable.dart';
import 'package:devixly_admin/core/state/submission_status.dart';
import 'package:devixly_admin/features/auth/domain/entities/admin_user.dart';
import 'package:devixly_admin/features/auth/domain/entities/auth_session.dart';
import 'package:devixly_admin/features/auth/domain/repositories/auth_repository.dart';
import 'package:devixly_admin/features/categories/domain/entities/category.dart';
import 'package:devixly_admin/features/categories/domain/repositories/categories_repository.dart';
import 'package:devixly_admin/features/news/domain/entities/news.dart';
import 'package:devixly_admin/features/news/domain/entities/news_draft.dart';
import 'package:devixly_admin/features/news/domain/entities/news_ratio.dart';
import 'package:devixly_admin/features/news/domain/repositories/news_repository.dart';
import 'package:devixly_admin/features/news/presentation/view_model/news_editor_cubit.dart';
import 'package:devixly_admin/features/news/presentation/view_model/news_editor_state.dart';
import 'package:fpdart/fpdart.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockNews extends Mock implements NewsRepository {}

class _MockCategories extends Mock implements CategoriesRepository {}

class _MockAuth extends Mock implements AuthRepository {}

class _MockPicker extends Mock implements MediaPicker {}

void main() {
  const categories = [Category(id: 2, name: 'Inwestycje')];
  const original = News(
    id: 11,
    title: 'Stary tytuł',
    author: 'Anna Nowak',
    ratio: NewsRatio.square,
    categoryIds: [2],
    date: '2026-09-5',
  );
  final image = PickedFile(name: 'a.png', bytes: Uint8List.fromList([1]));

  late _MockNews news;
  late _MockCategories categoriesRepository;
  late _MockAuth auth;
  late _MockPicker picker;

  setUpAll(
    () => registerFallbackValue(
      const NewsDraft(
        title: '',
        content: '',
        author: '',
        ratio: NewsRatio.horizontal,
        categoryIds: [],
        date: '',
      ),
    ),
  );

  setUp(() {
    news = _MockNews();
    categoriesRepository = _MockCategories();
    auth = _MockAuth();
    picker = _MockPicker();
    when(
      categoriesRepository.getCategories,
    ).thenAnswer((_) async => const Right(categories));
    when(() => auth.currentSession).thenReturn(
      const AuthSession(
        accessToken: 't',
        refreshToken: 'r',
        refreshTokenId: 1,
        user: AdminUser(
          id: 1,
          email: 'a@b.pl',
          firstName: 'Jan',
          lastName: 'Kowalski',
        ),
      ),
    );
  });

  NewsEditorCubit build() =>
      NewsEditorCubit(news, categoriesRepository, auth, picker);

  blocTest<NewsEditorCubit, NewsEditorState>(
    'dodawanie: autor to zalogowany admin, data w formacie API',
    build: build,
    setUp: () => when(
      () => news.addNews(any()),
    ).thenAnswer((_) async => const Right(unit)),
    act: (cubit) async {
      await cubit.startAdding();
      cubit
        ..setRatio(NewsRatio.vertical)
        ..toggleCategory(2)
        ..setDate(DateTime(2026, 9, 5));
      await cubit.submit(title: ' Nowość ', content: 'Treść');
    },
    verify: (cubit) {
      final draft =
          verify(() => news.addNews(captureAny())).captured.single as NewsDraft;
      expect(draft.title, 'Nowość');
      expect(draft.author, 'Jan Kowalski');
      expect(draft.ratio, NewsRatio.vertical);
      expect(draft.categoryIds, [2]);
      expect(draft.date, '2026-09-5');
      expect(draft.image, isNull);
      // Po dodaniu formularz jest czyszczony.
      expect(cubit.state.selectedCategoryIds, isEmpty);
      expect(cubit.state.submission, const SubmissionStatus.idle());
    },
  );

  blocTest<NewsEditorCubit, NewsEditorState>(
    'pusty tytuł zgłasza błąd walidacji i nie woła API',
    build: build,
    act: (cubit) => cubit.submit(title: '  ', content: ''),
    expect: () => [
      const NewsEditorState(
        mode: NewsEditorMode.adding(),
        submission: SubmissionStatus.failure(ValidationFailure()),
      ),
      const NewsEditorState(mode: NewsEditorMode.adding()),
    ],
    verify: (_) => verifyNever(() => news.addNews(any())),
  );

  blocTest<NewsEditorCubit, NewsEditorState>(
    'edycja: zachowuje autora i datę, wysyła nowy obrazek',
    build: build,
    setUp: () {
      when(picker.pickImage).thenAnswer((_) async => ImagePicked(image));
      when(
        () => news.editNews(11, any()),
      ).thenAnswer((_) async => const Right(unit));
    },
    act: (cubit) async {
      await cubit.startEditing(11, news: original);
      await cubit.pickImage();
      await cubit.submit(title: 'Nowy tytuł', content: 'Treść');
    },
    verify: (cubit) {
      final draft =
          verify(() => news.editNews(11, captureAny())).captured.single
              as NewsDraft;
      expect(draft.author, 'Anna Nowak');
      expect(draft.date, '2026-09-5');
      expect(draft.ratio, NewsRatio.square);
      expect(draft.categoryIds, [2]);
      expect(draft.image, image);
      expect(cubit.state.categories, const Loadable.loaded(categories));
    },
  );

  blocTest<NewsEditorCubit, NewsEditorState>(
    'edycja bez aktualności w pamięci pobiera ją po id',
    build: build,
    setUp: () =>
        when(news.getNews).thenAnswer((_) async => const Right([original])),
    act: (cubit) => cubit.startEditing(11),
    verify: (cubit) =>
        expect(cubit.state.mode, const NewsEditorMode.editing(original)),
  );

  blocTest<NewsEditorCubit, NewsEditorState>(
    'nieobsługiwany plik nie zmienia obrazka i zwraca false',
    build: build,
    setUp: () => when(
      picker.pickImage,
    ).thenAnswer((_) async => const ImagePickUnsupported()),
    act: (cubit) async => expect(await cubit.pickImage(), isFalse),
    expect: () => <NewsEditorState>[],
  );
}
