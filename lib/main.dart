import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meshapp/UIController/app_theme.dart';
import 'package:meshapp/Screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Mesh Network',
      theme: ThemeData(
          textTheme: GoogleFonts.rubikTextTheme(),
          iconTheme: IconThemeData(color: AppTheme.primaryColor),
          primaryColor: AppTheme.primaryColor,
          buttonColor: AppTheme.primaryColor),
      home: SplashScreen(),
    );
  }
}
