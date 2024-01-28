import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/article_model.dart';
import '../../services/remote/news_service.dart';
import 'get_everything_news_states.dart';

class GetEverythingNewsCubit extends Cubit<EverthingNewsState> {
  GetEverythingNewsCubit() : super(LoadedEverthingNewsState());
  void onTap(String sortBy) {
    this.sortBy = sortBy;
    emit(LoadedEverthingNewsState());
  }

  String sortBy = "popularity";
  Future<List<ArticleModel>> getNews({String? sortBy}) async {
    debugPrint("GetEverythingNewsCubit calling getNews sortby $sortBy ");
    List<ArticleModel> articles = [];
    try {
      NewsService newsService = NewsService(Dio());
      articles = await newsService.getEverything(
        country: "us",
        language: "en",
        q: "palestine", //required parameter
        sortBy: sortBy ?? this.sortBy,
      );
      if (sortBy != null) this.sortBy = sortBy;
      // emit(LoadedEverthingNewsState()); //!!That's was the logic error you was emit twice (ontap function and here)
    } catch (e) {
      emit(EverthingNewsFailureState());
    }
    return articles;
  }
}
