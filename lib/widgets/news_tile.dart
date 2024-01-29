import 'package:flutter/material.dart';
import 'package:news_app/views/news_details.dart';
import '../models/article_model.dart';
import 'actions_list_tile.dart';
import 'details_list_tile.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({
    super.key,
    required this.news,
  });
  final ArticleModel news;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const NewsDetailsView(),
                settings: RouteSettings(arguments: news),
              ),
            );
          },
          child: DetailsListTile(news: news),
        ),
        ActionsListTile(news: news),
        const Divider(
          thickness: 5,
        ),
      ],
    );
  }
}
