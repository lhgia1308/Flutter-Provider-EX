import 'package:flutter/cupertino.dart';

class LanguageChangeProvider with ChangeNotifier {
  Locale _currentLocale = new Locale("en");

  Locale get currentLocale => _currentLocale;

  void changeLocale(String locale) {
    _currentLocale = new Locale(locale);
    notifyListeners();
  }
}
