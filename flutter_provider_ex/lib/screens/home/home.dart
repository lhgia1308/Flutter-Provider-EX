import 'package:flutter/material.dart';
import 'package:flutter_provider_ex/screens/home/components/content.dart';
import 'package:flutter_provider_ex/screens/home/components/header.dart';

class HomeScreen extends StatelessWidget {
  var parastr = {};
  HomeScreen({Key? key, required this.parastr}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Header(parastr: parastr), HomeContent(parastr: parastr)],
    );
  }
}
