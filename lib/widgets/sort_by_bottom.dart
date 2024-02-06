import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../colors_const.dart';
import '../cubits/get_everything_cubit/get_everything_news_cubit.dart';
import '../views/news_view.dart';

class SortByButton extends StatefulWidget {
  const SortByButton({
    super.key,
  });

  @override
  State<SortByButton> createState() => _SortByButtonState();
}

class _SortByButtonState extends State<SortByButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        color: Colors.white,
        border: Border.all(
          color: bluebright,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PopupMenuButton(
            icon: const Icon(Icons.swap_vert_rounded),
            initialValue:
                BlocProvider.of<GetEverythingNewsCubit>(context).sortBy,
            onSelected: (value) {
              GetEverythingNewsCubit.get(context).onTap(value);
              setState(() {});
            },
            itemBuilder: (context) {
              return <PopupMenuEntry>[
                PopupMenuItem(
                  value: sortBy[0],
                  child: const Text('relevancy at palestine'),
                ),
                PopupMenuItem(
                  value: sortBy[1],
                  child: const Text('popularity'),
                ),
                PopupMenuItem(
                  value: sortBy[2],
                  child: const Text('Newest News'),
                ),
              ];
            },
          ),
          const Text("Sort by"),
        ],
      ),
    );
  }
}
