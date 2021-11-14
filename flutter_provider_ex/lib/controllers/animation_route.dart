import 'package:flutter/material.dart';
import 'package:flutter_provider_ex/routes.dart';

class AnimationPage extends PageRouteBuilder {
  AnimationPage({Key? key, String? this.namePage})
      : super(
            pageBuilder: (context, _, __) =>
                RouteManager.getPage(namePage: namePage, context: context),
            transitionsBuilder: (context, animation, animationtwo, child) {
              var tween =
                  Tween(begin: const Offset(0, 1), end: const Offset(0, 0));
              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            },
            transitionDuration: const Duration(milliseconds: 400));
  final namePage;
}
