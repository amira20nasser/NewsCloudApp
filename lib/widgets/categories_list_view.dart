import 'package:flutter/material.dart';
import 'category_card.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key});
  final List<String> types = const [
    "General",
    "Business",
    "Entertainment",
    "Health",
    "Science",
    "Sports",
    "Technology",
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => CategoryCard(type: types[index]),
        itemCount: types.length,
        separatorBuilder: (context, index) => const SizedBox(width: 10),
      ),
    );
  }
}
