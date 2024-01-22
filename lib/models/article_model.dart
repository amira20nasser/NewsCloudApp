class ArticleModel {
  final String image;
  final String title;
  final String description;
  final String author;
  const ArticleModel({
    required this.image,
    required this.title,
    required this.description,
    required this.author,
  });
  //return of object
  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      image: json['urlToImage'],
      author: json['author'],
      title: json['title'],
      description: json['description'],
    );
  }
}
