import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/get_everything_cubit/get_everything_news_cubit.dart';
import '../widgets/everything_news_list_future_builder.dart';
import '../widgets/sort_by_bottom.dart';

List<String> sortBy = ["relevancy", "popularity", "publishedAt"];

class NewsView extends StatelessWidget {
  const NewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetEverythingNewsCubit(),
      child: Builder(builder: (context) {
        return const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              SortByButton(),
              Expanded(
                child: EverythingNewsListFutureBuilder(),
              ),
            ],
          ),
        );
      }),
    );
  }
}
