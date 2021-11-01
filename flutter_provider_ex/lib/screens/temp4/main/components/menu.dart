import 'package:flutter/material.dart';
import 'package:flutter_provider_ex/constrants.dart';

class Menu extends StatelessWidget {
  Menu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      height: 60,
      decoration: BoxDecoration(
        // border: Border.all(color: Colors.amber),
        color: kPrimaryColor1,
      ),
      child: IconButton(
        onPressed: () {},
        icon: Image.asset(
          "assets/images/menu.png",
          color: Colors.white,
        ),
      ),
    );
  }
}
