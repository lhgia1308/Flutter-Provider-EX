import 'dart:convert';

import 'package:flutter_provider_ex/models/article.dart';
import 'package:http/http.dart' as http;

class API_Manager {
  Future<Article> getNews() async {
    var client = http.Client();
    var article = null;
    try {
      final Uri url = Uri.parse(
          "https://newsapi.org/v2/everything?q=tesla&from=2021-10-04&sortBy=publishedAt&apiKey=16cf1cb0bb9e4c6187791b1c21869a34");
      var response = await client.get(url);
      // var url =
      //     Uri.https('www.googleapis.com', '/books/v1/volumes', {'q': '{http}'});

      // // Await the http get response, then decode the json-formatted response.
      // var response = await http.get(url);
      if (response.statusCode == 200) {
        var jsonStr = response.body;
        var jsonMap = json.decode(jsonStr);
        article = Article.fromJson(jsonMap);
      }
    } catch (e) {
      print("Error: " + e.toString());
      client.close();
    }
    return article;
  }
}
