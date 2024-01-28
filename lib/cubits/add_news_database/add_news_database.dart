import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:news_app/const.dart';
import 'package:news_app/models/article_model.dart';
import 'add_news_states.dart';

class AddDeleteNewsDataBaseCubit extends Cubit<AddDeleteNewsState> {
  AddDeleteNewsDataBaseCubit() : super(AddNewsInitial());

  addDataDatabase(ArticleModel article) async {
    article.isLike = true;
    emit(AddNewsLoading());
    try {
      var newsBox = Hive.box<ArticleModel>(kNewsBox);
      await newsBox.add(article);
      debugPrint("save in database liked news");

      emit(AddNewsSuccess());
    } catch (e) {
      emit(AddNewsFailure(e.toString()));
    }
  }

  deleteDataDatabase(ArticleModel article) {
    article.isLike = false;
    debugPrint("press to dislike");
    article.delete();

    emit(DeleteNewsSuccess());
    return;
  }
}
