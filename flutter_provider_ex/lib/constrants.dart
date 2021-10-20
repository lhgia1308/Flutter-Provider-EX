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

const kPrimaryColor = Color(0XFF6A62B7);
const kBackgroundColor = Color(0XFFE5E5E5);
const kTextColor = Color(0XFF2C2C2C);
const kCardInfoBG = Color(0XFF686868);
const kRatingStarColor = Color(0XFFF4D150);
const kInputBackgroundColor = Color(0XFFF3F3F3);
const kPrimaryLightColor = Color(0XFF897CFF);

TextStyle get bodyText1 =>
    const TextStyle(fontSize: defaultFontSize, color: Colors.white);
TextStyle get bodyText2 =>
    const TextStyle(fontSize: defaultFontSize, color: Colors.white);
TextStyle get caption => const TextStyle(
      fontSize: defaultFontSize,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    );
TextStyle get headLine1 => const TextStyle(color: Colors.white);

ElevatedButtonThemeData get elevatedButtonThemeData => ElevatedButtonThemeData(
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
