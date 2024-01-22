import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/widgets/tag_widget.dart';

import '../cubits/top_headlines_category_cubit/top_headlines_category_cubit.dart';
import '../models/article_model.dart';

class HeaderNewsWidget extends StatelessWidget {
  const HeaderNewsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    ArticleModel news =
        ModalRoute.of(context)!.settings.arguments as ArticleModel;

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
          ),
          Text(
            news.title,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ],
      ),
    );
  }
}
