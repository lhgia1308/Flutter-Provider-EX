import 'package:flutter/material.dart';

import 'models/language.dart';

Map<dynamic, dynamic> configPara = {
  "title": const Text(
    "Provider EX",
    style: TextStyle(fontSize: 30),
  ),
  "username": "Gia Lê Đẹp trai",
  "fontSize": 18.0,
  "fontFamily": "Italianno",
  "textStyleDefault": TextStyle(fontSize: 30.0, color: Colors.white)
};

ElevatedButtonThemeData elevatedButtonThemeData() => ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.cyan),
        // shadowColor: MaterialStateProperty.all(Colors.blue[600]),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.amber[600]!,
              width: 1,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );

const double defaultFontSize = 17.0;

List<Language> getLanguages = <Language>[
  Language(1, 'English', 'en', "assets/countries/us.svg"),
  Language(2, 'Vietnamese', 'vi', "assets/countries/vi.svg"),
  // Language(3, 'ឡាវ', 'la', "assets/countries/la.svg"),
];
