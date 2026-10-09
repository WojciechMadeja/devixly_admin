import 'package:devixly_admin/app/di/injection.dart';
import 'package:devixly_admin/features/news/domain/entities/news.dart';
import 'package:devixly_admin/features/news/domain/entities/news_ratio.dart';
import 'package:devixly_admin/features/news/presentation/view/add_news_view.dart';
import 'package:devixly_admin/features/news/presentation/view/edit_news_view.dart';
import 'package:devixly_admin/features/news/presentation/view/news_list_view.dart';
import 'package:devixly_admin/features/news/presentation/widgets/news_list_view/news_card.dart';
import 'package:devixly_admin/features/news/presentation/widgets/news_list_view/news_card_skeleton.dart';
import 'package:devixly_admin/features/news/presentation/widgets/news_list_view/news_preview_dialog.dart';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/app_harness.dart';
import '../../helpers/fake_network_images.dart';
import '../../helpers/fake_backend.dart';
import '../../helpers/fixtures.dart';
import '../../helpers/golden_helpers.dart';
import '../../helpers/test_dependencies.dart';

const _news = News(
  id: 11,
  createdAt: 1757500000000,
  title: 'Nowa inwestycja w Dubaju',
  content:
      'Rozpoczynamy sprzedaż apartamentów w nowym projekcie. '
      'Szczegóły oferty znajdziesz w panelu.',
  imageUrl: 'https://example.com/news-11.png',
  author: 'Jan Kowalski',
  categoryIds: [2, 4],
  date: '2026-09-5',
);
const _verticalNews = News(
  id: 12,
  createdAt: 1757600000000,
  title: 'Spotkanie z inwestorami',
  content: 'Zapraszamy na spotkanie z inwestorami w biurze Crowd Empire.',
  imageUrl: 'https://example.com/news-12.png',
  author: 'Anna Nowak',
  ratio: NewsRatio.vertical,
  categoryIds: [3],
  date: '2026-09-12',
);
const _card = Size(800, 240);

Future<void> _expectBaseline(String name) => expectLater(
  find.byType(MaterialApp),
  matchesGoldenFile(baselineGolden(name, depth: 2)),
);

Future<void> _pumpPage(
  WidgetTester tester,
  Widget view, {
  Size viewport = GoldenViewport.desktop,
  FakeBackend? api,
}) async {
  await setUpTestDependencies(api: api);
  await pumpView(tester, view, viewport: viewport);
}

void main() {
  setUpAll(() {
    HttpOverrides.global = FakeNetworkImagesOverrides(
      readFixtureBytes('images/news.png'),
    );
  });
  tearDown(getIt.reset);

  group('NewsListView', () {
    testWidgets('desktop wygląda jak w FlutterFlow', (tester) async {
      await _pumpPage(tester, const NewsListView());
      await _expectBaseline('pages/news_list_desktop');
    });

    testWidgets('ładowanie wygląda jak w FlutterFlow', (tester) async {
      await _pumpPage(
        tester,
        const NewsListView(),
        api: FakeBackend(responseDelay: const Duration(seconds: 10)),
      );
      await _expectBaseline('pages/news_list_loading_desktop');
      await tester.pump(const Duration(seconds: 11));
    });

    testWidgets('mobile mieści się na ekranie', (tester) async {
      await _pumpPage(
        tester,
        const NewsListView(),
        viewport: GoldenViewport.mobile,
      );
      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('goldens/news_list_mobile.png'),
      );
    });
  });

  group('AddNewsView', () {
    testWidgets('desktop wygląda jak w FlutterFlow', (tester) async {
      await _pumpPage(tester, const AddNewsView());
      await _expectBaseline('pages/add_news_desktop');
    });

    testWidgets('mobile wygląda jak w FlutterFlow', (tester) async {
      await _pumpPage(
        tester,
        const AddNewsView(),
        viewport: GoldenViewport.mobile,
      );
      await _expectBaseline('pages/add_news_mobile');
    });

    testWidgets('ładowanie kategorii wygląda jak w FlutterFlow', (
      tester,
    ) async {
      await _pumpPage(
        tester,
        const AddNewsView(),
        api: FakeBackend(responseDelay: const Duration(seconds: 10)),
      );
      await _expectBaseline('pages/add_news_loading_desktop');
      await tester.pump(const Duration(seconds: 11));
    });
  });

  group('EditNewsView', () {
    testWidgets('desktop wygląda jak w FlutterFlow', (tester) async {
      await _pumpPage(tester, const EditNewsView(newsId: 11, news: _news));
      await _expectBaseline('pages/edit_news_desktop');
    });

    testWidgets('mobile mieści się na ekranie', (tester) async {
      await _pumpPage(
        tester,
        const EditNewsView(newsId: 11, news: _news),
        viewport: GoldenViewport.mobile,
      );
      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('goldens/edit_news_mobile.png'),
      );
    });
  });

  group('komponenty', () {
    testWidgets('karta aktualności wygląda jak w FlutterFlow', (tester) async {
      await pumpComponent(
        tester,
        NewsCard(news: _news, onEdit: () {}, onDelete: () {}),
        viewport: _card,
      );
      await _expectBaseline('components/news_card');
    });

    testWidgets('szkielet karty wygląda jak w FlutterFlow', (tester) async {
      await pumpComponent(tester, const NewsCardSkeleton(), viewport: _card);
      await _expectBaseline('components/news_card_placeholder');
    });

    for (final (golden, news, categories) in [
      (
        'display_news_horizontal',
        _news,
        const ['Inwestycje', 'Rynek nieruchomości'],
      ),
      ('display_news_vertical', _verticalNews, const ['Wydarzenia']),
    ]) {
      testWidgets('$golden wygląda jak w FlutterFlow', (tester) async {
        await pumpComponent(
          tester,
          NewsPreviewDialog(news: news, categoryNames: categories),
          viewport: GoldenViewport.desktop,
        );
        await _expectBaseline('components/$golden');
      });
    }
  });
}
