import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static Color primaryColor = Color(0xFF8959FC);
  // HexColor("26AE60");
  static Color greenColor = Color.fromRGBO(38, 174, 96, 1);
  static Color greenColor2 = Color.fromRGBO(38, 174, 96, 0.48);
  static Color silverColor = Color.fromRGBO(240, 240, 240, 1);
  static Color lightBlackColor = Color.fromRGBO(0, 0, 0, 0.31);
  static Color lightBlackColor2 = Color.fromRGBO(0, 0, 0, 0.51);
  static Color lightBlackColor3 = Color.fromRGBO(0, 0, 0, 0.53);
  static Color lightBlackColor4 = Color.fromRGBO(0, 0, 0, 0.91);
  static Color lightBlackColor5 = Color.fromRGBO(0, 0, 0, 0.36);

  static const Color whiteColor = Colors.white;
  static const Color redColor = Color(0xFFFF5F00);
  static const Color orangeColor = Color(0xFFFF9226);
  static const Color accentColor = Color(0xFF8D81DF);
  static const Color accentLightColor = Color(0xFFB9ADDB);
  static const Color accentDarkColor = Color(0xFF423B68);
  static const Color backGroundColor = Color(0xFF1F1D2B);
  static const Color backGroundLightColor = Color(0xFF2F3344);
  static const Color greyColor = Color(0xFFDCD7EB);
  static const Color darkPinkColor = Color(0xFFFF3472);
  static const Color lightGreenColor = Color(0xFF6DF5CE);

  static const String appFontFamily = 'Baloo';

  static ButtonStyle orangeButtonStyle = ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(AppTheme.orangeColor),
  );

  static const TextStyle orangeButtonTextStyle = TextStyle(
    fontSize: 19.0,
    fontFamily: AppTheme.appFontFamily,
  );

  static const TextStyle appTextStyle = TextStyle(
    fontSize: 14.0,
    fontFamily: AppTheme.appFontFamily,
    color: Colors.black,
  );
}

enum WhatToUpdate { UserName, Email, PhoneNumber }
