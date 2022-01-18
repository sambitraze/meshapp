import 'package:flutter/material.dart';

class Constants {
  static const appTitle = 'Mesh App';

  static Color white = Color(0xFFFFFFFF);
  static Color primaryColor = Color(0xFF29ABE2);
  static Color greyColor = Color(0xFF707070);

  static const double maxBold = 35.0;
  static const double midiumBold = 25.0;
  static const double bigsmallBold = 20.0;

  static const double smallBold = 15.0;
  static const double minBold = 10.0;
  static const String baseUrl = '';
  static double height = 0;
  static double getScreenHight(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return height;
  }

  static double getScreenWidtht(BuildContext context) {
    double height = MediaQuery.of(context).size.width;
    return height;
  }

  static var curentTheme = lightBlueTheme;

  static final lightBlueTheme = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: Colors.black,
    brightness: Brightness.light,
    backgroundColor: const Color(0xFF212121),
    accentColor: Colors.white,
    accentIconTheme: IconThemeData(color: Colors.black),
    dividerColor: Colors.black12,
  );

  static final orangeTheme = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: Colors.orange,
    brightness: Brightness.light,
    backgroundColor: const Color(0xFFE5E5E5),
    accentColor: Colors.black,
    accentIconTheme: IconThemeData(color: Colors.white),
    dividerColor: Colors.white54,
  );

  static final greenTheme = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: Colors.green,
    brightness: Brightness.light,
    backgroundColor: const Color(0xFFE5E5E5),
    accentColor: Colors.black,
    accentIconTheme: IconThemeData(color: Colors.white),
    dividerColor: Colors.white54,
  );
  static final darkTheme = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: Colors.black,
    brightness: Brightness.dark,
    fontFamily: "NunitoSans",
    backgroundColor: const Color(0xFF212121),
    accentColor: Colors.white,
    accentIconTheme: IconThemeData(color: Colors.black),
    dividerColor: Colors.black12,
  );
  static final greyTheme = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: Color(0xFF426ec5),
    brightness: Brightness.light,
    backgroundColor: const Color(0xFFE5E5E5),
    accentColor: Colors.black,
    accentIconTheme: IconThemeData(color: Colors.white),
    dividerColor: Colors.white54,
  );
  static final redTheme = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: Colors.red,
    brightness: Brightness.light,
    backgroundColor: const Color(0xFFE5E5E5),
    accentColor: Colors.black,
    accentIconTheme: IconThemeData(color: Colors.white),
    dividerColor: Colors.white54,
  );
  static final lightTheme = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: greyColor,
    brightness: Brightness.light,
    fontFamily: "light",
    backgroundColor: const Color(0xFFE5E5E5),
    accentColor: primaryColor,
    accentIconTheme: IconThemeData(color: Colors.white),
    dividerColor: Colors.white54,
  );
}
