import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:news_app/colors_const.dart';
import 'package:news_app/cubits/add_delete_news_database/add_delete_news_database.dart';
import 'package:news_app/cubits/add_delete_news_database/add_delete_news_states.dart';
import 'package:news_app/models/article_model.dart';
import '../const.dart';
import '../views/news_details.dart';

class EverythingNewsListTile extends StatelessWidget {
  const EverythingNewsListTile({super.key, required this.news});
  final ArticleModel news;
  @override
  Widget build(BuildContext context) {
    debugPrint("${news.isLike}");

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
              builder: (context) => const NewsDetailsView(),
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
