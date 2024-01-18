import 'package:flutter_bloc/flutter_bloc.dart';

import 'get_index_tab_states.dart';

enum NavigationTab { home, news, search, liked, setting }

class GetIndexTabCubit extends Cubit<NavigationState> {
  GetIndexTabCubit() : super(HomeTabState());
  int index = 0;
  getCurrentIndexTab(NavigationTab tab) {
    if (tab == NavigationTab.home) {
      index = 0;
      emit(HomeTabState());
    } else if (tab == NavigationTab.news) {
      index = 1;
      emit(NewsTabState());
    } else if (tab == NavigationTab.search) {
      index = 2;
      emit(SearchTabState());
    } else if (tab == NavigationTab.liked) {
      index = 3;
      emit(LikedTabState());
    } else if (tab == NavigationTab.setting) {
      index = 4;
      emit(SettingTabState());
    }
  }
}
