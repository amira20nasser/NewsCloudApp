import 'package:news_app/models/article_model.dart';

abstract class FetchNewsState {}

class FetchNewsInitial extends FetchNewsState {}

class FetchNewsSuccess extends FetchNewsState {}

class NoNews extends FetchNewsState {}
