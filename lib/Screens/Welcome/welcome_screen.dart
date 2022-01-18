import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meshapp/Screens/Authentication/auth_screen.dart';
import 'package:meshapp/UIController/app_theme.dart';
import 'package:meshapp/UIController/text_styles.dart';
import 'package:meshapp/Widgets/custom_button.dart';
import 'package:meshapp/core/helpers/ui_helpers.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = UIHelper.getScreenSize(context);
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Hero(
              tag: "splashlogo",
              child: Image.asset(
                "images/logo.png",
                height: size.height * 0.35,
              ),
            ),
            UIHelper.verticalSpaceL,
            Text(
              "Welcome",
              style: textStyleRobotoRegular(
                  fontSize: 36, color: AppTheme.primaryColor),
            ),
            UIHelper.verticalSpaceMd,
            Text(
              "Lorem ipsum dolor sit amet,\nconsectetur adipiscing elit,\nsed do eiusmod",
              textAlign: TextAlign.center,
              style: textStyleRubicRegular(
                  fontSize: 16.0, color: AppTheme.primaryColor),
            ),
            UIHelper.verticalSpaceL,
            CustomButton(
              () {},
              text: "Register",
            ),
            UIHelper.verticalSpaceMd,
            CustomButton(
              () {
                Get.to(AuthenticationScreen());
              },
              text: "Login",
              color: Colors.white,
              textcolor: AppTheme.primaryColor,
            ),
            UIHelper.verticalSpaceL,
          ],
        ),
      ),
    );
  }
}
