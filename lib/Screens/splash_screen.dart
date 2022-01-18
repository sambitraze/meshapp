import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meshapp/Screens/Welcome/welcome_screen.dart';
import 'package:meshapp/core/helpers/ui_helpers.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // after 2 Seconds it will move to login screen

    Timer(Duration(seconds: 2), () {
      Get.to(WelcomeScreen(), transition: Transition.noTransition);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = UIHelper.getScreenSize(context); // fetch screen size
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Center(
              child: Hero(
                tag: "splashlogo",
                child: Image.asset(
                  "images/logo.png",
                  width: 250,
                  height: 250,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
