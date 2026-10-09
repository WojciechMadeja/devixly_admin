import 'dart:typed_data';

import 'package:devixly_admin/app/di/injection.dart';
import 'package:devixly_admin/core/errors/exceptions.dart';
import 'package:devixly_admin/core/services/media_picker.dart';
import 'package:devixly_admin/features/news/data/datasources/news_remote_data_source.dart';
import 'package:devixly_admin/features/news/data/models/news_mapper.dart';
import 'package:devixly_admin/features/news/domain/entities/news_draft.dart';
import 'package:devixly_admin/features/news/domain/entities/news_ratio.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/fake_backend.dart';
import '../../../helpers/test_dependencies.dart';

/// Kontrakt z backendem (`NewsEndpoint`): obrazek idzie osobno do storage,
/// a aktualność wskazuje go ścieżką.
void main() {
  const draft = NewsDraft(
    title: 'Nowa inwestycja',
    content: 'Treść aktualności',
    author: 'Jan Kowalski',
    ratio: NewsRatio.vertical,
    categoryIds: [2, 4],
    date: '2026-09-5',
  );
  const draftJson = {
    'date': '2026-09-05T00:00:00.000Z',
    'title': 'Nowa inwestycja',
    'content': 'Treść aktualności',
    'author': 'Jan Kowalski',
    'ratio': 'vertical',
    'categoryIds': [2, 4],
  };
  NewsDraft withImage() => NewsDraft(
    title: draft.title,
    content: draft.content,
    author: draft.author,
    ratio: draft.ratio,
    categoryIds: draft.categoryIds,
    date: draft.date,
    image: PickedFile(name: 'photo.png', bytes: Uint8List.fromList([1, 2])),
  );

  late FakeBackend api;
  late NewsRemoteDataSource dataSource;

  setUp(() async {
    api = await setUpTestDependencies();
    dataSource = getIt<NewsRemoteDataSource>();
  });
  tearDown(getIt.reset);

  test('news.list zamienia pola odpowiedzi na encję', () async {
    final news = await dataSource.getNews();

    expect(api.calls.single.route, 'news.list');
    final first = news.first.toEntity();
    expect(first.title, 'Nowa inwestycja w Dubaju');
    expect(first.imageUrl, 'https://example.com/news-11.png');
    expect(first.ratio, NewsRatio.horizontal);
    expect(first.categoryIds, [2, 4]);
    expect(first.date, '2026-09-5');
    expect(first.createdAt, 1757500000000);
  });

  test('news.create: obrazek do storage, w aktualności jego ścieżka', () async {
    await dataSource.addNews(withImage());

    expect(api.calls.map((call) => call.route), [
      'news.createImageUpload',
      'news.create',
    ]);
    expect(api.calls.first.arguments, {'fileName': 'photo.png'});
    expect(api.calls.first.headers['authorization'], 'Bearer auth-token-1');
    final upload = api.uploads.single;
    expect(upload.uploadDescription, 'upload-description-1');
    expect(upload.bytes, [1, 2]);
    expect(api.calls.last.arguments, {
      'input': {...draftJson, 'imagePath': 'news/fixture/obraz.png'},
    });
  });

  test('news.create bez obrazka nie wysyła pliku ani ścieżki', () async {
    await dataSource.addNews(draft);

    expect(api.calls.single.route, 'news.create');
    expect(api.calls.single.arguments, {'input': draftJson});
    expect(api.uploads, isEmpty);
  });

  test('nieudana wysyłka obrazka przerywa zapis aktualności', () async {
    api.uploadSucceeds = false;

    await expectLater(
      dataSource.addNews(withImage()),
      throwsA(isA<ServerException>()),
    );
    expect(api.callsOf('news.create'), isEmpty);
  });

  test('news.update bez nowego obrazka zostawia dotychczasowy', () async {
    await dataSource.editNews(11, draft);

    expect(api.calls.map((call) => call.route), [
      'news.getById',
      'news.update',
    ]);
    expect(api.calls.last.arguments, {
      'id': 11,
      'input': {...draftJson, 'imagePath': 'news/fixture/news-11.png'},
    });
    expect(api.uploads, isEmpty);
  });

  test('news.update z nowym obrazkiem podmienia ścieżkę', () async {
    await dataSource.editNews(11, withImage());

    expect(api.calls.map((call) => call.route), [
      'news.createImageUpload',
      'news.update',
    ]);
    expect(
      (api.calls.last.arguments['input'] as Map)['imagePath'],
      'news/fixture/obraz.png',
    );
  });

  test('news.delete z id', () async {
    await dataSource.deleteNews(11);

    final call = api.calls.single;
    expect(call.route, 'news.delete');
    expect(call.arguments, {'id': 11});
  });
}
