import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_provider_ex/screens/contact/contact.dart';
import 'package:flutter_provider_ex/screens/temp1/detail1/detail.dart';
import 'package:flutter_provider_ex/screens/temp1/home1/home.dart';
import 'package:flutter_provider_ex/screens/temp1/main1/main.dart';
import 'package:flutter_provider_ex/screens/temp2/home2/home2.dart';
import 'package:flutter_provider_ex/screens/login.dart';
import 'package:flutter_provider_ex/screens/temp2/main2/main2.dart';
import 'package:flutter_provider_ex/screens/temp3/main/main3.dart';
import 'package:flutter_provider_ex/screens/temp4/detail/detail.dart';
import 'package:flutter_provider_ex/screens/temp4/main/main4.dart';
import 'package:flutter_provider_ex/screens/temp5/main/main.dart';
import 'package:flutter_provider_ex/screens/temp6/main/main.dart';
import 'package:flutter_provider_ex/widgets/app_bar.dart';
import 'package:flutter_provider_ex/widgets/bottom_nav_bar.dart';
import 'package:get/get.dart';

import 'widgets/sliver_appbar.dart';

class RouteManager {
  static const String loginScreen = '/';
  static const String homeScreen = '/home';
  static const String contactScreen = '/contact';
  static const String mainScreen = '/main';
  static const String detailScreen = '/detail';
  static const String detailScreen4 = '/detail4';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) {
        return _switchUI(settings, context);
      },
    );
  }

  static Widget _switchUI(RouteSettings settings, BuildContext context) {
    final args = settings.arguments;
    Widget _result = Container();
    switch (settings.name) {
      case loginScreen:
        _result = scafFoldDefault(widget: MainScreen5());
        // _result = scafFoldDefault(widget: LoginScreen(argument: args));
        break;
      case homeScreen:
        _result = scafFoldDefault(
          widget: HomeScreen2(),
          appBar: buildAppBar(
            context,
            title: "Welcome Screen 2",
            leading: IconButton(
              onPressed: () {},
              icon: ClipOval(
                child: Image.asset("assets/images/menu.png"),
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Get.deleteAll();
                  Navigator.of(context)
                      .popAndPushNamed(RouteManager.loginScreen);
                },
                icon: Icon(Icons.logout),
              )
            ],
            automaticallyImplyLeading: false,
          ),
        );
        break;
      case contactScreen:
        _result = scafFoldDefault(
          widget: ContactScreen(),
          appBar: buildAppBar(
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
        );
        break;
      case detailScreen:
        _result = scafFoldDefault(
          sliverAppBar: true,
          widget: DetailScreen(argument: args),
          appBar: buildSliverAppBar(
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
        );
        break;
      case detailScreen4:
        _result = scafFoldDefault(widget: DetailScreen4(argument: args));
        break;
      case mainScreen:
        _result = scafFoldDefault(
          widget: MainScreen(),
          appBar: buildAppBar(
            context,
            title: "Main Screen 222",
            actions: [
              IconButton(
                onPressed: () {},
                icon: Image.asset("assets/images/avatar.png"),
              )
            ],
            automaticallyImplyLeading: true,
          ),
        );
        break;
      default:
        throw const FormatException('khong tim thay giao dien tuong uong');
    }
    return _result;
  }

  static Widget scafFoldDefault({
    required Widget widget,
    appBar,
    bool sliverAppBar = false,
  }) {
    Widget result = Container();
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
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.symmetric(horizontal: 40),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                offset: const Offset(0, 3),
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
        // bottomNavigationBar: ConvexAppBar(
        //   style: TabStyle.react,
        //   items: const [
        //     TabItem(icon: Icons.home, title: 'Home'),
        //     TabItem(icon: Icons.map, title: 'Discovery'),
        //     TabItem(icon: Icons.add, title: 'Add'),
        //     TabItem(icon: Icons.message, title: 'Message'),
        //     TabItem(icon: Icons.people, title: 'Profile'),
        //   ],
        //   initialActiveIndex: 2, //optional, default as 0
        //   onTap: (int i) => print('click index=$i'),
        // ),
      );
    }
    return result;
  }
}
