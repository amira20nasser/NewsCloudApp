import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:awesome_bottom_bar/widgets/inspired/inspired.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../colors_const.dart';
import '../const.dart';
import '../cubits/get_index_tab_cubit/get_index_tab_cubit.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
  }
}
