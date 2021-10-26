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
  AnimationController animationController = AnimationController(
      duration: const Duration(milliseconds: 270), vsync: this);
  Duration animationDuration = const Duration(milliseconds: 270);

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
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
    Size _size = MediaQuery.of(context).size;

    double viewInset = MediaQuery.of(context).viewInsets.bottom;
    double defaultLoginSize = _size.height - _size.height * 0.2;
    double defaultRegisterSize = _size.height - _size.height * 0.1;

    containerSize =
        Tween<double>(begin: _size.height * 0.1, end: defaultRegisterSize)
            .animate(
      CurvedAnimation(parent: animationController, curve: Curves.linear),
    );
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: double.infinity,
          height: _size.height * 0.1,
          child: IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              animationController.reverse();
              setState(() {
                isLogin = !isLogin;
              });
            },
          ),
        ),
        Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          height: _size.height - _size.height * 0.2,
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
              Image.asset("assets/images/welcome.jpg"),
              const SizedBox(height: 40),
              textField(hintText: "Username"),
              const SizedBox(height: 10),
              textField(hintText: "Pass"),
              const SizedBox(height: 10),
              ElevatedButton(
                style: elevatedButtonThemeData.style,
                onPressed: () {},
                child: Text(
                  "LOGIN",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              )
            ],
          ),
        ),
        AnimatedBuilder(
          animation: animationController,
          builder: (context, child) {
            return _buildRegisterForm(context: context);
          },
        )
      ],
    );
  }

  Widget _buildRegisterForm({required BuildContext context}) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: kCardInfoBG,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(100),
          topRight: Radius.circular(100),
        ),
        // border: Border.all(color: Colors.black),
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
