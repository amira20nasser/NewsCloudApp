import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubits/fetch_new_database/fetch_news_database.dart';

import '../widgets/liked_list_view.dart';

class LikedNewsView extends StatefulWidget {
  const LikedNewsView({super.key});

  @override
  State<LikedNewsView> createState() => _LikedNewsViewState();
}

class _LikedNewsViewState extends State<LikedNewsView> {
  @override
  void initState() {
    BlocProvider.of<FetchNewsDataBaseCubit>(context).fetchAllNews() ?? [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LikedListView();
  }
}
