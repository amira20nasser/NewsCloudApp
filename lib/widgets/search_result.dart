import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubits/get_everything_cubit/get_everything_news_states.dart';
import '../cubits/get_everything_cubit/get_everything_news_cubit.dart';
import '../models/article_model.dart';
import 'everything_news_list_view.dart';

class SearchResultListFutureBuilder extends StatelessWidget {
  const SearchResultListFutureBuilder({
    super.key,
    required this.articles,
  });
  final List<ArticleModel> articles;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetEverythingNewsCubit, EverthingNewsState>(
      builder: (context, state) {
        debugPrint("Calling EverythingNewsListFutureBuilder*");
        debugPrint("$state");

        return EverythingNewsListView(articles: articles);
      },
    );
  }
}
