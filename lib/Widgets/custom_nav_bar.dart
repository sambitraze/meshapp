import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meshapp/Home/home_screen.dart';
import 'package:meshapp/Screens/ArtistsProfile/artist_profile_screen.dart';
import 'package:meshapp/Screens/AuditionAndCompetition/audition_competition_screen.dart';
import 'package:meshapp/Screens/Win/Model/artist_model.dart';
import 'package:meshapp/Screens/Win/Model/experience_model.dart';
import 'package:meshapp/Screens/Win/Model/skill_model.dart';
import 'package:meshapp/Screens/Win/Model/social_model.dart';
import 'package:meshapp/Screens/Win/Model/training_model.dart';
import 'package:meshapp/Screens/Win/win_screen.dart';
import 'package:meshapp/UIController/app_theme.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class MyCustomNav extends StatefulWidget {
  int? currentState;
  var color;
  MyCustomNav(this.currentState, {this.color});
  @override
  _MyCustomNavState createState() => _MyCustomNavState();
}

class _MyCustomNavState extends State<MyCustomNav> {
  bool isSpecialUser = false;
  bool isHome = false;
  bool isArtist = false;
  bool isAudtion = false;
  bool isProfile = false;
  bool isWhereDrop = false;

  bool allowNotification = false;
  bool allowLocation = false;

  bool isHomeClicked = false;
  int isClickedNum = 0;
  var pref;

  DateTime? currentBackPressTime;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPref();
    selectedState();

