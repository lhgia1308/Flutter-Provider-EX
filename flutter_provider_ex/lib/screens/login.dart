// Copyright 2020 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
import 'package:flutter/material.dart';
import 'package:flutter_provider_ex/generated/l10n.dart';
import 'package:flutter_provider_ex/language_change_provider.dart';
import 'package:flutter_provider_ex/routes.dart';
import 'package:flutter_provider_ex/utils/user_simple_preferences.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/src/provider.dart';

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
  late FocusNode _focusUserName;
  late FocusNode _focusPass;

  @override
  void initState() {
    userNameController.text = UserSimplePreferences.getUserName() ?? "";
    _focusUserName = FocusNode();
    _focusPass = FocusNode();
    super.initState();
  }

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
              S.of(context).welcomeText,
              style: Theme.of(context).textTheme.headline1,
            ),
            TextFormField(
              focusNode: _focusUserName,
              controller: userNameController,
              decoration: InputDecoration(
                hintText: S.of(context).labelUserName,
              ),
            ),
            TextFormField(
              focusNode: _focusPass,
              controller: passController,
              decoration: InputDecoration(
                hintText: S.of(context).labelPass,
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
            _loginButton(context),
            ElevatedButton(
                child: Text(
                  "Sign in Google",
                  style: widget.parastr["textStyleDefault"],
                ),
                onPressed: () {}),
            //Select language
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //US language
                IconButton(
                  onPressed: () {
                    context.read<LanguageChangeProvider>().changeLocale("us");
                  },
                  icon: SvgPicture.asset(
                    "assets/countries/us.svg",
                  ),
                ),
                //US language
                IconButton(
                  onPressed: () {
                    context.read<LanguageChangeProvider>().changeLocale("vi");
                  },
                  icon: SvgPicture.asset(
                    "assets/countries/vn.svg",
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _loginButton(BuildContext context) {
    return ElevatedButton(
      child: const Text('ENTER'),
      onPressed: () async {
        var err = validateData(context);
        if (err.isEmpty) {
          await Navigator.of(context)
              .pushNamed(RouteManager.homeScreen, arguments: {
            "username": userNameController.text,
            "pass": passController.text,
          });
          //Save data into Shared
          await UserSimplePreferences.setUserName(userNameController.text);
        }
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.blue,
      ),
    );
  }

  String validateData(BuildContext context) {
    if (userNameController.text.isEmpty) {
      setState(() {
        errText = " Vui long nhap ten dang nhap ";
        _focusUserName.requestFocus();
        // userNameController.
      });
    } else if (passController.text.isEmpty) {
      setState(() {
        errText = " Vui long nhap pass ";
        _focusPass.requestFocus();
      });
    } else {
      errText = "";
    }
    return errText;
  }
}
