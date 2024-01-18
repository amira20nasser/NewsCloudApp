import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubits/get_everything_cubit/get_everything_news_states.dart';

import '../colors_const.dart';
import '../cubits/get_everything_cubit/get_everything_news_cubit.dart';
import '../models/article_model.dart';
import 'everything_news_list_view.dart';

class EverythingNewsListFutureBuilder extends StatelessWidget {
  const EverythingNewsListFutureBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    debugPrint("Calling EverythingNewsListFutureBuilder");

    return BlocBuilder<GetEverythingNewsCubit, EverthingNewsState>(
      builder: (context, state) {
        return FutureBuilder<List<ArticleModel>>(
          future: BlocProvider.of<GetEverythingNewsCubit>(context).getNews(
              sortBy: BlocProvider.of<GetEverythingNewsCubit>(context).sortBy),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return EverythingNewsListView(articles: snapshot.data ?? []);
            } else if (snapshot.hasError) {
              return const Text('oops there was an error, try later');
            } else {
              return Center(
                child: CircularProgressIndicator(
                  color: semonDark,
                ),
              );
            }
          },
        );
      },
    );
  }
}
