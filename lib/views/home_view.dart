import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/top_headlines_category_cubit/top_headlines_category_cubit.dart';
import '../widgets/categories_list_view.dart';
import '../widgets/news_list_view_builder.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetTopHeadlinesCategory(),
      child: Builder(
        builder: (BuildContext context) => const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: CustomScrollView(
            physics: BouncingScrollPhysics(),
            //children is silver
            slivers: [
              SliverToBoxAdapter(child: CategoriesListView()),
              SliverPadding(padding: EdgeInsets.only(top: 30)),
              NewsFutureBuilder(),
              // SliverToBoxAdapter(
              //   child: NewsListView(),
              // ),
            ],
          ),
          // child: ListView(
          //   children: [
          //     CategoriesListView(),
          //     SizedBox(
          //       height: 30,
          //     ),
          //     Expanded(
          //       flex: 3,
          //       child: NewsListView(),
          //     ),
          //   ],
          // ),
        ),
      ),
    );
  }
}
