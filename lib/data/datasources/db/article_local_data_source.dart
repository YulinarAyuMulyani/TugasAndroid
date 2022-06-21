import 'package:application_berita_b/data/datasources/database_helper.dart';
import 'package:application_berita_b/data/models/article_table.dart';

import '../../../common/exception.dart';

abstract class ArticleLocalDataSource {
  Future<String> insertBookmarkArticle(ArticleTable article);
  Future<String> removeBookmarkArticle(ArticleTable article);

  Future<ArticleTable?> getArticleByUrl(String url);
  Future<List<ArticleTable>> getBookmarkArticles();

  Future<void> cacheTopHeadlineArticles(List<ArticleTable> articles);
  Future<List<ArticleTable>> getCacheTopHeadlineArticles();

  Future<void> cacheHeadlineBussinesArticles(List<ArticleTable> articles);
  Future<List<ArticleTable>> getCacheHeadlineBussinesArticles();
}

class ArticleLocalDataSourceImpl implements ArticleLocalDataSource {
  final DatabaseHelper databaseHelper;

  ArticleLocalDataSourceImpl({required this.databaseHelper});

  @override
  Future<String> insertBookmarkArticle(ArticleTable article) async {
    // TODO: implement insertBookmarkArticle
    try {
      await databaseHelper.insertBookmarkArticle(article);
      return 'Berhasil Menambahkan Pada Bookmark';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<String> removeBookmarkArticle(ArticleTable article) async {
    // TODO: implement removeBookmarkArticle
    try {
      await databaseHelper.removeBookmarkArticle(article);
      return 'Data berhasil di hapus pada Bookmark';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<ArticleTable?> getArticleByUrl(String url) async {
    // TODO: implement getArticleByUrl
    final result = await databaseHelper.getArticleByUrl(url);
    if (result != null) {
      return ArticleTable.fromMap(result);
    } else {
      return null;
    }
  }

  @override
  Future<List<ArticleTable>> getBookmarkArticles() async {
    // TODO: implement getBookmarkArticles
    final result = await databaseHelper.getBookMarkArticles();
    return result.map((data) => ArticleTable.fromMap(data)).toList();
  }

  @override
  Future<void> cacheTopHeadlineArticles(List<ArticleTable> articles) async {
    // TODO: implement cacheTopHeadlineArticles
    await databaseHelper.clearCacheArticles('top headline');
    await databaseHelper.insertCacheTransactionArticles(
        articles, 'top headline');
  }

  @override
  Future<List<ArticleTable>> getCacheTopHeadlineArticles() async {
    // TODO: implement getCacheTopHeadlineArticles
    final result = await databaseHelper.getCacheArticles('top headline');
    if (result.length > 0) {
      return result.map((data) => ArticleTable.fromMap(data)).toList();
    } else {
      throw CacheException("Can't get the data :(");
    }
  }

  @override
  Future<void> cacheHeadlineBussinesArticles(
      List<ArticleTable> articles) async {
    // TODO: implement cacheHeadlineBussinesArticles
    await databaseHelper.clearCacheArticles('headline business');
    await databaseHelper.insertCacheTransactionArticles(
        articles, 'headline business');
  }

  @override
  Future<List<ArticleTable>> getCacheHeadlineBussinesArticles() async {
    // TODO: implement getCacheHeadlineBussinesArticles
    final result = await databaseHelper.getCacheArticles('headline business');
    if (result.length > 0) {
      return result.map((data) => ArticleTable.fromMap(data)).toList();
    } else {
      throw CacheException("Can't get the data:(");
    }
  }
}
