import 'package:flutter/material.dart';
import 'package:flutter_provider_ex/screens/home/components/content.dart';
import 'package:flutter_provider_ex/screens/home/components/header.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Header(), HomeContent()],
    );
  }
}
