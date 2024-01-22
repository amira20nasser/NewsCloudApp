import 'package:flutter/material.dart';
import 'package:news_app/widgets/tag_widget.dart';

import '../colors_const.dart';
import '../models/article_model.dart';
import '../views/web_news_view.dart';

class BodyNewsWidget extends StatelessWidget {
  const BodyNewsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    ArticleModel news =
        ModalRoute.of(context)!.settings.arguments as ArticleModel;

    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TagWidget(
            color: semonBright,
            children: [
              const Icon(Icons.person),
              const SizedBox(width: 15),
              Flexible(
                child: Text(
                  news.author.isEmpty ? "Unknown" : news.author,
                  style: Theme.of(context).textTheme.bodyMedium,
                  overflow: TextOverflow.clip,
                  maxLines: 1,
                ),
              ),
            ],
          ),
          const SizedBox(height: 25),
          Text(
            news.description,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(height: 1.5),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WebNewsView(url: news.urlArticle),
                  ));
            },
            child: Text(
              "read more..",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: semonDark,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          )
        ],
      ),
    );
  }
}
