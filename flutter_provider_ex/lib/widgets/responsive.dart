import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  Widget? mobile;
  Widget? tablet;
  Widget? desktop;

  Responsive({
    Key? key,
    this.mobile,
    this.tablet,
    this.desktop,
  }) : super(key: key);

// This size work fine on my design, maybe you need some customization depends on your design

  // This isMobile, isTablet, isDesktop helep us later
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 850;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1100 &&
      MediaQuery.of(context).size.width >= 850;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;

  static bool isLandscape(BuildContext context) =>
      MediaQuery.of(context).orientation == Orientation.landscape;
// We're using device aspect ratio to determine Tab or Phone
  static bool isTab(BuildContext context) =>
      MediaQuery.of(context).size.aspectRatio >= 0.74 &&
      MediaQuery.of(context).size.aspectRatio < 1.5;

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    // If our width is more than 1100 then we consider it a desktop
    if (_size.width >= 1100) {
      return desktop!;
    }
    // If width it less then 1100 and more then 850 we consider it as tablet
    else if (_size.width >= 850 && tablet != null) {
      return tablet!;
    }
    // Or less then that we called it mobile
    else {
      return mobile!;
    }
  }
}
