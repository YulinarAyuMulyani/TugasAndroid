import 'package:equatable/equatable.dart';
import 'article.dart';

class Articles extends Equatable {
  Articles({
    required this.totalResult,
    required this.articles,
  });

  int totalResult;
  List<Article> articles;

  @override
  List<Object?> get props => [totalResult, articles];
}
