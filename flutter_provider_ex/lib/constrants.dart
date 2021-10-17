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

List<Language> getLanguages = <Language>[
  Language(1, 'English', 'en', "assets/countries/us.svg"),
  Language(2, 'Vietnamese', 'vi', "assets/countries/vi.svg"),
  // Language(3, 'ឡាវ', 'la', "assets/countries/la.svg"),
];
