import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/views/search_view.dart';
import '../cubits/get_index_tab_cubit/get_index_tab_cubit.dart';
import '../cubits/get_index_tab_cubit/get_index_tab_states.dart';
import '../widgets/custom_nav_bar.dart';
import '../widgets/title_of_app_bar.dart';
import 'home_view.dart';
import 'liked_news_view.dart';
import 'news_view.dart';

class ControllerView extends StatelessWidget {
  const ControllerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Icon(Icons.search),
          SizedBox(width: 15),
          Icon(
            Icons.notifications,
          ),
          SizedBox(width: 20),
        ],
        centerTitle: false,
        title: const TitleOfAppBar(),
      ),
      bottomNavigationBar: BlocConsumer<GetIndexTabCubit, NavigationState>(
        listener: (context, state) {},
        builder: (context, state) {
          //don't add constant
          return CustomBottomNavigationBar();
        },
      ),
      body: BlocBuilder<GetIndexTabCubit, NavigationState>(
        builder: (context, state) {
          if (state is NewsTabState) {
            //don't add constant
            return NewsView();
          }
          if (state is SearchTabState) {
            return const SearchView();
          }
          if (state is LikedTabState) {
            //don't add constant

            return LikedNewsView();
          }
          if (state is SettingTabState) {
            return const Text("settings");
          }
          return const HomeView();
        },
      ),
    );
  }
}
