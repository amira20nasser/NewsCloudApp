import 'package:hive/hive.dart';
part 'article_model.g.dart';

@HiveType(typeId: 0)
class ArticleModel extends HiveObject {
  @HiveField(0)
  final String image;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final String author;
  @HiveField(4)
  final String urlArticle;

  bool isLike;
  ArticleModel({
    required this.image,
    required this.title,
    required this.description,
    required this.author,
    required this.urlArticle,
    this.isLike = false,
  });
  //return of object
  //  factory ArticleModel.fromJson(Map<String, dynamic> json) {
  //   return ArticleModel(
  //     image: json['urlToImage'],
  //     author: json['author'],
  //     title: json['title'],
  //     description: json['description'],
  //     urlArticle: json['url'],
  //   );
  // }
}
