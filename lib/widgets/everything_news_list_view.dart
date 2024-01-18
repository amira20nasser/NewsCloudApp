import 'package:flutter/widgets.dart';

import '../models/article_model.dart';
import 'everything_news_list_tile.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class EverythingNewsListView extends StatelessWidget {
  const EverythingNewsListView({
    super.key,
    required this.articles,
  });
  final List<ArticleModel> articles;
  @override
  Widget build(BuildContext context) {
    return articles.isEmpty
        ? Column(
            children: [
              const SizedBox(height: 170),
              const Center(child: Text("Not Available try again later!")),
              Image.asset(
                height: 200,
                "assets/Screenshot 2023-11-01 005246.png",
              ),
            ],
          )
        : AnimationLimiter(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) =>
                  AnimationConfiguration.staggeredList(
                      position: index,
                      delay: const Duration(milliseconds: 100),
                      child: SlideAnimation(
                          duration: const Duration(milliseconds: 2500),
                          curve: Curves.fastLinearToSlowEaseIn,
                          verticalOffset: 300,
                          child: FlipAnimation(
                              flipAxis: FlipAxis.y,
                              duration: const Duration(milliseconds: 1500),
                              curve: Curves.fastLinearToSlowEaseIn,
                              child: EverythingNewsListTile(
                                  news: articles[index])))),
              itemCount: articles.length,
            ),
          );
  }
}
