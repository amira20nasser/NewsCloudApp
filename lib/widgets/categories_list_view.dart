import 'package:flutter/material.dart';
import 'category_card.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key});
  // final List<CategoryModel> categories = const [
  //   CategoryModel(type: "Business", pathImage: "assets/business.avif"),
  //   CategoryModel(type: "Entertainment", pathImage: "assets/entertaiment.avif"),
  //   CategoryModel(type: "General", pathImage: "assets/general.avif"),
  //   CategoryModel(type: "Health", pathImage: "assets/health.avif"),
  //   CategoryModel(type: "Science", pathImage: "assets/science.avif"),
  //   CategoryModel(type: "Sports", pathImage: "assets/sports.avif"),
  //   CategoryModel(type: "Technology", pathImage: "assets/technology.jpeg"),
  // ];
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
        // CategoryCard(
        //   category: categories[index],
        // ),
        itemCount: types.length,
        separatorBuilder: (context, index) => const SizedBox(width: 10),
      ),
    );
  }
}
