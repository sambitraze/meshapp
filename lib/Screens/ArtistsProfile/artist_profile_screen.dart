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
import 'package:meshapp/core/helpers/ui_helpers.dart';
import 'package:get/get.dart';

class ArtistProfileScreen extends StatefulWidget {
  ArtistModel? model;
  ArtistProfileScreen({Key? key, this.model}) : super(key: key);

  @override
  _ArtistProfileScreenState createState() => _ArtistProfileScreenState();
}

class _ArtistProfileScreenState extends State<ArtistProfileScreen> {
  bool isFollow = false;
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
              followbuttons(size, builder),
              UIHelper.verticalSpaceSm,
              ProfileViewPager(
                model: widget.model,
              )
            ],
          ),
        ),
      );
    });
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
