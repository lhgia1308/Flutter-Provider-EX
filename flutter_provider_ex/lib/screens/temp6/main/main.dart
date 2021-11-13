import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter/services.dart';
import 'package:flutter_provider_ex/services/api_manager.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class MainScreen6 extends StatefulWidget {
  MainScreen6({Key? key}) : super(key: key);

  @override
  State<MainScreen6> createState() => _MainScreen6State();
}

class _MainScreen6State extends State<MainScreen6>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Duration animationDuration;
  late Animation<Offset> offsetAnimation;
  late Animation<double> rotateAngle;
  late Animation<double> rotateAngles;
  late List<Animation<double>> _animations;
  late int duration = 1000;
  var apiController = Get.put(API_Manager());

  @override
  void initState() {
    super.initState();
    animationDuration = Duration(milliseconds: duration);
    animationController =
        AnimationController(duration: animationDuration, vsync: this);

    final _intervalGap = 1 / items.length;
    final _tween = Tween<double>(begin: -2, end: 0);
    Animation<double> curvedAnimation(int index) => CurvedAnimation(
          parent: animationController,
          curve: Interval(0, index * _intervalGap + _intervalGap),
        );
    _animations = List<Animation<double>>.generate(
            items.length, (index) => _tween.animate(curvedAnimation(index)))
        .toList();

    offsetAnimation =
        Tween<Offset>(begin: const Offset(2, 0), end: const Offset(0, 0))
            .animate(
      CurvedAnimation(parent: animationController, curve: Curves.ease),
    );

    rotateAngle = Tween<double>(begin: 0.5, end: 0.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.decelerate));

    rotateAngles = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem<double>(tween: Tween(begin: 0.5, end: 0.0), weight: 10),
      TweenSequenceItem<double>(tween: Tween(begin: 0.0, end: 0.5), weight: 10),
    ]).animate(
        CurvedAnimation(parent: animationController, curve: Curves.ease));

    animationController.forward();

    animationController.addListener(() {
      // print(animationController.value);
      // print(_offsetAnimation.value);
    });

    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        print("AnimationStatus.completed");
        // animationController.reverse();
      }
      if (status == AnimationStatus.dismissed) {
        // print("AnimationStatus.dismissed");
        // animationController.forward();
      }
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  List<String> items = ["Apple", "Samsung", "Nokia", "Oppo", "Sony"];

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return GetBuilder<API_Manager>(
      builder: (context) {
        return Container(
          // padding: const EdgeInsets.all(50),
          height: _size.height,
          // width: 150,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
          ),
          child: AnimatedBuilder(
              animation: animationController,
              builder: (context, widget) {
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return Transform(
                      transform: Matrix4.identity()
                        ..rotateZ(_animations[index].value)
                        ..rotateY(_animations[index].value),
                      child: Container(
                        height: 70,
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          color: Colors.amber,
                        ),
                        child: Text(items[index]),
                      ),
                    );
                  },
                );
              }),
        );
      },
    );
  }
}
