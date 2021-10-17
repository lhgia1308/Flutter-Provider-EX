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
  Language(1, 'English', 'en'),
  Language(2, 'فارسی', 'fa'),
  Language(3, 'پشتو', 'ps'),
];
