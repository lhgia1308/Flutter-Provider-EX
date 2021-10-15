import 'package:flutter/material.dart';
import 'package:flutter_provider_ex/models/user_detail.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController with ChangeNotifier {
  var _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? googleSignInAccount;
  UserDetail? _userDetail;
  Color? _colorText = Colors.amber;

  void setColorText(Color color) {
    _colorText = color;
    notifyListeners();
  }

  //DO NOT USE SET DATE BECAUSE THE DATA WILL NOT CHANGE
  set setColorText1(Color color) => () {
        _colorText = color;
        notifyListeners();
      };

  Color? get getColor => _colorText;
  Color? getColor1() => _colorText;

  UserDetail? get getUserDetail => _userDetail;

  googleLogin() async {
    this.googleSignInAccount = await this._googleSignIn.signIn();

    this._userDetail = new UserDetail(
      displayName: this.googleSignInAccount!.displayName,
      email: this.googleSignInAccount!.email,
      photoURL: this.googleSignInAccount!.photoUrl,
    );

    notifyListeners();
  }

  googleLogout() async {
    this.googleSignInAccount = await this._googleSignIn.signOut();

    this._userDetail = null;

    notifyListeners();
  }
}
