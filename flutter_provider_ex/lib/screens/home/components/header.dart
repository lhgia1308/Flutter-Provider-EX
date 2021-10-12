import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  var parastr = {};
  Header({Key? key, required this.parastr}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        "Header",
        style: parastr['textStyleDefault'],
      ),
    );
  }
}
