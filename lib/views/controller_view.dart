import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:awesome_bottom_bar/widgets/inspired/inspired.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/views/search_view.dart';
import '../colors_const.dart';
import '../cubits/get_index_tab_cubit/get_index_tab_cubit.dart';
import '../cubits/get_index_tab_cubit/get_index_tab_states.dart';
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
        title: Row(
          children: [
            // child: RichText(
            //   text: TextSpan(
            //     text: "News",
            //     style: const TextStyle(
            //       color: Colors.black,
            //       fontWeight: FontWeight.bold,
            //       fontSize: 27,
            //     ),
            //     children: [
            //       TextSpan(
            //         text: "Cloud",
            //         style: TextStyle(
            //           color: bluebright,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            const Text(
              "News",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 27,
              ),
            ),
            AnimatedTextKit(
              repeatForever: true,
              pause: const Duration(seconds: 180),
              animatedTexts: [
                ColorizeAnimatedText(
                  "Cloud",
                  speed: const Duration(milliseconds: 400),
                  textStyle: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 27,
                  ),
                  colors: [
                    yankeesBlue,
                    semonDark,
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      //bloclistener
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
      bottomNavigationBar: BlocConsumer<GetIndexTabCubit, NavigationState>(
        listener: (context, state) {},
        builder: (context, state) {
          return BottomBarInspiredInside(
            items: bottomNavItems,
            backgroundColor: bluebright,
            color: semonBright,
            iconSize: 18,
            height: 40,
            colorSelected: Colors.black,
            indexSelected: BlocProvider.of<GetIndexTabCubit>(context).index,
            onTap: (int index) => BlocProvider.of<GetIndexTabCubit>(context)
                .getCurrentIndexTab(NavigationTab.values[index]),
            chipStyle: ChipStyle(
              isHexagon: true,
              background: semonDark,
            ),
            itemStyle: ItemStyle.hexagon,
            animated: true,
          );
        },
      ),
    );
  }
}

const List<TabItem> bottomNavItems = [
  TabItem(
    icon: Icons.trending_up,
    title: 'Trendy',
  ),
  TabItem(
    icon: Icons.newspaper_sharp,
    title: 'News',
  ),
  TabItem(
    icon: Icons.search_sharp,
    title: 'Search',
  ),
  TabItem(
    icon: Icons.thumb_up_alt,
    title: 'Liked',
  ),
  TabItem(
    icon: Icons.settings,
    title: 'Settings',
  ),
];
