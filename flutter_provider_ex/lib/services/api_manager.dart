import 'dart:convert';

import 'package:flutter/animation.dart';
import 'package:flutter_provider_ex/controllers/get_controller.dart';
import 'package:flutter_provider_ex/models/article.dart';
import 'package:flutter_provider_ex/models/trip.dart';
import 'package:http/http.dart' as http;

class API_Manager extends GetController {
  late Article article;
  int amountOfPerPage = 10;

  Future<Article> getNews(
      {bool pagination = false, int currentPage = 1}) async {
    var client = http.Client();
    try {
      final Uri url = Uri.parse(
          "https://newsapi.org/v2/everything?q=tesla&from=2021-10-06&sortBy=publishedAt&apiKey=16cf1cb0bb9e4c6187791b1c21869a34");
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
          var end = currentPage * amountOfPerPage;
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

  Trip? trip;
  int currentPage = 1;
  bool tripResult = false;

  Future<bool> getTrips({bool refresh = false}) async {
    var client = http.Client();
    try {
      if (refresh) {
        currentPage = 1;
      }
      var url = Uri.parse(
          "https://api.instantwebtools.net/v1/passenger?page=${currentPage}&size=10");

      var response = await client.get(url);
      if (response.statusCode == 200) {
        trip = tripFromJson(response.body);
        currentPage++;
        tripResult = true;
      }
    } catch (e) {
      print("Error getTrips: ${e.toString()}");
      client.close();
    }
    update();
    return tripResult;
  }
}
