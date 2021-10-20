import 'package:flutter/material.dart';

class TopBanner extends StatelessWidget {
  TopBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Container(
      height: _size.height * 0.5,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        child: Image.asset(
          "assets/images/welcome.jpg",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
