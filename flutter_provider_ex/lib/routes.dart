import 'package:flutter/material.dart';
import 'package:flutter_provider_ex/controllers/login_controller.dart';
import 'package:flutter_provider_ex/screens/contact/contact.dart';
import 'package:flutter_provider_ex/screens/home/home.dart';
import 'package:flutter_provider_ex/screens/login.dart';

import 'package:flutter_provider_ex/constrants.dart';
import 'package:provider/provider.dart';

class RouteManager {
  static const String loginScreen = '/';
  static const String homeScreen = '/home';
  static const String contactScreen = '/contact';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    Map<dynamic, dynamic> parastr = {};
    return MaterialPageRoute(
      builder: (context) {
        parastr = _switchUI(settings);
        return scafFoldDefault(parastr);
      },
    );
  }

  static Map<dynamic, dynamic> _switchUI(RouteSettings settings) {
    Map<dynamic, dynamic> parastr = {};
    switch (settings.name) {
      case loginScreen:
        parastr = {
          "appBar": {
            "title": "",
            "automaticallyImplyLeading": true,
          },
          "widget": LoginScreen(parastr: configPara)
        };
        break;
      case homeScreen:
        parastr = {
          "appBar": {
            "title": "Home Screen",
            "automaticallyImplyLeading": false,
          },
          "widget": HomeScreen(),
        };
        break;
      case contactScreen:
        parastr = {
          "appBar": {
            "title": "Contact Screen",
            "automaticallyImplyLeading": true,
          },
          "widget": ContactScreen(),
        };
        break;
      default:
        throw const FormatException('khong tim thay giao dien tuong uong');
    }
    return parastr;
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
