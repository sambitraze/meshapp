import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:meshapp/Screens/Skills/select_skills_screen.dart';
import 'package:meshapp/UIController/app_theme.dart';
import 'package:meshapp/UIController/text_styles.dart';
import 'package:meshapp/Widgets/custom_button.dart';
import 'package:meshapp/core/helpers/ui_helpers.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({Key? key}) : super(key: key);

  @override
  _AuthenticationScreenState createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    Size size = UIHelper.getScreenSize(context); // fetch screen size
    return Scaffold(
        body: Container(
      width: size.width,
      height: size.height,
      child: Column(
        children: [
          Expanded(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'images/logo.png',
                  width: 250,
                ),
              ),
            ),
          ),
          Container(
            width: size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                color: AppTheme.primaryColor),
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                isLogin
                    ? welcomeBackText()
                    : Container(
                        height: 30,
                      ),
                UIHelper.verticalSpaceMd,
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    isLogin ? "Login" : "Register",
                    style: textStyleInterRegular(
                        fontSize: 25.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                UIHelper.verticalSpaceMd,
                phoneField(),
                Divider(
                  thickness: 1,
                  color: Colors.white,
                ),
                UIHelper.verticalSpaceMd,
                UIHelper.verticalSpaceSm,
// here this text change on login or sign up button click
                Text(
                  "Or ${isLogin ? "login" : "signup"}? with google",
                  style: textStyleInterRegular(
                      fontSize: 13.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
                UIHelper.verticalSpaceMd,
                googleButton(),
                UIHelper.verticalSpaceMd,
                InkWell(
                  onTap: () {
                    setState(() {
                      isLogin = !isLogin;
                    });
                  },
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: "Already have a account?",
                          style: textStyleInterRegular(
                              fontSize: 16, color: Colors.white)),
                      TextSpan(
                          text: isLogin ? " Register" : " Sign In",
                          style: textStyleInterRegular(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Color(0xff204050))),
                    ]),
                  ),
                ),
                UIHelper.verticalSpaceL,
              ],
            ),
          )
        ],
      ),
    ));
  }

  CustomButton googleButton() {
    return CustomButton(() {
      Get.to(SelectSkillsScreen());
    },
        color: Colors.white,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Icon(MdiIcons.google, color: AppTheme.primaryColor),
            ),
            Center(
              child: Container(
                child: Text("Sign up with google ",
                    textAlign: TextAlign.center,
                    style: textStyleInterRegular(
                        fontSize: 14, color: AppTheme.primaryColor)),
              ),
            )
          ],
        ));
  }

  Widget phoneField() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Image.asset(
            "images/ind.png",
            width: 30,
            height: 30,
          ),
          UIHelper.horizontalSpaceSm,
          Text("+91",
              style: textStyleInterRegular(
                  fontSize: 18,
                  fontWeight: fontWeightW600,
                  color: Colors.white)),
          UIHelper.horizontalSpaceSm,
          Expanded(
            child: TextFormField(
              keyboardType: TextInputType.phone,
              style: textStyleInterRegular(
                  fontSize: 18,
                  fontWeight: fontWeightW600,
                  color: Colors.white),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: Card(
                    elevation: 10,
                    color: AppTheme.whiteColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: const Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                        color: Color(0xff8959FC),
                      ),
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }

  Container welcomeBackText() {
    return Container(
        height: 30,
        child: Row(
          children: [
            Text(
              "Welcome Back!!!",
              style: textStyleRubicRegular(
                  fontSize: 18.0, fontWeight: FontWeight.w400),
            ),
            Spacer(),
            Image.asset(
              "images/close.png",
              width: 30,
              height: 30,
            )
          ],
        ));
  }
}
