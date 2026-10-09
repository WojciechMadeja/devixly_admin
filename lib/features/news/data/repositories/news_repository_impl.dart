import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/errors/guard.dart';
import '../../domain/entities/news.dart';
import '../../domain/entities/news_draft.dart';
import '../../domain/repositories/news_repository.dart';
import '../datasources/news_remote_data_source.dart';
import '../models/news_mapper.dart';

class NewsRepositoryImpl implements NewsRepository {
  NewsRepositoryImpl(this._remote);

  final NewsRemoteDataSource _remote;

  @override
  Future<Either<Failure, List<News>>> getNews() => guard(
    () async => [for (final model in await _remote.getNews()) model.toEntity()],
  );

  @override
  Future<Either<Failure, Unit>> addNews(NewsDraft draft) => guard(() async {
    await _remote.addNews(draft);
    return unit;
  });

  @override
  Future<Either<Failure, Unit>> editNews(int id, NewsDraft draft) =>
      guard(() async {
        await _remote.editNews(id, draft);
        return unit;
      });

  @override
  Future<Either<Failure, Unit>> deleteNews(int id) => guard(() async {
    await _remote.deleteNews(id);
    return unit;
  });
}
