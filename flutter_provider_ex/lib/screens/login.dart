// Copyright 2020 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_provider_ex/constrants.dart';
import 'package:flutter_provider_ex/controllers/login_controller.dart';
import 'package:flutter_provider_ex/generated/l10n.dart';
import 'package:flutter_provider_ex/language_change_provider.dart';
import 'package:flutter_provider_ex/models/language.dart';
import 'package:flutter_provider_ex/models/user_detail.dart';
import 'package:flutter_provider_ex/routes.dart';
import 'package:flutter_provider_ex/utils/user_simple_preferences.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
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
  List<UserDetail>? users;
  Language? _selectLanguage =
      Language(1, 'English', 'en', "assets/countries/us.svg");

  @override
  void initState() {
    final id = Uuid().v4();
    userDetail = widget.argument == null
        ? UserDetail(id: id)
        : widget.argument as UserDetail?;
    userNameController.text = userDetail!.email ?? "";
    if (userDetail!.setting != null)
      _selectLanguage = userDetail!.setting!.language;
    // UserSimplePreferences.removeAll();
    users = UserSimplePreferences.getUsers();

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
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildLanguageDropDown(),
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
              style: Theme.of(context).textTheme.bodyText1,
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
              style: Theme.of(context).textTheme.bodyText2,
            ),
            onPressed: () {
              _loginFacebook();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildLanguageDropDown() {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        child: DropdownButton(
          dropdownColor: Theme.of(context).scaffoldBackgroundColor,
          underline: SizedBox(),
          icon: Row(
            children: [
              const Icon(Icons.language),
              const Icon(Icons.keyboard_arrow_down),
              SvgPicture.asset(
                _selectLanguage!.imagePath!,
                height: 19,
                width: 19,
              ),
            ],
          ),
          items: getLanguages.map((language) {
            return DropdownMenuItem(
                alignment: Alignment.topLeft,
                value: language,
                child: Container(
                  margin: EdgeInsets.only(bottom: 3.0),
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(width: 1.0, color: Colors.lightBlue),
                      bottom: BorderSide(width: 1.0, color: Colors.lightBlue),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            language.imagePath!,
                            // width: 19,
                            height: 19,
                          ),
                          // const SizedBox(width: 5),
                          // Text(language.name!,
                          //     style: Theme.of(context).textTheme.bodyText1)
                        ],
                      ),
                    ],
                  ),
                ));
          }).toList(),
          onChanged: (Language? language) {
            setState(() {
              _selectLanguage = language;
            });
            context
                .read<LanguageChangeProvider>()
                .changeLocale(_selectLanguage!.languageCode!);
          },
        ),
      ),
    );
  }

  Widget _logInGoogle(BuildContext context) {
    return ElevatedButton(
      child: Text(
        "Sign in Google",
        style: Theme.of(context).textTheme.bodyText2,
      ),
      style: Theme.of(context).elevatedButtonTheme.style,
      onPressed: () async {
        UserDetail? _newUser;
        await Provider.of<LoginController>(context, listen: false)
            .googleLogin(context, _selectLanguage!);
        _newUser =
            Provider.of<LoginController>(context, listen: false).getUserDetail;
        // if (userDetail!.id == null) userDetail.id = Uuid().v4();
        String? _idNewUser = _newUser == null ? "" : _newUser.id;
        List<UserDetail> _user =
            users!.where((element) => element.id == _idNewUser).toList();
        //Exist user in list
        if (_user.length > 0) {
          await UserSimplePreferences.setUser(_newUser!);
        }
        //Not exist user in list => add
        else {
          if (_newUser != null) {
            await UserSimplePreferences.addUsers(_newUser);
            await UserSimplePreferences.setUser(_newUser);
            setState(() {
              userDetail = _newUser;
            });
          }
        }
        if (_newUser != null) {
          Navigator.of(context).pushNamed(RouteManager.homeScreen);
        }

        // if()
        // if (_newUser != null) {
        //   if (_idNewUser != _idOldUser) {
        //     await UserSimplePreferences.addUsers(_newUser);
        //     await UserSimplePreferences.setUser(_newUser);
        //     setState(() {
        //       userDetail = _newUser;
        //     });
        //   }
        //   Navigator.of(context).pushNamed(RouteManager.homeScreen);
        // }
      },
    );
  }

  Function? _loginFacebook() {}

  Widget _loginButton(BuildContext context) {
    return ElevatedButton(
        child: Text(
          'Enter',
          style: Theme.of(context).textTheme.bodyText2,
        ),
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
        style: Theme.of(context).elevatedButtonTheme.style);
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

  // Widget buildPets() => buildTitle(
  //       title: 'Pets',
  //       child: PetsButtonsWidget(
  //         pets: user.pets,
  //         onSelectedPet: (pet) => setState(() {
  //           final pets = user.pets.contains(pet)
  //               ? (List.of(user.pets)..remove(pet))
  //               : (List.of(user.pets)..add(pet));

  //           setState(() => user = user.copy(pets: pets));
  //         }),
  //       ),
  //     );
  Widget _buildImage() => GestureDetector(
        child: const CircleAvatar(
          child: Icon(Icons.ac_unit),
        ),
        onTap: () async {
          final _image =
              await ImagePicker().getImage(source: ImageSource.gallery);
          if (_image == null) return;
          final directory = await getApplicationDocumentsDirectory();
          final id = '_${widget.argument}_${Uuid().v4()}';
          final imageFile = File("${directory.path}/${id}_avata.png");
          final newImage = await File(_image.path).copy(imageFile.path);
          setState(() {
            userDetail?.photoURL = newImage.path;
          });
        },
      );
}
