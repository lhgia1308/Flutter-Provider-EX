import 'dart:convert';

import 'package:flutter/animation.dart';
import 'package:flutter_provider_ex/models/article.dart';
import 'package:http/http.dart' as http;

class API_Manager {
  late Article article;
  int amountOfPerPage = 10;

  Future<Article> getNews(
      {bool pagination = false, int currentPage = 1}) async {
    var client = http.Client();
    try {
      final Uri url = Uri.parse(
          "https://newsapi.org/v2/everything?q=tesla&from=2021-10-05&sortBy=publishedAt&apiKey=16cf1cb0bb9e4c6187791b1c21869a34");
      var response = await client.get(url);
      // var url =
      //     Uri.https('www.googleapis.com', '/books/v1/volumes', {'q': '{http}'});

      // // Await the http get response, then decode the json-formatted response.
      // var response = await http.get(url);
      if (response.statusCode == 200) {
        var jsonStr = response.body;
        var jsonMap = json.decode(jsonStr);
        article = Article.fromJson(jsonMap);
        if (pagination) {
          var totalPage = (article.totalResults / amountOfPerPage).ceil();
          print("totalPage: ${totalPage}");
          var begin = (currentPage - 1) * amountOfPerPage;
          var end = currentPage * amountOfPerPage - 1;
          var articles = article.articles.sublist(begin, end);
          article.articles = articles;
        }
      }
    } catch (e) {
      print("Error: " + e.toString());
      client.close();
    }
    return article;
  }
}
