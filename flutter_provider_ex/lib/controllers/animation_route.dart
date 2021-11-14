import 'package:flutter/material.dart';

class AnimationPage extends PageRouteBuilder {
  AnimationPage({Key? key, this.page})
      : super(
          pageBuilder: (context, animation, animationtwo) => page,
          transitionsBuilder: (context, animation, animationtwo, child) {
            var tween =
                Tween(begin: const Offset(-1, 0), end: const Offset(0, 0));
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        );
  final page;
}
