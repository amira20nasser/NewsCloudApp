import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubits/get_everything_cubit/get_everything_news_cubit.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/views/news_view.dart';
import 'package:news_app/widgets/custom_text_field.dart';

import '../widgets/search_result.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  List<ArticleModel>? articles;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetEverythingNewsCubit(),
      child: Builder(
        builder: (context) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              const SizedBox(height: 10),
              CustomTextField(
                hint: "search....",
                onChanged: (value) async {
                  if (value.isNotEmpty) {
                    articles =
                        await GetEverythingNewsCubit.get(context).getNews(
                      searchFor: value,
                      sortBy: "popularity",
                    );
                    setState(() {});
                  }
                },
              ),
              Expanded(
                child: SearchResultListFutureBuilder(
                  articles: articles ?? [],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
