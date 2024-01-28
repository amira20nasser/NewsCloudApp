import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:news_app/cubits/add_delete_news_database/add_delete_news_database.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/theme.dart';
import 'package:news_app/views/controller_view.dart';
import 'bloc_observer.dart';
import 'const.dart';
import 'cubits/fetch_new_database/fetch_news_database.dart';
import 'cubits/get_index_tab_cubit/get_index_tab_cubit.dart';

void main() async {
  await Hive.initFlutter();
  Bloc.observer = SimpleBlocObserver();
  Hive.registerAdapter(ArticleModelAdapter());

  await Hive.openBox<ArticleModel>(kNewsBox);
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetIndexTabCubit(),
        ),
        BlocProvider(
          create: (context) => AddDeleteNewsDataBaseCubit(),
        ),
        BlocProvider(
          create: (context) => FetchNewsDataBaseCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'News App',
        theme: theme,
        home: const ControllerView(),
      ),
    );
  }
}
