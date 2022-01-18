import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meshapp/Home/Widgets/search_widget.dart';
import 'package:meshapp/Screens/Chat/chat_screen.dart';
import 'package:meshapp/Screens/Win/win_screen.dart';
import 'package:meshapp/UIController/app_theme.dart';
import 'package:meshapp/UIController/text_styles.dart';
import 'package:meshapp/core/helpers/ui_helpers.dart';

class WinAppBar extends StatefulWidget {
  GlobalKey<ScaffoldState>? scaffoldKey;

  WinAppBar({Key? key, this.scaffoldKey}) : super(key: key);

  @override
  _WinAppBarState createState() => _WinAppBarState();
}

class _WinAppBarState extends State<WinAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).padding.top,
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  widget.scaffoldKey!.currentState!.openDrawer();
                },
                child: Image.asset(
                  "images/menu.png",
                  width: 24,
                  height: 19,
                ),
              ),
              UIHelper.horizontalSpaceSm,
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: HomeSearchWidget(),
              ))
            ],
          )
        ],
      ),
    );
  }
}
