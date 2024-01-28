import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubits/fetch_new_database/fetch_news_state.dart';

import '../cubits/fetch_new_database/fetch_news_database.dart';
import '../models/article_model.dart';
import 'everything_news_list_tile.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'liked_news_item.dart';

class LikedListView extends StatelessWidget {
  const LikedListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchNewsDataBaseCubit, FetchNewsState>(
      builder: (context, state) {
        List<ArticleModel> articles =
            BlocProvider.of<FetchNewsDataBaseCubit>(context).articles ?? [];
        if (state is FetchNewsSuccess) {
          return AnimationLimiter(
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
                    child: LikedNewsItem(news: articles[index]),
                  ),
                ),
              ),
              itemCount: articles.length,
            ),
          );
        } else {
          //empty
          return const Center(
            child: Text(
              "No Liked articles",
              style: TextStyle(color: Colors.black),
            ),
          );
        }
      },
    );
  }
}
