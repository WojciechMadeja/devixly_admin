import 'dart:convert';
import 'dart:typed_data';

import '../../../../core/config/api_config.dart';
import '../../../../core/network/authorized_api_client.dart';
import '../../../../core/network/http_json_client.dart';
import '../../../../core/network/json_body.dart';
import '../../domain/entities/news_draft.dart';
import '../models/news_model.dart';

abstract interface class NewsRemoteDataSource {
  Future<List<NewsModel>> getNews();

  Future<void> addNews(NewsDraft draft);

  Future<void> editNews(int id, NewsDraft draft);

  Future<void> deleteNews(int id);
}

/// Aktualności w Xano (multipart/form-data, pole pliku `image_uploaded`).
class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  NewsRemoteDataSourceImpl(this._client);

  final AuthorizedApiClient _client;

  static const _news = '${XanoApiGroup.news}/news';
  static const _imageField = 'image_uploaded';

  @override
  Future<List<NewsModel>> getNews() async {
    final json = await _client.get(_news);
    return json.asJsonList().map(NewsModel.fromJson).toList();
  }

  @override
  Future<void> addNews(NewsDraft draft) {
    final image = draft.image;
    return _client.multipart(
      'POST',
      _news,
      fields: _fields(draft),
      // Bez obrazka backend dostaje pustą część pliku — jak dotychczas.
      files: [
        MultipartFileData(
          field: _imageField,
          bytes: image?.bytes ?? Uint8List(0),
          filename: image?.name,
        ),
      ],
    );
  }

  @override
  Future<void> editNews(int id, NewsDraft draft) {
    final image = draft.image;
    return _client.multipart(
      'PATCH',
      '$_news/$id',
      fields: {
        ..._fields(draft),
        // Bez nowego obrazka wersja FlutterFlow wysyłała pole tekstowe
        // "null" zamiast pliku — zachowane do czasu weryfikacji z backendem
        // (MIGRATION_PLAN.md, „Do weryfikacji na żywym API”).
        if (image == null) _imageField: 'null',
      },
      files: [
        if (image != null)
          MultipartFileData(
            field: _imageField,
            bytes: image.bytes,
            filename: image.name,
          ),
      ],
    );
  }

  @override
  Future<void> deleteNews(int id) => _client.delete('$_news/$id');

  static Map<String, String> _fields(NewsDraft draft) => {
        'title': draft.title,
        'content': draft.content,
        'author': draft.author,
        'ratio': draft.ratio.name,
        'categories': jsonEncode(draft.categoryIds),
        'date': draft.date,
      };
}
