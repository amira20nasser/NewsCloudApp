import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../colors_const.dart';
import '../cubits/get_everything_cubit/get_everything_news_cubit.dart';
import '../widgets/everything_news_list_future_builder.dart';

List<String> sortBy = ["relevancy", "popularity", "publishedAt"];

class NewsView extends StatelessWidget {
  const NewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetEverythingNewsCubit(),
      child: Builder(builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Container(
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
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    PopupMenuButton(
                      icon: const Icon(Icons.swap_vert_rounded),
                      // initialValue:
                      //     BlocProvider.of<GetEverythingNewsCubit>(context)
                      //         .sortBy,
                      onSelected: (value) {
                        BlocProvider.of<GetEverythingNewsCubit>(context)
                            .onTap(value);
                        debugPrint(
                            "tap in news view ${BlocProvider.of<GetEverythingNewsCubit>(context).sortBy}");
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
              ),
              const Expanded(
                child: EverythingNewsListFutureBuilder(),
              ),
            ],
          ),
        );
      }),
    );
  }
}
