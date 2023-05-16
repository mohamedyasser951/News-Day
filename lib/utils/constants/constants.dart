import 'package:flutter/material.dart';

String? Token = "";
String currentLocalApp = "en";

TextStyle get headingStyle {
  return const TextStyle(
    fontSize: 34,
    fontWeight: FontWeight.bold,
  );
}

MaterialColor myPrimarySwatch = MaterialColor(
  0xFF5a31ff,
  <int, Color>{
    50: Color(0xFF5a31ff),
    100: Color(0xFF5a31ff),
    200: Color(0xFF5a31ff),
    300: Color(0xFF5a31ff),
    400: Color(0xFF5a31ff),
    500: Color(0xFF5a31ff),
    600: Color(0xFF5a31ff),
    700: Color(0xFF5a31ff),
    800: Color(0xFF5a31ff),
    900: Color(0xFF5a31ff),
  },
);
