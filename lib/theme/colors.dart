import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color(0xff0075E1);
  static const Color backgroundColor = Color(0xffF6F5F8);
  static const Color whiteBlueColor = Color(0xffF9FBFF);
  static const Color hoverColor = Color(0xffF2F5FD);
  static const Color hintColor = Color(0xff8B8B8B);
  static const Color disabledColor = Color(0xffF5F6FA);
  static const Color errorColor = Color(0xffED2529);
  static const Color textColorPrimary = Color(0xFF212A3D);

  static const Color shadowColor = Color(0x24253753);

  static const int _blackPrimaryValue = 0xFF1B2C43;
  static const MaterialColor black = MaterialColor(
    _blackPrimaryValue,
    <int, Color>{
      50: Color(0xFFF0F3F5),
      200: Color(0xFFD9E1EC),
      300: Color(0xFFA7B3C4),
      500: Color(0xFF6F7A8A),
      800: Color(0xFF435267),
      900: Color(_blackPrimaryValue),
    },
  );
}
