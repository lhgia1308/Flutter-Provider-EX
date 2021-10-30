import 'package:flutter/material.dart';
import 'package:flutter_provider_ex/generated/l10n.dart';
import 'package:flutter_provider_ex/models/place.dart';

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
const kPrimaryColor1 = Colors.green;
const kBackgroundColor = Color(0XFFE5E5E5);
const kTextColor = Color(0XFF2C2C2C);
const kHintTextColor = Colors.black12;
const kCardInfoBG = Color(0XFF686868);
const kRatingStarColor = Color(0XFFF4D150);
const kInputBackgroundColor = Color(0XFFF3F3F3);
const kPrimaryLightColor = Color(0XFF897CFF);
final kButtonColor = Colors.purple[900]!;

TextStyle get bodyText1 =>
    const TextStyle(fontSize: defaultFontSize, color: Colors.white);
TextStyle get bodyText2 =>
    const TextStyle(fontSize: defaultFontSize, color: Colors.white);
TextStyle get caption => const TextStyle(
      fontSize: defaultFontSize,
      color: Colors.amber,
      fontWeight: FontWeight.bold,
    );
TextStyle get headLine1 => const TextStyle(color: Colors.white);
InputDecoration inputDecoration(BuildContext context, Widget suffixIcon) =>
    InputDecoration(
      border: InputBorder.none,
      fillColor: kPrimaryColor,
      hintText: S.of(context).labelPass,
      suffixIcon: suffixIcon,
    );

Widget textField({
  TextEditingController? controller,
  Widget? suffixIcon,
  Icon? icon,
  FocusNode? focusNode,
  bool obscureText = false,
  String? hintText,
}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      color: kPrimaryColor.withAlpha(40),
    ),
    child: TextField(
      focusNode: focusNode,
      controller: controller,
      obscureText: obscureText,
      cursorColor: Colors.transparent,
      decoration: InputDecoration(
        icon: icon,
        border: InputBorder.none,
        fillColor: kPrimaryColor,
        hintText: hintText,
        suffixIcon: suffixIcon,
      ),
    ),
  );
}

ElevatedButtonThemeData get elevatedButtonThemeData => ElevatedButtonThemeData(
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsets>(
            const EdgeInsets.symmetric(vertical: 12, horizontal: 30)),
        backgroundColor: MaterialStateProperty.all(Colors.blue[900]),
        shadowColor: MaterialStateProperty.all(Colors.blue[600]),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            side: const BorderSide(
              color: Colors.white,
              width: 1,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.circular(40),
          ),
        ),
      ),
    );

const double defaultFontSize = 17.0;
const double defaultPadding = 20.0;
const double defaultMargin = 20.0;

List<Language> getLanguages = <Language>[
  Language(1, 'English', 'en', "assets/countries/us.svg"),
  Language(2, 'Vietnamese', 'vi', "assets/countries/vi.svg"),
  // Language(3, 'ឡាវ', 'la', "assets/countries/la.svg"),
];
List<String> placesCategoris = [
  "Popular",
  "Featured",
  "Most Vissited",
  "Europe",
  "Asia",
  "Africa",
  "America",
  "Australia"
];

// demo places
List<Place> demoPlaces = [
  Place(
    id: 1,
    name: 'Nothern Mountain',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dignissim eget amet viverra eget fames rhoncus. Eget enim venenatis enim porta egestas malesuada et. Consequat mauris lacus euismod montes.',
    location: 'Honshu, Japan',
    image: 'assets/images/place1.jpg',
    rating: 4,
    price: 300,
  ),
  Place(
    id: 2,
    name: 'Mount Fuji',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dignissim eget amet viverra eget fames rhoncus. Eget enim venenatis enim porta egestas malesuada et. Consequat mauris lacus euismod montes.',
    location: 'Honshu, Japan',
    image: 'assets/images/place2.jpg',
    rating: 3,
    price: 300,
  ),
  Place(
    id: 3,
    name: 'Greenough',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dignissim eget amet viverra eget fames rhoncus. Eget enim venenatis enim porta egestas malesuada et. Consequat mauris lacus euismod montes.',
    location: 'Honshu, Japan',
    image: 'assets/images/place3.jpg',
    rating: 1,
    price: 400,
  ),
  Place(
    id: 4,
    name: 'Mount Heaven 1',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dignissim eget amet viverra eget fames rhoncus. Eget enim venenatis enim porta egestas malesuada et. Consequat mauris lacus euismod montes. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dignissim eget amet viverra eget fames rhoncus. Eget enim venenatis enim porta egestas malesuada et. Consequat mauris lacus euismod montes. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dignissim eget amet viverra eget fames rhoncus. Eget enim venenatis enim porta egestas malesuada et. Consequat mauris lacus euismod montes.',
    location: 'Honshu, Japan',
    image: 'assets/images/place4.jpg',
    rating: 3,
    price: 500,
  ),
  Place(
    id: 5,
    name: 'Mount Heaven 2',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dignissim eget amet viverra eget fames rhoncus. Eget enim venenatis enim porta egestas malesuada et. Consequat mauris lacus euismod montes.',
    location: 'Honshu, Japan',
    image: 'assets/images/place4.jpg',
    rating: 3,
    price: 600,
  ),
];
