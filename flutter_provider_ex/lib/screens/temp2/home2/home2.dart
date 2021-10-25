import 'package:flutter/material.dart';
import 'package:flutter_provider_ex/constrants.dart';

class HomeScreen2 extends StatelessWidget {
  HomeScreen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        height: _size.height - _size.height * 0.2,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome Text"),
            const SizedBox(height: 40),
            Image.asset("assets/images/welcome.jpg"),
            const SizedBox(height: 40),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: kPrimaryColor.withAlpha(40),
              ),
              child: TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.email, color: kPrimaryColor),
                  hintText: "Username",
                  border: InputBorder.none,
                ),
              ),
            )
          ],
        ));
  }
}
