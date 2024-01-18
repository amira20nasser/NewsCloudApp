import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/article_model.dart';
import '../../services/news_service.dart';
import 'categories_states.dart';

class GetTopHeadlinesCategory extends Cubit<CategoryState> {
  GetTopHeadlinesCategory() : super(BusinessState()) {
    // getNews(category: "general");
  }

  String category = "general";
  // Color color = Colors.white;

  Future<void> onTap(String category) async {
    debugPrint("in onTap Method $category");
    this.category = category;
    if (category.toLowerCase() == "general") {
      debugPrint(" emit TrendingState()");
      emit(TrendingState());
    } else if (category.toLowerCase() == "business") {
      debugPrint(" emit BusinessState()");
      emit(BusinessState());
    } else if (category.toLowerCase() == "entertainment") {
      debugPrint(" emit EntertainmentState()");
      emit(EntertainmentState());
    } else if (category.toLowerCase() == "health") {
      debugPrint(" emit HealthState()");
      emit(HealthState());
    } else if (category.toLowerCase() == "science") {
      debugPrint(" emit ScienceState()");
      emit(ScienceState());
    } else if (category.toLowerCase() == "technology") {
      debugPrint(" emit TechnologyState()");
      emit(TechnologyState());
    } else if (category.toLowerCase() == "sports") {
      debugPrint(" emit SportsState()");
      emit(SportsState());
    }
  }

  Future<List<ArticleModel>> getNews({required String category}) async {
    List<ArticleModel> articles = [];
    try {
      NewsService newsService = NewsService(Dio());

      articles = await newsService.getTopHeadlines(
        category: category.toLowerCase(),
        country: "us",
      );
      this.category = category.toLowerCase();

      // onTap(category);
      return articles;
    } catch (e) {
      emit(FaluireState());
      return articles;
    }
  }
}
