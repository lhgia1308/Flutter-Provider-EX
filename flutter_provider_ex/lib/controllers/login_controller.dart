import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_provider_ex/language_change_provider.dart';
import 'package:flutter_provider_ex/models/language.dart';
import 'package:flutter_provider_ex/models/setting.dart';
import 'package:flutter_provider_ex/models/user_detail.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class LoginController with ChangeNotifier {
  var _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? googleSignInAccount;
  UserDetail? _userDetail;
  Color? _colorText = Colors.white;
  double _defaultFontSize = 25.0;
  TextStyle? _defaultTextStyle;
  Color? defaultBackground = Colors.blueGrey[300];

  Color? get getDefaultBackground => defaultBackground;
  double get getDefaultFontSize => _defaultFontSize;

  TextStyle getDefaultTextStyle() {
    TextStyle textStyle = TextStyle(
      fontSize: _defaultFontSize,
      color: _colorText,
    );
    return textStyle;
  }

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

  googleLogin(BuildContext context, Language _language) async {
    String message = "";
    this.googleSignInAccount = await this._googleSignIn.signIn().catchError(
      (ex) {
        PlatformException exception = ex as PlatformException;
        // print("Error connect with Google: ${exception.code}");
        switch (exception.code) {
          case "network_error":
            message =
                "Không thể kết nối tới Google, vui lòng kiểm tra lại mạng internet!";
            break;
          default:
            message = exception.code;
        }
      },
    );
    if (message != "") {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          duration: Duration(seconds: 2),
        ),
      );
    } else {
      this._userDetail = new UserDetail(
          id: this.googleSignInAccount!.id,
          displayName: this.googleSignInAccount!.displayName,
          email: this.googleSignInAccount!.email,
          photoURL: this.googleSignInAccount!.photoUrl,
          birthday: DateTime(2021, 10, 10),
          pets: ["cho", "meo", "ga"],
          setting: Setting(
            allowNewsletter: true,
            allowNotification: true,
            language: _language,
          ));

      notifyListeners();
    }
  }

  Future googleLogout() async {
    this.googleSignInAccount = await this._googleSignIn.signOut();

    // this._userDetail = null;

    notifyListeners();
  }
}
