import 'package:flutter/material.dart';

import '../colors_const.dart';
import '../models/article_model.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({
    super.key,
    required this.news,
  });

  final ArticleModel news;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(19),
      child: Image.network(
        news.image,
        height: 300,
        width: MediaQuery.sizeOf(context).width,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }
          return Center(
            child: CircularProgressIndicator(
              color: semonDark,
            ),
          );
        },
        errorBuilder: (context, error, stackTrace) {
          return const Center(
            child: Icon(
              Icons.image,
              size: 60,
            ),
          );
        },
      ),
    );
  }
}
