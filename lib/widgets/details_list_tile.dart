import 'package:flutter/material.dart';

import '../models/article_model.dart';
import 'custom_image.dart';

class DetailsListTile extends StatelessWidget {
  const DetailsListTile({
    super.key,
    required this.news,
  });

  final ArticleModel news;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomImage(news: news),
        const SizedBox(height: 12),
        Text(
          news.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          news.description,
          maxLines: 2,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
        ),
        const Divider(
          indent: 10,
          endIndent: 10,
        ),
      ],
    );
  }
}
