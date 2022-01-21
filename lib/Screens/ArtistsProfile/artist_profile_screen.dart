import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:meshapp/Screens/ArtistsProfile/Views/profile_pager.dart';
import 'package:meshapp/Screens/ArtistsProfile/Widgets/follow_box_widget.dart';
import 'package:meshapp/Screens/Win/Controller/artist_controller.dart';
import 'package:meshapp/Screens/Win/Model/artist_model.dart';
import 'package:meshapp/UIController/app_theme.dart';
import 'package:meshapp/UIController/text_styles.dart';
import 'package:meshapp/Widgets/custom_button.dart';
import 'package:meshapp/Widgets/custom_viewpager.dart';
import 'package:meshapp/core/helpers/ui_helpers.dart';
import 'package:get/get.dart';

class ArtistProfileScreen extends StatefulWidget {
  ArtistModel? model;
  bool isUserProfile;
  ArtistProfileScreen(this.isUserProfile, {Key? key, this.model})
      : super(key: key);

  @override
  _ArtistProfileScreenState createState() => _ArtistProfileScreenState();
}

class _ArtistProfileScreenState extends State<ArtistProfileScreen> {
  bool isFollow = false;
  bool isBusiness = false;
  bool isEdit = false;

  @override
  Widget build(BuildContext context) {
    Get.put(ArtistController());
    Size size = UIHelper.getScreenSize(context);
    return GetBuilder<ArtistController>(builder: (builder) {
      isFollow = builder.isFollowing(widget.model);
      return Scaffold(
        appBar: appbar(),
        body: Container(
          width: size.width,
          height: size.height,
          child: Column(
            children: [
              UIHelper.verticalSpaceSm,
              Hero(
                tag: "artist" + widget.model!.name,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(widget.model!.image),
                  radius: 45,
                ),
              ),
              UIHelper.verticalSpaceSm,
              Text(widget.model!.name,
                  style: textStyleRubicRegular(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 20)),
              UIHelper.verticalSpaceSm,
              Text(
                widget.model!.gender + " | " + "Age ${widget.model!.age}",
                style: textStyleRubicRegular(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              artistFollowDetails(),
              UIHelper.verticalSpaceSm,
              !widget.isUserProfile
                  ? followbuttons(size, builder)
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Container(
                        height: 45,
                        child: Row(
                          children: [
                            Expanded(
                              child: CustomButton(
                                () {
                                  setState(() {
                                    isEdit = true;
                                  });
                                },
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
                            UIHelper.horizontalSpaceSm,
                            Expanded(
                              child: CustomButton(
                                () {
                                  Get.defaultDialog(
                                      title: isBusiness
                                          ? "Switch To user"
                                          : "Switch To Business",
                                      contentPadding: EdgeInsets.all(10),
                                      titlePadding: EdgeInsets.all(10),
                                      content: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(isBusiness
                                            ? "Are you sure you want to switch to user account?"
                                            : "Are you sure you want to switch to business account?"),
                                      ),
                                      onCancel: () {},
                                      onConfirm: () {
                                        setState(() {
                                          isBusiness = !isBusiness;
                                        });
                                        Get.back();
                                      },
                                      textConfirm: "Yes",
                                      textCancel: "No");
                                },
                                text: isBusiness
                                    ? "Switch to user"
                                    : "Switch to business",
                                fsize: 14.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
              UIHelper.verticalSpaceSm,
              !isBusiness
                  ? ProfileViewPager(
                      model: widget.model,
                    )
                  : Container(
                      child: Expanded(
                        child: CustomViewPager(
                          listTags: ["ABOUT", "SOCIAL"],
                          listViews: [
                            Container(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 20),
                                child: Text(
                                  "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet\n\n\nType : Private\nIndustry : Entertainment\nFounded : 2020\nLocation : Mysore",
                                  style: textStyleRubicRegular(
                                      color: Colors.black, fontSize: 14.0),
                                ),
                              ),
                            ),
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    socialTag(
                                        image: "images/facebook.png",
                                        platform: "facebook.com/",
                                        platformId: "facebookId",
                                        hint: "Your facebookId"),
                                    socialTag(
                                        image: "images/insta.png",
                                        platform: "Instagram.com/",
                                        platformId: "instagramId",
                                        hint: "Your instaId"),
                                    socialTag(
                                        image: "images/linkdlin.png",
                                        platform: "linkdlin.com/",
                                        platformId: "linkdlinId",
                                        hint: "Your linkdlinId"),
                                    socialTag(
                                        image: "images/twitter.png",
                                        platform: "twitter.com/",
                                        platformId: "twitterId",
                                        hint: "Your twitterId"),
                                    UIHelper.verticalSpaceMd,
                                    Row(
                                      children: [
                                        Expanded(
                                            child: CustomButton(
                                          () {
                                            setState(() {
                                              isEdit = false;
                                            });
                                          },
                                          text: "Cancel",
                                          color: Colors.white,
                                          textcolor: AppTheme.primaryColor,
                                        )),
                                        UIHelper.horizontalSpaceMd,
                                        Expanded(
                                            child: CustomButton(
                                          () {
                                            setState(() {
                                              isEdit = false;
                                            });
                                          },
                                          text: "SAVE",
                                        ))
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
            ],
          ),
        ),
      );
    });
  }

  ListTile socialTag({var image, var platform, var hint, var platformId}) {
    return ListTile(
      leading: Image.asset(image, width: 30),
      title: !isEdit
          ? RichText(
              text: TextSpan(children: [
              TextSpan(
                  text: platform,
                  style: textStylemanropeRegular(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 16)),
              TextSpan(
                  text: platformId,
                  style: textStylemanropeRegular(
                      color: AppTheme.primaryColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 14))
            ]))
          : Row(
              children: [
                Text(platform,
                    style: textStylemanropeRegular(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 16)),
                Expanded(
                    child: TextField(
                  decoration:
                      InputDecoration(hintText: hint, border: InputBorder.none),
                ))
              ],
            ),
    );
  }

  Row followbuttons(Size size, ArtistController builder) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: size.width * 0.4,
          height: 50,
          child: CustomButton(
            () {
              isFollow
                  ? builder.removeFollow(widget.model)
                  : builder.addFollow(widget.model);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                isFollow
                    ? Image.asset(
                        "images/following.png",
                        width: 25,
                        height: 25,
                        color: Colors.white,
                      )
                    : Image.asset(
                        "images/addfollow.png",
                        width: 25,
                        height: 25,
                        color: Colors.white,
                      ),
                Text(!isFollow ? "Follow" : "Following",
                    style: textStyleRubicRegular(fontSize: 14))
              ],
            ),
          ),
        ),
        SizedBox(
          width: isFollow ? 20 : 0,
        ),
        isFollow
            ? Container(
                width: size.width * 0.4,
                height: 50,
                child: CustomButton(
                  () {},
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        "images/messages.png",
                        width: 25,
                        height: 25,
                      ),
                      Text("Message",
                          style: textStyleRubicRegular(
                              fontSize: 14, color: AppTheme.primaryColor))
                    ],
                  ),
                ),
              )
            : Container(),
      ],
    );
  }

  Container artistFollowDetails() {
    return Container(
      height: 75,
      width: 300,
      child: Row(
        children: <Widget>[
          FollowBoxWidget(
            title: "Following",
            number: widget.model!.followings,
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
            number: widget.model!.folloers,
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
