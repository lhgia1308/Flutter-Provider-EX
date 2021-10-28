import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_provider_ex/constrants.dart';
import 'package:provider/provider.dart';

class HomeScreen2 extends StatefulWidget {
  HomeScreen2({Key? key}) : super(key: key);

  @override
  State<HomeScreen2> createState() => _HomeScreen2State();
}

class _HomeScreen2State extends State<HomeScreen2>
    with SingleTickerProviderStateMixin {
  bool isLogin = true;
  Animation<double>? containerSize;
  late AnimationController animationController;
  Duration animationDuration = const Duration(milliseconds: 270);
  late Size _size;
  late double defaultRegisterSize;
  late double defaultLoginSize;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    animationController =
        AnimationController(vsync: this, duration: animationDuration);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;

    double viewInset = MediaQuery.of(context).viewInsets.bottom;
    defaultLoginSize = _size.height - _size.height * 0.1;
    defaultRegisterSize = _size.height - _size.height * 0.1;

    containerSize =
        Tween<double>(begin: _size.height * 0.1, end: defaultRegisterSize)
            .animate(
      CurvedAnimation(parent: animationController, curve: Curves.linear),
    );
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(border: Border.all(color: Colors.orange)),
      // height: _size.height,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          cancelButton(),
          loginForm(),
          Visibility(
            visible: !isLogin,
            child: registerForm(),
          ),
          _signInButton(),
        ],
      ),
    );
  }

  Widget loginForm() {
    return Container(
      // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      margin: EdgeInsets.only(top: 50),
      height: defaultLoginSize,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Welcome Text",
            style: Theme.of(context).textTheme.bodyText1,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          Image.asset("assets/images/welcome.jpg",
              width: double.infinity, height: 100),
          const SizedBox(height: 40),
          textField(hintText: "Username"),
          const SizedBox(height: 10),
          textField(hintText: "Pass"),
          const SizedBox(height: 10),
          ElevatedButton(
            style: elevatedButtonThemeData.style,
            onPressed: () {
              print("savbg");
            },
            child: Text(
              "LOGIN",
              style: Theme.of(context).textTheme.bodyText1,
            ),
          )
        ],
      ),
    );
  }

  Widget registerForm() {
    return Container(
      // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      margin: EdgeInsets.only(top: 50),
      height: containerSize?.value,
      width: double.infinity,
      // decoration: BoxDecoration(color: kCardInfoBG),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Register Form",
            style: Theme.of(context).textTheme.bodyText1,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          textField(hintText: "Username"),
          const SizedBox(height: 10),
          textField(hintText: "Pass"),
          const SizedBox(height: 10),
          ElevatedButton(
            style: elevatedButtonThemeData.style,
            onPressed: () {
              print("savbg");
            },
            child: Text(
              "Register",
              style: Theme.of(context).textTheme.bodyText1,
            ),
          )
        ],
      ),
    );
  }

  Widget cancelButton() {
    return Positioned(
      top: 0,
      child: IconButton(
        icon: const Icon(Icons.close),
        onPressed: () {
          log("abc");
          animationController.reverse();
          setState(() {
            isLogin = !isLogin;
          });
        },
      ),
    );
  }

  Widget _signInButton() {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return signIn();
      },
    );
  }

  Widget signIn() {
    return Container(
      alignment: Alignment.bottomCenter,
      width: double.infinity,
      height: containerSize?.value,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: kCardInfoBG,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(100),
          topRight: Radius.circular(100),
        ),
        border: Border.all(color: Colors.black),
      ),
      child: GestureDetector(
        onTap: () {
          setState(() {
            animationController.forward();
            isLogin = !isLogin;
          });
        },
        child: Text(
          "Don't have account Sign In ${isLogin}",
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
    );
  }
}
