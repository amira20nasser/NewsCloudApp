import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/colors_const.dart';
import 'package:news_app/cubits/add_delete_news_database/add_delete_news_database.dart';
import 'package:news_app/cubits/add_delete_news_database/add_delete_news_states.dart';
import 'package:news_app/cubits/fetch_new_database/fetch_news_database.dart';
import 'package:news_app/models/article_model.dart';

import '../views/news_details.dart';

class LikedNewsItem extends StatelessWidget {
  const LikedNewsItem({super.key, required this.news});
  final ArticleModel news;
  @override
  Widget build(BuildContext context) {
    debugPrint("${news.isLike}");

    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: ListTile(
        leading: SizedBox(
          width: 80,
          height: 80,
          child: Image.network(
            news.image,
            fit: BoxFit.cover,
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
        trailing: BlocBuilder<AddDeleteNewsDataBaseCubit, AddDeleteNewsState>(
          builder: (context, state) {
            return IconButton(
              icon: news.isLike
                  ? Icon(Icons.thumb_up_alt, color: bluebright)
                  : const Icon(Icons.thumb_up_alt_outlined),
              onPressed: () {
                BlocProvider.of<AddDeleteNewsDataBaseCubit>(context)
                    .deleteDataDatabase(news);
                BlocProvider.of<FetchNewsDataBaseCubit>(context).fetchAllNews();
              },
            );
          },
        ),
      ),
    );
  }
}
