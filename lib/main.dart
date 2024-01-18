import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/theme.dart';
import 'package:news_app/views/controller_view.dart';

import 'cubits/get_index_tab_cubit/get_index_tab_cubit.dart';

void main() {
  runApp(const NewsApp());
}

//Like and store in  local storage
//make animation in listview
//make webview on click on news
class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIndexTabCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'News App',
        theme: theme,
        home: const ControllerView(),
      ),
    );
  }
}
