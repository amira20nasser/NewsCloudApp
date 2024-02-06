import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubits/fetch_new_database/fetch_news_state.dart';

import '../animation/animation_list_view.dart';
import '../cubits/fetch_new_database/fetch_news_database.dart';
import '../models/article_model.dart';

class LikedListView extends StatelessWidget {
  const LikedListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchNewsDataBaseCubit, FetchNewsState>(
      builder: (context, state) {
        List<ArticleModel> articles =
            FetchNewsDataBaseCubit.get(context).articles ?? [];
        if (state is FetchNewsSuccess) {
          return AnimationListView(articles: articles);
        } else {
          //empty list
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
