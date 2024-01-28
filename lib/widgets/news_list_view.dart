import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'news_tile.dart';

class NewsListView extends StatelessWidget {
  const NewsListView({
    super.key,
    required this.articles,
  });
  final List<ArticleModel> articles;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: articles.isEmpty
          ? SliverChildListDelegate(
              [
                const SizedBox(height: 170),
                const Center(child: Text("Not Available try again later!")),
                Image.asset(
                  height: 200,
                  "assets/Screenshot 2023-11-01 005246.png",
                ),
              ],
            )
          : SliverChildBuilderDelegate(
              childCount: articles.length,
              semanticIndexOffset: -250,
              addAutomaticKeepAlives: false,
              (context, index) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: NewsTile(news: articles[index]),
              ),
            ),
    );
  }
}
