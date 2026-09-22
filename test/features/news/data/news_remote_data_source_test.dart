import 'dart:typed_data';

import 'package:devixly_admin/app/di/injection.dart';
import 'package:devixly_admin/core/services/media_picker.dart';
import 'package:devixly_admin/features/news/data/datasources/news_remote_data_source.dart';
import 'package:devixly_admin/features/news/domain/entities/news_draft.dart';
import 'package:devixly_admin/features/news/domain/entities/news_ratio.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/fake_xano_api.dart';
import '../../../helpers/test_dependencies.dart';

/// Kontrakt z Xano (grupa api:iiXsTPtO) — multipart jak w wersji FlutterFlow.
void main() {
  const base = 'https://xxiz-mxuj-zpyz.n7e.xano.io/api:iiXsTPtO/news';
  const draft = NewsDraft(
    title: 'Nowa inwestycja',
    content: 'Treść aktualności',
    author: 'Jan Kowalski',
    ratio: NewsRatio.vertical,
    categoryIds: [2, 4],
    date: '2026-09-5',
  );

  late FakeXanoApi api;
  late NewsRemoteDataSource dataSource;

  setUp(() async {
    api = await setUpTestDependencies();
    dataSource = getIt<NewsRemoteDataSource>();
  });
  tearDown(getIt.reset);

  test('GET news zamienia pola odpowiedzi na model', () async {
    final news = await dataSource.getNews();

    expect(api.requests.single.url.toString(), base);
    final first = news.first.toEntity();
    expect(first.title, 'Nowa inwestycja w Dubaju');
    expect(first.imageUrl, 'https://example.com/news-11.png');
    expect(first.ratio, NewsRatio.horizontal);
    expect(first.categoryIds, [2, 4]);
    expect(first.date, '2026-09-5');
    expect(first.createdAt, 1757500000000);
  });

  test('POST news: pola formularza i obrazek jako multipart', () async {
    await dataSource.addNews(
      NewsDraft(
        title: draft.title,
        content: draft.content,
        author: draft.author,
        ratio: draft.ratio,
        categoryIds: draft.categoryIds,
        date: draft.date,
        image: PickedFile(name: 'photo.png', bytes: Uint8List.fromList([1, 2])),
      ),
    );

    final request = api.requests.single;
    expect(request.method, 'POST');
    expect(request.url.toString(), base);
    expect(request.headers['Authorization'], 'Bearer auth-token-1');
    expect(request.headers['content-type'], startsWith('multipart/form-data'));
    final parts = request.multipartParts;
    expect({
      for (final e in parts.entries) e.key: e.value.value
    }, {
      'title': 'Nowa inwestycja',
      'content': 'Treść aktualności',
      'author': 'Jan Kowalski',
      'ratio': 'vertical',
      'categories': '[2,4]',
      'date': '2026-09-5',
      'image_uploaded': '\x01\x02',
    });
    expect(parts['image_uploaded']?.filename, 'photo.png');
  });

  test('POST news bez obrazka wysyła pustą część pliku (jak dotąd)', () async {
    await dataSource.addNews(draft);

    final image = api.requests.single.multipartParts['image_uploaded'];
    expect(image, isNotNull);
    expect(image!.value, isEmpty);
    expect(image.filename, isNull);
  });

  test('PATCH news/{id} bez nowego obrazka wysyła pole "null" (jak dotąd)',
      () async {
    await dataSource.editNews(11, draft);

    final request = api.requests.single;
    expect(request.method, 'PATCH');
    expect(request.url.toString(), '$base/11');
    final parts = request.multipartParts;
    expect(parts['image_uploaded'], (filename: null, value: 'null'));
    expect(parts['title']?.value, 'Nowa inwestycja');
  });

  test('DELETE news/{id}', () async {
    await dataSource.deleteNews(11);

    final request = api.requests.single;
    expect(request.method, 'DELETE');
    expect(request.url.toString(), '$base/11');
  });
}
