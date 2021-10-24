import 'package:flutter/material.dart';
import 'package:flutter_provider_ex/screens/contact/contact.dart';
import 'package:flutter_provider_ex/screens/details/detail.dart';
import 'package:flutter_provider_ex/screens/home1/home.dart';
import 'package:flutter_provider_ex/screens/login.dart';
import 'package:flutter_provider_ex/screens/main/main.dart';
import 'package:flutter_provider_ex/widgets/app_bar.dart';
import 'package:flutter_provider_ex/widgets/bottom_nav_bar.dart';

import 'widgets/sliver_appbar.dart';

class RouteManager {
  static const String loginScreen = '/';
  static const String homeScreen = '/home';
  static const String contactScreen = '/contact';
  static const String mainScreen = '/main';
  static const String detailScreen = '/detail';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    Map<dynamic, dynamic> parastr = {};
    return MaterialPageRoute(
      builder: (context) {
        parastr = _switchUI(settings, context);
        return scafFoldDefault(parastr);
      },
    );
  }

  static Map<dynamic, dynamic> _switchUI(
      RouteSettings settings, BuildContext context) {
    Map<dynamic, dynamic> parastr = {};
    final args = settings.arguments;
    switch (settings.name) {
      case loginScreen:
        parastr = {
          "widget": LoginScreen(argument: args),
        };
        break;
      case homeScreen:
        parastr = {
          "widget": HomeScreen1(),
          "appBar": buildAppBar(
            context,
            title: "Welcome Screen",
            leading: IconButton(
              onPressed: () {},
              icon: ClipOval(
                child: Image.asset("assets/images/menu.png"),
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .popAndPushNamed(RouteManager.loginScreen);
                },
                icon: Icon(Icons.logout),
              )
            ],
            automaticallyImplyLeading: false,
          )
        };
        break;
      case contactScreen:
        parastr = {
          "appBar": buildAppBar(
            context,
            title: "Contact Screen",
            actions: [
              IconButton(
                onPressed: () {},
                icon: Image.asset("assets/images/avatar.png"),
              )
            ],
            automaticallyImplyLeading: true,
          ),
          "widget": ContactScreen(),
        };
        break;
      case detailScreen:
        parastr = {
          "sliverAppBar": true,
          "appBar": buildSliverAppBar(
            context,
            title: "Detail Screen",
            actions: [
              IconButton(
                onPressed: () {},
                icon: Image.asset("assets/images/avatar.png"),
              )
            ],
            automaticallyImplyLeading: true,
          ),
          "widget": DetailScreen(
            argument: args,
          ),
        };
        break;
      case mainScreen:
        parastr = {
          "appBar": buildAppBar(
            context,
            title: "Main Screen",
            actions: [
              IconButton(
                onPressed: () {},
                icon: Image.asset("assets/images/avatar.png"),
              )
            ],
            automaticallyImplyLeading: true,
          ),
          "widget": MainScreen(),
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
      var appBar = parastr["appBar"];
      bool sliverAppBar = parastr["sliverAppBar"] ?? false;
      Widget widget = parastr["widget"];
      //Login Screen
      if (appBar == null) {
        result = Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: widget,
            ),
          ),
        );
      }
      //Logined Screen
      if (appBar != null) {
        result = Scaffold(
          extendBodyBehindAppBar: sliverAppBar,
          // key: context.read<MenuController>().scaffoldKey,
          // drawer: SideMenu(),
          appBar: sliverAppBar ? null : appBar,
          body: sliverAppBar
              ? CustomScrollView(
                  slivers: [
                    appBar,
                    SliverList(delegate: SliverChildListDelegate([widget]))
                  ],
                )
              : SafeArea(child: SingleChildScrollView(child: widget)),
          bottomNavigationBar: Container(
            height: 60,
            width: double.infinity,
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.symmetric(horizontal: 40),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  offset: Offset(0, 3),
                  color: Colors.black.withAlpha(20),
                )
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NavItem(
                  icon: "assets/icons/home.svg",
                  isActive: true,
                ),
                NavItem(
                  icon: "assets/icons/calendar.svg",
                  isActive: false,
                ),
                NavItem(
                  icon: "assets/icons/search.svg",
                  isActive: false,
                ),
                NavItem(
                  icon: "assets/icons/user.svg",
                  isActive: false,
                ),
              ],
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
