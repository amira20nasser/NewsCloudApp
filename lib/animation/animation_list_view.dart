import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../models/article_model.dart';
import '../widgets/liked_news_item.dart';

class AnimationListView extends StatelessWidget {
  const AnimationListView({
    super.key,
    required this.articles,
  });

  final List<ArticleModel> articles;

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => AnimationConfiguration.staggeredList(
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
              child: LikedNewsItem(news: articles[index]),
            ),
          ),
        ),
        itemCount: articles.length,
      ),
    );
  }
}
