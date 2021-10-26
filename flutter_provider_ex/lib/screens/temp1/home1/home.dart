import 'package:flutter/material.dart';
import 'package:flutter_provider_ex/constrants.dart';
import 'package:flutter_provider_ex/routes.dart';
import 'package:flutter_provider_ex/screens/home/components/content.dart';
import 'package:flutter_provider_ex/screens/home/components/header.dart';
import 'package:flutter_provider_ex/screens/temp1/home1/components/welcome_button.dart';
import 'package:flutter_provider_ex/screens/temp1/home1/components/welcome_text.dart';

import 'components/top_banner.dart';

class HomeScreen1 extends StatelessWidget {
  var parastr = {};
  HomeScreen1({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Column(
      children: [
        TopBanner(),
        WelcomeText(),
      ],
    );
  }
}
