import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failures.dart';
import '../entities/news.dart';
import '../entities/news_draft.dart';

abstract interface class NewsRepository {
  Future<Either<Failure, List<News>>> getNews();

  Future<Either<Failure, Unit>> addNews(NewsDraft draft);

  Future<Either<Failure, Unit>> editNews(int id, NewsDraft draft);

  Future<Either<Failure, Unit>> deleteNews(int id);
}
