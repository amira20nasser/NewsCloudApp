import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:news_app/const.dart';
import 'package:news_app/models/article_model.dart';
import 'add_delete_news_states.dart';

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
    var newsBox = Hive.box<ArticleModel>(kNewsBox);
    List<ArticleModel> articlesdatabase = newsBox.values.toList();

    bool found = articlesdatabase.any(
      (element) =>
          element.title == article.title &&
          element.description == article.description &&
          element.author == article.author &&
          element.image == article.image &&
          element.urlArticle == article.urlArticle &&
          element.isLike == article.isLike,
    );
    if (found) {
      articlesdatabase
          .firstWhere((element) => element.title == article.title)
          .delete();
      print(" identical ${article.title}  ${article.isLike}");
    } else {
      print(" not identical  ${article.title}  ${article.isLike}");
    }

    article.isLike = false;
    debugPrint("press to dislike");
    // article.delete();

    emit(DeleteNewsSuccess());
    return;
  }
}
