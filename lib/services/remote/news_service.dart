import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:news_app/api_constants.dart';
import 'package:news_app/models/article_model.dart';

import '../../const.dart';

class NewsService {
  final Dio dio;

  NewsService(this.dio);

  Future<List<ArticleModel>> getTopHeadlines({
    required String country,
    required String category,
  }) async {
    try {
      Response response = await dio.get(
        APIConstants.baseURL + APIConstants.topHeadlinesEndPoint,
        queryParameters: {
          "apiKey": APIConstants.apiKey,
          "country": country,
          "category": category,
        },
      );
      //map
      Map<String, dynamic> jsonData = response.data;
      List<dynamic> articles = jsonData['articles'];
      List<ArticleModel> articlesList = [];
      for (var article in articles) {
        // if (article['urlToImage'] != null &&
        //     article['title'] != null &&
        //     article['description'] != null) {
        var notesBox = Hive.box<ArticleModel>(kNewsBox);

        List<ArticleModel> articlesdatabase = notesBox.values.toList();
        bool isliked = false;
        for (var ele in articlesdatabase) {
          if (article['title'] == ele.title) {
            isliked = true;
            break;
          }
        }
        ArticleModel articleModel = ArticleModel(
          image: article['urlToImage'] ?? "",
          title: article['title'] ?? "",
          description: article['description'] ?? "",
          author: article['author'] ?? "",
          urlArticle: article['url'],
          isLike: isliked,
        );
        articlesList.add(articleModel);
        // }
      }
      debugPrint(
          "!!!!!articles getTopHeadlines: ${articlesList.first} $category");
      return articlesList;
    } catch (e) {
      debugPrint("ERROR getTopHeadlines $e");
      throw Exception(e);
      // return [];
    }
  }

  Future<List<ArticleModel>> getEverything({
    required String country,
    required String language,
    required String sortBy,
    //query for seaching
    String? q,
  }) async {
    try {
      Response response = await dio.get(
        APIConstants.baseURL + APIConstants.everythingEndPoint,
        queryParameters: {
          "apiKey": APIConstants.apiKey,
          "language": language,
          "sortBy": sortBy,
          "q": q,
        },
      );
      //map
      Map<String, dynamic> jsonData = response.data;
      List<dynamic> articles = jsonData['articles'];
      List<ArticleModel> articlesList = [];
      var notesBox = Hive.box<ArticleModel>(kNewsBox);

      List<ArticleModel> articlesdatabase = notesBox.values.toList();
      for (var article in articles) {
        ArticleModel articleModel = ArticleModel(
          image: article['urlToImage'] ?? "",
          title: article['title'] ?? "",
          description: article['description'] ?? "",
          author: article['author'] ?? "",
          urlArticle: article['url'],
        );
        bool found = articlesdatabase
            .any((element) => element.title == articleModel.title);
        if (found) {
          print(" the !! ${articleModel.title}");
          articleModel.isLike = true;
        }
        articlesList.add(articleModel);
        // }
      }
      debugPrint("!!!!!articles getEverything: ${articlesList.first}");
      return articlesList;
    } catch (e) {
      debugPrint("ERROR getEverything $e");
      throw Exception(e);
    }
  }
}
//screen for news
// icon sort by
//screen for news advertisement detials
//  button go to the original website
//  details of app
