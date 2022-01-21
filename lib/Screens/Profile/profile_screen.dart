import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:meshapp/Screens/ArtistsProfile/Views/profile_pager.dart';
import 'package:meshapp/Screens/ArtistsProfile/Widgets/follow_box_widget.dart';
import 'package:meshapp/Screens/Profile/post_view.dart';
import 'package:meshapp/Screens/Profile/profile_controller.dart';
import 'package:meshapp/Screens/Profile/question_view.dart';
import 'package:meshapp/Screens/Win/Controller/artist_controller.dart';
import 'package:meshapp/Screens/Win/Model/artist_model.dart';
import 'package:meshapp/UIController/app_theme.dart';
import 'package:meshapp/UIController/text_styles.dart';
import 'package:meshapp/Widgets/custom_button.dart';
import 'package:meshapp/Widgets/custom_viewpager.dart';
import 'package:meshapp/core/helpers/ui_helpers.dart';
import 'package:get/get.dart';

import 'bookmark_view.dart';

class ProfileScreen extends StatefulWidget {
  var index;
  ProfileScreen({Key? key, this.index}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isFollow = false;
  @override
  Widget build(BuildContext context) {
    Get.put(ProfileController());
    Size size = UIHelper.getScreenSize(context);
    return GetBuilder<ProfileController>(builder: (builder) {
      return Scaffold(
        appBar: appbar(),
        body: Container(
          width: size.width,
          height: size.height,
          child: Column(
            children: [
              UIHelper.verticalSpaceSm,
              Hero(
                tag: "artist" + builder.profileModel.name,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(builder.profileModel.image),
                  radius: 45,
                ),
              ),
              UIHelper.verticalSpaceSm,
              Text(builder.profileModel.name,
                  style: textStyleRubicRegular(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 20)),
              UIHelper.verticalSpaceSm,
              Text(
                builder.profileModel.gender +
                    " | " +
                    "Age ${builder.profileModel.age}",
                style: textStyleRubicRegular(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              artistFollowDetails(builder.profileModel),
              UIHelper.verticalSpaceSm,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Container(
                  height: 50,
                  width: 150,
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          () {},
                          color: Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("images/edit.png",
                                  color: AppTheme.primaryColor,
                                  width: 20,
                                  height: 20),
                              UIHelper.horizontalSpaceSm,
                              Text("Edit Profile",
                                  style: textStylePoppinsRegular(
                                      color: AppTheme.primaryColor))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              UIHelper.verticalSpaceSm,
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(top: 15),
                  child: CustomViewPager(
                    listTags: ["My Posts", "My Questions", "Bookmarks"],
                    listViews: [
                      PostView(
                        model: builder.profileModel,
                      ),
                      ProfileQuestionView(),
                      BookmarkView(
                        model: builder.profileModel,
                      )
                    ],
                    initialIndex: widget.index,
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }

  Container artistFollowDetails(model) {
    return Container(
      height: 75,
      width: 300,
      child: Row(
        children: <Widget>[
          FollowBoxWidget(
            title: "Following",
            number: model.followings,
          ),
          Container(
            height: 35,
            child: const VerticalDivider(
              color: Colors.grey,
              thickness: 1,
              indent: 1,
              endIndent: 0.5,
            ),
          ),
          FollowBoxWidget(
            title: "Followers",
            number: model.folloers,
          )
        ],
      ),
    );
  }

  AppBar appbar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back, color: Colors.black)),
      centerTitle: true,
      title: Text(
        "Profile",
        style: textStyleRubicRegular(
            color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
      ),
    );
  }
}
