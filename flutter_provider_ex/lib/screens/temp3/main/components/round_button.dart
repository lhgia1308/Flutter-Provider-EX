import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  RoundButton({
    Key? key,
    required this.background,
    required this.icon,
    required this.color,
  }) : super(key: key);

  final Color background, color;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.all(10),
      // margin: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: background,
      ),
      child: IconButton(onPressed: () {}, icon: Icon(icon, color: color)),
    );
  }
}
