import 'package:flutter/material.dart';
import 'package:flutter_provider_ex/screens/home/components/content.dart';
import 'package:provider/provider.dart';

import 'models/cart.dart';
import 'models/catalog.dart';
import 'models/routes.dart';
import 'screens/home/home.dart';
import 'screens/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "fontFamily"),
      debugShowCheckedModeBanner: false,
      initialRoute: RouteManager.loginScreen,
      onGenerateRoute: RouteManager.generateRoute,
    );
  }
}
