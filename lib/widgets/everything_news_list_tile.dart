import 'package:flutter/material.dart';
import 'package:news_app/colors_const.dart';
import 'package:news_app/models/article_model.dart';

import '../views/news_details.dart';

class EverythingNewsListTile extends StatelessWidget {
  const EverythingNewsListTile({super.key, required this.news});
  final ArticleModel news;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        width: 80,
        height: 80,
        child: Image.network(
          news.image,
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
      ),
      title: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const NewsDetails(),
              settings: RouteSettings(arguments: news),
            ),
          );
        },
        child: Text(
          news.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      subtitle: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton.icon(
                icon: const Icon(
                  Icons.thumb_up_alt_outlined,
                  size: 13,
                ),
                label: Text(
                  "Like",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                onPressed: () {},
              ),
              TextButton.icon(
                icon: const Icon(
                  Icons.share_rounded,
                  size: 15,
                ),
                label: Text(
                  "Share",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                onPressed: () {},
              ),
            ],
          ),
          const Divider(),
        ],
      ),
    );
  }
}
