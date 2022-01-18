import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meshapp/Screens/Chat/chat_screen.dart';
import 'package:meshapp/Screens/Win/win_screen.dart';
import 'package:meshapp/UIController/app_theme.dart';
import 'package:meshapp/UIController/text_styles.dart';
import 'package:meshapp/core/helpers/ui_helpers.dart';

class HomeAppBar extends StatefulWidget {
  var scaffoldKey;
  HomeAppBar({Key? key, this.scaffoldKey}) : super(key: key);

  @override
  _HomeAppBarState createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).padding.top,
          ),
          InkWell(
            onTap: () {
              Get.to(WinScreen());
            },
            child: Text("EXPLORE",
                style: textStylemanropeRegular(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.primaryColor)),
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  UIHelper.scaffoldKey.currentState!.openDrawer();
                },
                child: Image.asset(
                  "images/menu.png",
                  width: 24,
                  height: 19,
                ),
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  Get.to(Chats());
                },
                child: Stack(
                  children: [
                    Image.asset(
                      "images/notificationcount.png",
                      width: 25,
                      height: 25,
                    ),
                    Container(
                      width: 30,
                      height: 20,
                      transform: Matrix4.translationValues(-15, -5, 0),
                      decoration: BoxDecoration(
                          color: Colors.red,
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(25)),
                      child: Center(
                        child: Text(
                          "9+",
                          style: textStyleRobotoBold(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}