import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';

import '../colors_const.dart';
import '../widgets/body_news_widget.dart';
import '../widgets/header_news_widget.dart';

class NewsDetailsView extends StatelessWidget {
  const NewsDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    ArticleModel news =
        ModalRoute.of(context)!.settings.arguments as ArticleModel;
    bool validURL = Uri.parse(news.image).isAbsolute;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: NetworkImage(news.image, scale: 1.0),
          fit: BoxFit.cover,
          opacity: 0.3,
        ),
      ),
      child: Scaffold(
        backgroundColor: !validURL ? yankeesBlue : Colors.transparent,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leading: IconButton(
            style: IconButton.styleFrom(
              backgroundColor: semonBright.withOpacity(0.3),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            icon: const Icon(
              Icons.arrow_back,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: ListView(
          children: const [
            HeaderNewsWidget(),
            BodyNewsWidget(),
          ],
        ),
      ),
    );
  }
}