    //fcmCallback();
  }

  Future<void> getPref() async {
    pref = await SharedPreferences.getInstance();
    isSpecialUser = pref.getBool('special_user');
  }

  void selectedState() {
    switch (widget.currentState) {
      case 0:
        setState(() {
          isHome = true;
          isArtist = false;
          isAudtion = false;
          isProfile = false;
          isWhereDrop = false;
        });
        break;
      case 1:
        setState(() {
          isHome = false;
          isArtist = true;
          isAudtion = false;
          isProfile = false;
          isWhereDrop = false;
        });
        break;
      case 2:
        setState(() {
          isHome = false;
          isArtist = false;
          isAudtion = true;
          isProfile = false;
          isWhereDrop = false;
        });
        break;
      case 3:
        setState(() {
          isHome = false;
          isArtist = false;
          isAudtion = false;
          isProfile = true;
          isWhereDrop = false;
        });
        break;
      case 3:
        setState(() {
          isHome = false;
          isArtist = false;
          isAudtion = false;
          isProfile = true;
          isWhereDrop = false;
        });
        break;
      case 4:
        setState(() {
          isHome = false;
          isArtist = false;
          isAudtion = false;
          isProfile = false;
          isWhereDrop = true;
        });
        break;
      default:
    }
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
        child: Container(
          height: MediaQuery.of(context).size.height * 0.1,
          color: widget.color ?? Colors.white,
          padding: EdgeInsets.only(left: 15, right: 15, bottom: 10),
          child: Container(
            height: 80,
            decoration: new BoxDecoration(

                //     gradient: new LinearGradient(
                //         colors: [
                //           Color(0xFF#56CCF2"),
                //           Color(0xFF#2F80ED"),
                //         ],
                //         begin: const FractionalOffset(1.0, 0.0),
                //         end: const FractionalOffset(1.0, 1.0),
                //         stops: [0.0, 1.0],
                //         tileMode: TileMode.clamp),
                //     boxShadow: [
                //       new BoxShadow(
                //         color: Colors.grey[500],
                //         blurRadius: 0.0,
                //         spreadRadius: 0.0,
                //       )
                //]
                ),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  InkWell(
                      onTap: () async {
                        setState(() {
                          widget.currentState = 0;
                          selectedState();
                          Get.off(HomeScreen(),
                              transition: Transition.noTransition);
                          // Get.to(HomeScreen(),
                          //     transition: Transition.noTransition);
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          isHome
                              ? Align(
                                  alignment: Alignment.center,
                                  child: Image.asset(
                                    "images/home.png",
                                    color: AppTheme.primaryColor,
                                    width: 30,
                                  ))
                              : Align(
                                  alignment: Alignment.center,
                                  child: Image.asset(
                                    "images/home.png",
                                    width: 30,
                                  )),
                        ],
                      )),
                  Spacer(),
                  InkWell(
                      onTap: () async {
                        setState(() {
                          widget.currentState = 1;
                          selectedState();
                        });
                        Get.off(WinScreen(),
                            transition: Transition.noTransition);

                        // Navigator.pushReplacement(
                        //   context,
                        //   PageRouteBuilder(
                        //     pageBuilder: (_, __, ___) => FlashCardList(),
                        //     transitionDuration: Duration(seconds: 0),
                        //   ),
                        // );

                        if (pref.getInt("navAt") != 1) {
                          pref.setInt("navAt", 1);
                        }
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          isArtist
                              ? Align(
                                  alignment: Alignment.center,
                                  child: Image.asset(
                                    "images/vector.png",
                                    color: AppTheme.primaryColor,
                                    width: 30,
                                    height: 30,
                                  ))
                              : Align(
                                  alignment: Alignment.center,
                                  child: Image.asset(
                                    "images/vector.png",
                                    width: 30,
                                    height: 30,
                                  )),
                        ],
                      )),
                  Spacer(),
                  Spacer(),
                  InkWell(
                      onTap: () {
                        setState(() {
                          widget.currentState = 2;
                          selectedState();
                        });
                        // Get.to(AuditionAndCompitition(),
                        //     transition: Transition.noTransition);
                        Navigator.pushReplacement(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (_, __, ___) =>
                                AuditionAndCompitition(),
                            transitionDuration: Duration(seconds: 0),
                          ),
                        );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          isAudtion
                              ? Align(
                                  alignment: Alignment.center,
                                  child: Image.asset(
                                    "images/speaker.png",
                                    color: AppTheme.primaryColor,
                                    width: 30,
                                  ))
                              : Align(
                                  alignment: Alignment.center,
                                  child: Image.asset(
                                    "images/speaker.png",
                                    width: 30,
                                  )),
                        ],
                      )),
                  Spacer(),
                  InkWell(
                      onTap: () {
                        setState(() {
                          widget.currentState = widget.currentState;
                          selectedState();
                        });

                        // Timer(Duration(milliseconds: 700), () {
                        //   Navigator.push(
                        //       context, const HomeScreen();
                        // });
                        ArtistModel model = ArtistModel(
                            name: "James Bute",
                            designation: "Artist",
                            image:
                                "https://cdn.pixabay.com/photo/2015/01/06/16/14/woman-590490__340.jpg",
                            gender: "Male",
                            age: "21",
                            folloers: "312",
                            followings: "102",
                            about:
                                "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.Read More",
                            experience:
                                "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.Read More",
                            training:
                                "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.Read More",
                            skills: [
                              SkillModel(
                                  title: "Theatre", color: Colors.purple),
                              SkillModel(title: "Music", color: Colors.red),
                              SkillModel(title: "Art", color: Colors.pink),
                              SkillModel(
                                  title: "Modeling", color: Colors.green),
                              SkillModel(
                                  title: "Others", color: Colors.lightBlue)
                            ],
                            experiences: [
                              ExperienceModel(
                                  title: "Videography 1 Year",
                                  color: Colors.purple),
                              ExperienceModel(
                                  title: "Photography 2 years",
                                  color: Colors.red),
                              ExperienceModel(
                                  title: "Modeling 1 year",
                                  color: Colors.green),
                            ],
                            trainingTags: [
                              TrainingModel(
                                  title: "Doodle 1 year 1 month",
                                  color: Colors.purple),
                              TrainingModel(
                                  title: "ETC 1 year", color: Colors.red),
                            ],
                            listPostImages: [
                              "https://media.istockphoto.com/photos/futuristic-woman-dance-pose-picture-id1300011415?b=1&k=20&m=1300011415&s=170667a&w=0&h=h5e59yQQtlu6mZyvispB2YmiYyWu3jB35tsXhRtboFU=",
                              "https://images.unsplash.com/photo-1547153760-18fc86324498?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8ZGFuY2V8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60",
                              "https://images.unsplash.com/photo-1535525153412-5a42439a210d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8ZGFuY2V8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60",
                              "https://images.unsplash.com/photo-1541904845547-0eaf866de232?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fGRhbmNlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60",
                              "https://images.unsplash.com/photo-1495791185843-c73f2269f669?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fGRhbmNlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60"
                            ],
                            listPostVideos: [
                              "https://storage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4",
                              "https://storage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4",
                              "https://storage.googleapis.com/gtv-videos-bucket/sample/ForBiggerMeltdowns.mp4",
                              "https://storage.googleapis.com/gtv-videos-bucket/sample/SubaruOutbackOnStreetAndDirt.mp4",
                            ],
                            listSocial: [
                              SocialModel(
                                  platform: "Facebook",
                                  image: "images/facebook.png"),
                              SocialModel(
                                  platform: "Twitter",
                                  image: "images/twitter.png"),
                              SocialModel(
                                  platform: "Linkdlin",
                                  image: "images/linkdlin.png"),
                              SocialModel(
                                  platform: "Instagram",
                                  image: "images/insta.png")
                            ]);

                        Get.to(ArtistProfileScreen(
                          true,
                          model: model,
                        ));
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          isProfile
                              ? Align(
                                  alignment: Alignment.center,
                                  child: Image.asset(
                                    "images/circleprofile.png",
                                    color: AppTheme.primaryColor,
                                    width: 30,
                                  ))
                              : Align(
                                  alignment: Alignment.center,
                                  child: Image.asset(
                                    "images/circleprofile.png",
                                    width: 30,
                                  )),
                        ],
                      )),
                ],
              ),
            ),
          ),
        ));
  }
}
