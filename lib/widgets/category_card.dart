import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/colors_const.dart';

import '../cubits/top_headlines_category_cubit/categories_states.dart';
import '../cubits/top_headlines_category_cubit/top_headlines_category_cubit.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.type,
  });

  final String type;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetTopHeadlinesCategory, CategoryState>(
      builder: (context, state) {
        return InkWell(
          onTap: () {
            GetTopHeadlinesCategory.get(context).onTap(type.toLowerCase());
          },
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: GetTopHeadlinesCategory.get(context).category ==
                      type.toLowerCase()
                  ? yankeesBlue
                  : Colors.white,
              border: Border.all(
                color: yankeesBlue,
                width: 2,
              ),
            ),
            child: Text(
              type,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    height: 1,
                    color: GetTopHeadlinesCategory.get(context).category ==
                            type.toLowerCase()
                        ? Colors.white
                        : yankeesBlue,
                  ),
            ),
          ),
        );
      },
    );
  }
}

// class CategoryCard extends StatelessWidget {
//   const CategoryCard({super.key, required this.category});
//   final CategoryModel category;
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) {
//               return CategoryArticlesView(category: category.type);
//             },
//           ),
//         );
//       },
//       child: Container(
//         width: 160,
//         decoration: BoxDecoration(
//           color: Colors.black,
//           image: DecorationImage(
//             image: AssetImage(category.pathImage),
//             fit: BoxFit.fill,
//           ),
//           borderRadius: BorderRadius.circular(8),
//         ),
//         child: Center(
//           child: Text(
//             category.type,
//             style: const TextStyle(
//               color: Colors.white,
//               fontSize: 16,
//               fontWeight: FontWeight.w700,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
