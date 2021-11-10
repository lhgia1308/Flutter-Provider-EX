import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter/services.dart';

class MainScreen6 extends StatefulWidget {
  MainScreen6({Key? key}) : super(key: key);

  @override
  State<MainScreen6> createState() => _MainScreen6State();
}

class _MainScreen6State extends State<MainScreen6>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Duration animationDuration;
  late Animation<Offset> offsetAnimation;

  @override
  void initState() {
    super.initState();
    animationDuration = const Duration(seconds: 2);
    animationController =
        AnimationController(duration: animationDuration, vsync: this)..repeat();

    offsetAnimation =
        Tween<Offset>(begin: const Offset(1, 0), end: const Offset(0, 0))
            .animate(animationController);

    animationController.addListener(() {
      // print(animationController.value);
      // print(_offsetAnimation.value);
    });

    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          print("AnimationStatus.completed");
        });
      }
      if (status == AnimationStatus.dismissed) {
        setState(() {
          print("AnimationStatus.dismissed");
        });
      }
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, widget) {
        return Transform(
          alignment: Alignment.topRight,
          transform: Matrix4.skewY(0.3)..rotateZ(-math.pi / 12.0),
          child: widget,
        );
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          color: Colors.amber,
        ),
        child: Text("Text"),
      ),
    );
  }
}
