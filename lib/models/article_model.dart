class ArticleModel {
  final String image;
  final String title;
  final String description;
  final String author;
  final String urlArticle;
  const ArticleModel({
    required this.image,
    required this.title,
    required this.description,
    required this.author,
    required this.urlArticle,
  });
  //return of object
  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      image: json['urlToImage'],
      author: json['author'],
      title: json['title'],
      description: json['description'],
      urlArticle: json['url'],
    );
  }
}
