import 'package:flutter/material.dart';
import 'package:flutter_provider_ex/models/article.dart';
import 'package:flutter_provider_ex/services/api_manager.dart';

class MainScreen5 extends StatefulWidget {
  const MainScreen5({Key? key}) : super(key: key);

  @override
  State<MainScreen5> createState() => _MainScreen5State();
}

class _MainScreen5State extends State<MainScreen5> {
  late Future<Article> _newModel;
  @override
  void initState() {
    _newModel = API_Manager().getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Main Screen 5"),
    );
  }
}
