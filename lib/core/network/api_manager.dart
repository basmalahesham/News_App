import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:news_app/models/article_model.dart';
import 'package:news_app/models/source_model.dart';

class ApiManager {
  static const String apiKey = "fa8b144e12144c6d9ebdb47010053bf5";
  static const String baseUrl = "newsapi.org";

  // domain              /endPoint               ? query parameters
  // https://newsapi.org/v2/top-headlines/sources?apiKey=fa8b144e12144c6d9ebdb47010053bf5&category=sports

  static Future<List<SourceModel>> fetchSources(String category) async {
    // query parameters
    var query = {
      "apiKey": apiKey,
      "category": category,
    };
    final response = await http.get(
      Uri.https(
        baseUrl, // domain
        '/v2/top-headlines/sources', // endPoint
        query, // query parameters
      ),
    );

    List<SourceModel> sourcesDataList = [];
    if (response.statusCode == 200 &&
        jsonDecode(response.body)["status"] == "ok") {
      var data = jsonDecode(response.body);
      List sourcesList = data["sources"];
      for (var element in sourcesList) {
        sourcesDataList.add(SourceModel.fromJson(element));
      }
      return sourcesDataList;
    } else {
      throw Exception('Failed to load sources');
    }
  }

  static Future<List<ArticleModel>> fetchArticals(String sourceId) async {
    Map<String, dynamic>? queryParameters = {
      "apiKey": apiKey,
      "sources": sourceId,
    };

    Uri uri = Uri.https(
      baseUrl,
      "/v2/top-headlines",
      queryParameters,
    );

    var response = await http.get(uri);

    List<ArticleModel> articlesList = [];

    log(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List articles = data["articles"];

      for (var element in articles) {
        articlesList.add(
          ArticleModel.fromJson(element),
        );
      }
      return articlesList;
    } else {
      throw Exception("Error fetch data articles: ");
    }
  }
}
