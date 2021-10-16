// Copyright 2020 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_provider_ex/controllers/login_controller.dart';
import 'package:flutter_provider_ex/generated/l10n.dart';
import 'package:flutter_provider_ex/language_change_provider.dart';
import 'package:flutter_provider_ex/models/user_detail.dart';
import 'package:flutter_provider_ex/routes.dart';
import 'package:flutter_provider_ex/utils/user_simple_preferences.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:provider/src/provider.dart';
import 'package:uuid/uuid.dart';

class LoginScreen extends StatefulWidget {
  Object? argument = {};
  LoginScreen({Key? key, required this.argument}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final userNameController = TextEditingController();
  final passController = TextEditingController();
  String errText = "";
  late FocusNode _focusUserName;
  late FocusNode _focusPass;
  UserDetail? userDetail;

  @override
  void initState() {
    final id = Uuid().v4();
    userDetail = widget.argument == null
        ? UserDetail(id: id)
        : widget.argument as UserDetail?;
    userNameController.text = userDetail!.email ?? "";
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
    return _loginUI();
  }

  Widget _loginUI() {
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
            _logInGoogle(context),
            ElevatedButton(
              child: Text(
                "Sign in Facebook",
                style: context.watch<LoginController>().getDefaultTextStyle(),
              ),
              onPressed: () {
                _loginFacebook();
              },
            ),
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

  Widget _logInGoogle(BuildContext context) {
    return ElevatedButton(
      child: Text(
        "Sign in Google",
        style: context.watch<LoginController>().getDefaultTextStyle(),
      ),
      onPressed: () async {
        UserDetail? _newUser;
        await Provider.of<LoginController>(context, listen: false)
            .googleLogin();
        _newUser =
            Provider.of<LoginController>(context, listen: false).getUserDetail;
        // if (userDetail!.id == null) userDetail.id = Uuid().v4();
        String? _idNewUser = _newUser == null ? "" : _newUser.id;
        String? _idOldUser = userDetail == null ? "" : userDetail!.id;
        if (_newUser != null) {
          if (_idNewUser != _idOldUser) {
            await UserSimplePreferences.setUser(_newUser);
            setState(() {
              userDetail = _newUser;
            });

            UserDetail userDetail1 = UserSimplePreferences.getUser(_newUser.id);
            print(userDetail1);
          }
          Navigator.of(context).pushNamed(RouteManager.homeScreen);
        }
      },
    );
  }

  Function? _loginFacebook() {}

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
          // await UserSimplePreferences.setUser(user)
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
