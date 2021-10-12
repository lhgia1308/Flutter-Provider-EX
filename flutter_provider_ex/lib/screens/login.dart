// Copyright 2020 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
import 'package:flutter/material.dart';
import 'package:flutter_provider_ex/models/routes.dart';

class LoginScreen extends StatefulWidget {
  Map<dynamic, dynamic> parastr = {};
  LoginScreen({Key? key, required this.parastr}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final userNameController = TextEditingController();
  final passController = TextEditingController();
  String errText = "";
  @override
  void dispose() {
    userNameController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome',
              style: Theme.of(context).textTheme.headline1,
            ),
            TextFormField(
              controller: userNameController,
              decoration: const InputDecoration(
                hintText: 'Username',
              ),
            ),
            TextFormField(
              controller: passController,
              decoration: const InputDecoration(
                hintText: 'Password',
              ),
              obscureText: true,
            ),
            Center(
              child: Text(
                '${errText}',
                style: TextStyle(color: Colors.red),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            ElevatedButton(
              child: const Text('ENTER'),
              onPressed: () async {
                var err = validateData(context);
                if (err.isEmpty) {
                  await Navigator.of(context)
                      .pushNamed(RouteManager.homeScreen, arguments: {
                    "username": userNameController.text,
                    "pass": passController.text,
                  });
                }
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
              ),
            ),
            ElevatedButton(
              child: Text("Sign in Google",style: widget.parastr["textStyleDefault"],),
              onPressed: (){

              }
            )
          ],
        ),
      ),
    );
  }

  String validateData(BuildContext context) {
    if (userNameController.text.isEmpty) {
      setState(() {
        errText = " Vui long nhap username ";
      });
    } else if (passController.text.isEmpty) {
      setState(() {
        errText = " Vui long nhap pass ";
      });
    } else {
      errText = "";
    }
    return errText;
  }
}
