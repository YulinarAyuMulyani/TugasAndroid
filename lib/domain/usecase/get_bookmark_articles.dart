import 'package:dartz/dartz.dart';
import 'package:application_berita_b/common/failure.dart';
import 'package:application_berita_b/domain/entities/article.dart';
import 'package:application_berita_b/domain/repositories/article_repository.dart';

class GetBookmarkArticles {
  final ArticleRepository _repository;
  GetBookmarkArticles(this._repository);

  Future<Either<Failure, List<Article>>> execute() {
    return _repository.getBookmarkArticles();
  }
}
