import 'package:background_devixly_client/background_devixly_client.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/network/backend_call.dart';
import '../../../../core/network/file_upload.dart';
import '../../../../core/services/media_picker.dart';
import '../../domain/entities/news_draft.dart';
import '../models/news_mapper.dart';

abstract interface class NewsRemoteDataSource {
  Future<List<News>> getNews();

  Future<void> addNews(NewsDraft draft);

  Future<void> editNews(int id, NewsDraft draft);

  Future<void> deleteNews(int id);
}

/// Aktualności w backendzie (`NewsEndpoint`). Obrazek jest najpierw
/// wysyłany prosto do storage backendu (`createImageUpload` + wysyłka
/// pliku), a aktualność wskazuje go ścieżką w storage.
class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  NewsRemoteDataSourceImpl(this._client, this._upload);

  final Client _client;
  final FileUploadFunction _upload;

  @override
  Future<List<News>> getNews() => backendCall(_client.news.list);

  @override
  Future<void> addNews(NewsDraft draft) => backendCall(() async {
    final image = draft.image;
    await _client.news.create(
      _input(
        draft,
        imagePath: image == null ? null : await _uploadImage(image),
      ),
    );
  });

  /// Bez nowego obrazka zostaje dotychczasowy: backend zastępuje przy
  /// zapisie wszystkie pola, więc jego ścieżka jest najpierw odczytywana.
  @override
  Future<void> editNews(int id, NewsDraft draft) => backendCall(() async {
    final image = draft.image;
    final String? imagePath;
    if (image != null) {
      imagePath = await _uploadImage(image);
    } else {
      final existing = await _client.news.getById(id);
      if (existing == null) throw NewsNotFoundException(id: id);
      imagePath = existing.imagePath;
    }
    await _client.news.update(id, _input(draft, imagePath: imagePath));
  });

  @override
  Future<void> deleteNews(int id) => backendCall(() => _client.news.delete(id));

  /// Wysyła obrazek i zwraca jego ścieżkę w storage.
  Future<String> _uploadImage(PickedFile image) async {
    final upload = await _client.news.createImageUpload(fileName: image.name);
    if (!await _upload(upload.uploadDescription, image.bytes)) {
      throw const ServerException(502, 'Nie udało się wysłać obrazka.');
    }
    return upload.path;
  }

  static NewsInput _input(NewsDraft draft, {required String? imagePath}) =>
      NewsInput(
        date: newsDateFromApi(draft.date),
        title: draft.title,
        content: draft.content,
        imagePath: imagePath,
        author: draft.author,
        ratio: NewsImageRatio.values.byName(draft.ratio.name),
        categoryIds: draft.categoryIds,
      );
}
