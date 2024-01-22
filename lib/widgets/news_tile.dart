import 'package:flutter/material.dart';
import 'package:news_app/colors_const.dart';
import 'package:news_app/views/news_details.dart';
import '../models/article_model.dart';

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
                builder: (context) => const NewsDetails(),
                settings: RouteSettings(arguments: news),
              ),
            );
          },
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(
                  news.image,
                  height: 200,
                  width: double.infinity,
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
                // textDirection: TextDirection.rtl,
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
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton.icon(
              icon: const Icon(Icons.thumb_up_alt_outlined),
              label: const Text("Like"),
              onPressed: () {},
            ),
            TextButton.icon(
              icon: const Icon(Icons.share_rounded),
              label: const Text("Share"),
              onPressed: () {},
            ),
          ],
        ),
        const Divider(
          thickness: 5,
        ),
      ],
    );
  }
}
