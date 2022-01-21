import 'dart:async';
import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:meshapp/Home/home_screen.dart';
import 'package:meshapp/Screens/AuditionAndCompetition/audition_competition_screen.dart';
import 'package:meshapp/Screens/Authentication/auth_screen.dart';
import 'package:meshapp/Screens/Profile/profile_screen.dart';
import 'package:meshapp/Screens/TrainingAndEarning/mytraning_earning_screen.dart';
import 'package:meshapp/Screens/Win/win_screen.dart';
import 'package:meshapp/UIController/app_theme.dart';
import 'package:meshapp/UIController/text_styles.dart';
import 'package:meshapp/Widgets/custom_button.dart';
import 'package:meshapp/core/helpers/ui_helpers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:keyboard_actions/keyboard_actions_config.dart';
import 'dart:async';
import 'dart:convert';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  int selectIndex = 1;
  var username = '';
  var email = '';
  var profileImage = '';
  bool allowNotification = false;
  bool allowLocation = false;

  bool isSellOrReturnClicked = false;
  int isClickedNum = 0;
  var pref;
  var unreadMessages = "0";

  DateTime? currentBackPressTime;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSelectedIndex();
    getPref();
  }

  void getSelectedIndex() async {
    var pref = await SharedPreferences.getInstance();
    int? index = pref.getInt("selectindex");

    setState(() {
      username = pref.getString("username")!;
      email = pref.getString("email")!;
      if (pref.getString("profileimage") != null) {
        profileImage = pref.getString("profileimage")!;
      }
      if (index != null) {
        selectIndex = index;
      } else {
        selectIndex = 1;
      }
    });
  }

  Future<dynamic> _onWillPop() async {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Are you sure?'),
        content: Text('Do you want to exit an App'),
        actions: <Widget>[
          FlatButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text('No'),
          ),
          FlatButton(
            onPressed: () => exit(0),
            /*Navigator.of(context).pop(true)*/
            child: Text('Yes'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Future<bool> onWillPop() async {
      DateTime now = DateTime.now();
      if (currentBackPressTime == null ||
          now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
        currentBackPressTime = now;
      } else {
        _onWillPop();
      }
      return false;
    }

    return WillPopScope(
      onWillPop: onWillPop,
      child: Drawer(
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: AppTheme.whiteColor,
          padding: EdgeInsets.only(top: 40),
          child: Column(
            children: [
              drawerHeader(),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    _createDrawerItem(
                        icon: Icons.home,
                        img: "images/My Questions.png",
                        text: 'My Questions',
                        selectIndx: 1,
                        selectedImg: "images/My Questions.png",
                        onTap: () async {
                          var pref = await SharedPreferences.getInstance();
                          pref.setInt("selectindex", 1);
                          setState(() {
                            selectIndex = 1;
                          });
                          Get.to(
                              ProfileScreen(
                                index: 1,
                              ),
                              transition: Transition.noTransition);
                        }),
                    _createDrawerItem(
                        icon: Icons.home,
                        img: "images/My Posts.png",
                        text: 'My Posts',
                        selectIndx: 2,
                        selectedImg: "images/My Posts.png",
                        onTap: () async {
                          var pref = await SharedPreferences.getInstance();
                          pref.setInt("selectindex", 2);
                          setState(() {
                            selectIndex = 2;
                          });
                          Get.to(
                              ProfileScreen(
                                index: 0,
                              ),
                              transition: Transition.noTransition);
                        }),
                    _createDrawerItem(
                        icon: Icons.home,
                        img: "images/My Training.png",
                        text: 'My Training',
                        selectIndx: 3,
                        selectedImg: "images/My Training.png",
                        onTap: () async {
                          var pref = await SharedPreferences.getInstance();
                          pref.setInt("selectindex", 3);
                          setState(() {
                            selectIndex = 3;
                          });
                          Get.off(MyTrainigAndEarningScreen(),
                              transition: Transition.noTransition);
                        }),
                    _createDrawerItem(
                        icon: Icons.home,
                        img: "images/My Competition.png",
                        text: 'My Competition',
                        selectIndx: 4,
                        selectedImg: "images/My Competition.png",
                        onTap: () async {
                          var pref = await SharedPreferences.getInstance();
                          pref.setInt("selectindex", 4);
                          setState(() {
                            selectIndex = 4;
                          });
                          Get.off(AuditionAndCompitition(),
                              transition: Transition.noTransition);
                        }),
                    _createDrawerItem(
                        icon: Icons.home,
                        img: "images/Audition.png",
                        text: 'Audition',
                        selectIndx: 5,
                        selectedImg: "images/Audition.png",
                        onTap: () async {
                          var pref = await SharedPreferences.getInstance();
                          pref.setInt("selectindex", 5);
                          setState(() {
                            selectIndex = 5;
                          });
                          Get.off(
                              AuditionAndCompitition(
                                initIndex: 1,
                              ),
                              transition: Transition.noTransition);
                        }),
                    _createDrawerItem(
                        icon: Icons.home,
                        img: "images/Bookmark.png",
                        text: 'Bookmark',
                        selectIndx: 6,
                        selectedImg: "images/Bookmark.png",
                        onTap: () async {
                          var pref = await SharedPreferences.getInstance();
                          pref.setInt("selectindex", 6);
                          setState(() {
                            selectIndex = 6;
                          });
                          Get.to(
                              ProfileScreen(
                                index: 2,
                              ),
                              transition: Transition.noTransition);
                        }),
                    _createDrawerItem(
                        icon: Icons.home,
                        img: "images/Collaborators.png",
                        text: 'Collaborators',
                        selectIndx: 7,
                        selectedImg: "images/Collaborators.png",
                        onTap: () async {
                          var pref = await SharedPreferences.getInstance();
                          pref.setInt("selectindex", 7);
                          setState(() {
                            selectIndex = 7;
                          });
                          Get.off(
                              HomeScreen(
                                barTitle: "Collaborators",
                              ),
                              transition: Transition.noTransition);
                        }),
                    _createDrawerItem(
                        icon: Icons.home,
                        img: "images/Follow Requests.png",
                        text: 'Follow Requests',
                        selectIndx: 8,
                        selectedImg: "images/Follow Requests.png",
                        onTap: () async {
                          var pref = await SharedPreferences.getInstance();
                          pref.setInt("selectindex", 8);
                          setState(() {
                            selectIndex = 8;
                          });
                        }),
                    _createDrawerItem(
                        icon: Icons.home,
                        img: "images/Settings.png",
                        text: 'Settings',
                        selectIndx: 9,
                        selectedImg: "images/Settings.png",
                        onTap: () async {
                          var pref = await SharedPreferences.getInstance();
                          pref.setInt("selectindex", 9);
                          setState(() {
                            selectIndex = 9;
                          });
                        }),
                    _createDrawerItem(
                        icon: Icons.home,
                        img: "images/Marketplace.png",
                        text: 'Marketplace',
                        selectIndx: 10,
                        selectedImg: "images/Marketplace.png",
                        commingson: true,
                        onTap: () async {
                          var pref = await SharedPreferences.getInstance();
                          pref.setInt("selectindex", 10);
                          setState(() {
                            selectIndex = 10;
                          });
                        }),
                    _createDrawerItem(
                        icon: Icons.home,
                        img: "images/help.png",
                        text: 'Help & FAQs',
                        selectIndx: 11,
                        selectedImg: "images/help.png",
                        onTap: () async {
                          var pref = await SharedPreferences.getInstance();
                          pref.setInt("selectindex", 11);
                          setState(() {
                            selectIndex = 11;
                          });
                        }),

                    UIHelper.verticalSpaceMd,
                    _createDrawerItem(
                        icon: Icons.home,
                        img: "images/Logout.png",
                        text: 'Logout',
                        selectIndx: 0,
                        selectedImg: "images/Logout.png",
                        onTap: () async {
                          var pref = await SharedPreferences.getInstance();
                          pref.setInt("selectindex", 0);
                          setState(() {
                            selectIndex = 0;
                          });
                          Get.off(AuthenticationScreen(),
                              transition: Transition.noTransition);
                        }),
                    // Navigator.pushReplacementNamed(context, Routes.chatlist)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget drawerHeader() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://cdn.pixabay.com/photo/2015/01/06/16/14/woman-590490__340.jpg'),
                radius: 28,
              ),
              Spacer(),
              Image.asset(
                "images/drawersearch.png",
                width: 40,
                height: 40,
              )
            ],
          ),
          UIHelper.verticalSpaceSm,
          Text(
            "Shantanu",
            style: textStyleRubicRegular(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }

  Widget _createDrawerItem(
      {IconData? icon,
      String? text,
      GestureTapCallback? onTap,
      var img,
      var selectIndx,
      var selectedImg,
      bool? isSelected,
      var commingson}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: ListTile(
        onTap: onTap,
        contentPadding: EdgeInsets.zero,
        leading: Image.asset(
          img,
          width: 30,
          height: 30,
        ),
        title: Text(
          text!,
          style: textStyleRubicRegular(
              fontSize: 15,
              fontWeight: text == "Logout" ? FontWeight.bold : FontWeight.w500,
              color: Colors.black),
        ),
        subtitle: commingson != null
            ? Text(
                "Comming Soon",
                style: textStyleRubicRegular(color: AppTheme.primaryColor),
              )
            : null,
        trailing: text == "Logout"
            ? Image.asset(
                "images/Logoutprofile.png",
                width: 30,
                height: 30,
              )
            : null,
      ),
    );
  }

  void getPref() async {
    var pref = await SharedPreferences.getInstance();
    if (pref.getString("unreadcount") != null) {
      setState(() {
        unreadMessages = pref.getString("unreadcount")!;
      });
    }
  }
}
