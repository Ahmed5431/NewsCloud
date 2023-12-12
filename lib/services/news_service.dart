import 'package:dio/dio.dart';
import 'package:flutter_news/models/article_model.dart';

class NewsService {
  final dio = Dio();
  Future<List<ArticleModel>> getGeneralNews({required String category}) async {
    try {
      var response = await dio.get(
          "https://newsapi.org/v2/top-headlines?country=us&apiKey=ab332e8e66ba4a1fb300808c861c6a6a&category=$category");

      Map<String, dynamic> jsonData = response.data;

      List<dynamic> articles = jsonData['articles'];

      List<ArticleModel> articleslist = [];

      for (var article in articles) {
        ArticleModel articlemodel = ArticleModel.fromjson(article);
        articleslist.add(articlemodel);
      }
      return articleslist;
    } catch (e) {
      return [];
    }
  }

  Future<List<ArticleModel>> getSliderNews() async {
    try {
      var response = await dio.get(
          "https://newsapi.org/v2/top-headlines?sources=abc-news&apiKey=ab332e8e66ba4a1fb300808c861c6a6a");

      Map<String, dynamic> jsonData = response.data;

      List<dynamic> articles = jsonData['articles'];

      List<ArticleModel> articleslist = [];

      for (var article in articles) {
        ArticleModel articlemodel = ArticleModel.fromjson(article);
        articleslist.add(articlemodel);
      }
      return articleslist;
    } catch (e) {
      return [];
    }
  }
}
