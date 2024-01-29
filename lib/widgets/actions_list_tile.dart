import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../colors_const.dart';
import '../cubits/add_delete_news_database/add_delete_news_database.dart';
import '../cubits/add_delete_news_database/add_delete_news_states.dart';
import '../models/article_model.dart';

class ActionsListTile extends StatelessWidget {
  const ActionsListTile({
    super.key,
    required this.news,
  });

  final ArticleModel news;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        BlocBuilder<AddDeleteNewsDataBaseCubit, AddDeleteNewsState>(
          builder: (context, state) {
            return TextButton.icon(
              icon: news.isLike
                  ? Icon(Icons.thumb_up_alt, color: bluebright)
                  : const Icon(Icons.thumb_up_alt_outlined),
              label: Text(
                "Like",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              onPressed: () {
                if (news.isLike) {
                  BlocProvider.of<AddDeleteNewsDataBaseCubit>(context)
                      .deleteDataDatabase(news);
                } else {
                  BlocProvider.of<AddDeleteNewsDataBaseCubit>(context)
                      .addDataDatabase(news);
                }
              },
            );
          },
        ),
        TextButton.icon(
          icon: const Icon(Icons.share_rounded),
          label: const Text("Share"),
          onPressed: () {},
        ),
      ],
    );
  }
}
