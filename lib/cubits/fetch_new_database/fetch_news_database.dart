import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

import '../../const.dart';
import '../../models/article_model.dart';
import 'fetch_news_state.dart';

class FetchNewsDataBaseCubit extends Cubit<FetchNewsState> {
  FetchNewsDataBaseCubit() : super(FetchNewsInitial());

  List<ArticleModel>? articles;
  fetchAllNews() {
    var notesBox = Hive.box<ArticleModel>(kNewsBox);
    debugPrint("FETCHHHHH from database!!!!!!!!!");
    articles = notesBox.values.toList();
    if (articles?.isEmpty ?? true) {
      emit(NoNews());
    }
    emit(FetchNewsSuccess());
  }
}
