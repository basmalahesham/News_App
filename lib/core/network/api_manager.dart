import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/models/articals_model.dart';
import 'package:news_app/models/source_model.dart';

class ApiManager {
  static const String apiKey = "fa8b144e12144c6d9ebdb47010053bf5";
  static const String baseUrl = "newsapi.org";

  // domain              /endPoint               ? query parameters
  // https://newsapi.org/v2/top-headlines/sources?apiKey=fa8b144e12144c6d9ebdb47010053bf5&category=sports

  static Future<SourceModel> fetchSources(String category) async {
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

    var sourceData = SourceModel.fromJson(jsonDecode(response.body));
    debugPrint(response.body);
    if (response.statusCode == 200 &&
        jsonDecode(response.body)["status"] == "ok") {
      return sourceData;
    } else {
      throw Exception('Failed to load sources');
    }
  }

  static Future<ArticalsModel> fetchArticals(String sourceId) async {
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

    ArticalsModel articalsModel =
        ArticalsModel.fromJson(jsonDecode(response.body));

    log(response.body);

    return articalsModel;
  }
}
