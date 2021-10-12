import 'package:flutter/material.dart';
import 'package:flutter_provider_ex/screens/contact/contact.dart';
import 'package:flutter_provider_ex/screens/home/home.dart';
import 'package:flutter_provider_ex/screens/login.dart';

class RouteManager {
  static var parastr1 = {};
  static const String loginScreen = '/';
  static const String homeScreen = '/home';
  static const String contactScreen = '/contact';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    var dataSend;
    if (settings.arguments != null) {
      dataSend = settings.arguments as Map<dynamic, dynamic>;
    }
    switch (settings.name) {
      case loginScreen:
        Map<dynamic, dynamic> parastr = {
          "appBar": {
            "title": "",
            "automaticallyImplyLeading": true,
          },
          "widget": LoginScreen()
        };
        return MaterialPageRoute(
            builder: (context) => scafFoldDefault(parastr));
      case homeScreen:
        Map<dynamic, dynamic> parastr = {
          "appBar": {
            "title": "Home Screen",
            "automaticallyImplyLeading": false,
          },
          "widget": HomeScreen(parastr: dataSend),
        };
        return MaterialPageRoute(
            builder: (context) => scafFoldDefault(parastr));
      case contactScreen:
        Map<dynamic, dynamic> parastr = {
          "appBar": {
            "title": "Contact Screen",
            "automaticallyImplyLeading": true,
          },
          "widget": ContactScreen(),
        };
        return MaterialPageRoute(
            builder: (context) => scafFoldDefault(parastr));
      default:
        throw const FormatException('khong tim thay giao dien tuong uong');
    }
  }

  static Widget scafFoldDefault(parastr) {
    Widget result = Container();
    try {
      String titleAppBar = parastr["appBar"]["title"];
      bool automaticallyImplyLeading =
          parastr["appBar"]["automaticallyImplyLeading"];
      Widget widget = parastr["widget"];
      if (titleAppBar.isEmpty) {
        result = Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(10),
              child: widget,
            ),
          ),
        );
      }
      if (titleAppBar.isNotEmpty) {
        result = Scaffold(
          appBar: AppBar(
            title: Text(titleAppBar),
            automaticallyImplyLeading: automaticallyImplyLeading,
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(10),
              child: widget,
            ),
          ),
        );
      }
    } catch (e) {
      print(e);
    }
    return result;
  }
}
