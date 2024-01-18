import 'package:flutter/material.dart';

import '../widgets/news_list_view_builder.dart';

class CategoryArticlesView extends StatelessWidget {
  const CategoryArticlesView({super.key, required this.category});
  final String category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 201, 184, 32),
        centerTitle: true,
        title: Text("$category News"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(
          slivers: [
            NewsFutureBuilder(category: category),
          ],
        ),
      ),
    );
  }
}
