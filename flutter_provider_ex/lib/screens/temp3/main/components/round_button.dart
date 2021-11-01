import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  RoundButton(
      {Key? key,
      required this.background,
      required this.iconWidget,
      this.width = 50,
      this.height = 50,
      required this.onPress})
      : super(key: key);

  final Color background;
  final Widget iconWidget;
  final double width, height;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.all(10),
      // margin: const EdgeInsets.all(25),
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: background,
      ),
      child: IconButton(onPressed: onPress, icon: iconWidget),
    );
  }
}
