import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/colors_const.dart';
import '../cubits/top_headlines_category_cubit/categories_states.dart';
import '../cubits/top_headlines_category_cubit/top_headlines_category_cubit.dart';
import '../models/article_model.dart';
import 'news_list_view.dart';

class NewsFutureBuilder extends StatelessWidget {
  const NewsFutureBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    debugPrint("Calling NewsFutureBuilder");
    return BlocBuilder<GetTopHeadlinesCategory, CategoryState>(
      builder: (context, state) {
        String category = GetTopHeadlinesCategory.get(context).category;
        return FutureBuilder<List<ArticleModel>>(
          future:
              GetTopHeadlinesCategory.get(context).getNews(category: category),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return NewsListView(articles: snapshot.data ?? []);
            } else if (snapshot.hasError) {
              return const SliverToBoxAdapter(
                child: Text('oops was an error, try later'),
              );
            } else {
              return SliverToBoxAdapter(
                child: Center(
                  child: CircularProgressIndicator(
                    color: semonDark,
                  ),
                ),
              );
            }
          },
        );
      },
    );

//time is higher
    // ListView.builder(
    //   itemCount: articles.length,
    //   //make list view his children build all items but make it load
    //   shrinkWrap: true,
    //   //make it list view has certain height by making it not scroll
    //   physics: const NeverScrollableScrollPhysics(),
    //   itemBuilder: (context, index) {
    //     return Padding(
    //       padding: const EdgeInsets.only(bottom: 8.0),
    //       child: NewsTile(
    //         news: articles[index],
    //       ),
    //     );
    //   },
    // );
  }
}
