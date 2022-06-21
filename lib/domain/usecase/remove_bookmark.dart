import 'package:dartz/dartz.dart';
import 'package:application_berita_b/common/failure.dart';
import 'package:application_berita_b/domain/entities/article.dart';
import 'package:application_berita_b/domain/repositories/article_repository.dart';

class RemoveBookmarkArticle {
  final ArticleRepository repository;

  RemoveBookmarkArticle(this.repository);

  Future<Either<Failure, String>> execute(Article article) {
    return repository.removeBookmarkArticle(article);
  }
}
