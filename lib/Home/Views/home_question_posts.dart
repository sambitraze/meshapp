import 'package:flutter/material.dart';
import 'package:meshapp/Home/Views/postaction_buttons.dart';
import 'package:meshapp/Home/Views/user_profile_tile.dart';
import 'package:meshapp/Home/Widgets/message_tags_widget.dart';
import 'package:meshapp/Widgets/VideoPlayer/multi_manager/flick_multi_manager.dart';
import 'package:meshapp/Widgets/VideoPlayer/multi_manager/flick_multi_player.dart';
import 'package:meshapp/core/helpers/ui_helpers.dart';
import 'package:visibility_detector/visibility_detector.dart';

class HomeQuestionPosts extends StatefulWidget {
  const HomeQuestionPosts({Key? key}) : super(key: key);

  @override
  _HomeQuestionPostsState createState() => _HomeQuestionPostsState();
}

class _HomeQuestionPostsState extends State<HomeQuestionPosts> {
  late FlickMultiManager flickMultiManager;

  @override
  void initState() {
    super.initState();
    flickMultiManager = FlickMultiManager();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ListView.builder(
            physics: PageScrollPhysics(),
            itemBuilder: (context, index) {
              return VisibilityDetector(
                key: ObjectKey(flickMultiManager),
                onVisibilityChanged: (visibility) {
                  if (visibility.visibleFraction == 0 && this.mounted) {
                    flickMultiManager.pause();
                  }
                },
                child: Column(
                  children: [
                    UserProfileTile(),
                    // UIHelper.verticalSpaceMd,
                    MessageTagWidget(
                      name: "",
                      message:
                          "Another upcoming game strom coming soon,be ready urban city.Darklight Back 😍",
                      listTags: ["#Cricket", "#Game", "#Strome"],
                    ),
                    UIHelper.verticalSpaceMd,
                    PostActionButtons(),
                    UIHelper.verticalSpaceSm,
                    Divider(
                      color: Colors.black,
                    ),
                  ],
                ),
              );
            }));
  }
}
