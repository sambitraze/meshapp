import 'package:flutter/material.dart';
import 'package:meshapp/Home/Views/postaction_buttons.dart';
import 'package:meshapp/Home/Views/user_profile_tile.dart';
import 'package:meshapp/Home/Widgets/message_tags_widget.dart';
import 'package:meshapp/Widgets/VideoPlayer/multi_manager/flick_multi_manager.dart';
import 'package:meshapp/Widgets/VideoPlayer/multi_manager/flick_multi_player.dart';
import 'package:meshapp/core/helpers/ui_helpers.dart';
import 'package:visibility_detector/visibility_detector.dart';

class HomePostsView extends StatefulWidget {
  const HomePostsView({Key? key}) : super(key: key);

  @override
  _HomePostsViewState createState() => _HomePostsViewState();
}

class _HomePostsViewState extends State<HomePostsView> {
  late FlickMultiManager flickMultiManager;

  @override
  void initState() {
    super.initState();
    flickMultiManager = FlickMultiManager();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ListView.builder(
            itemCount: 2,
            shrinkWrap: true,
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
                    index.isEven
                        ? Container(
                            height: 400,
                            margin: EdgeInsets.all(0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: FlickMultiPlayer(
                                url:
                                    "https://github.com/GeekyAnts/flick-video-player-demo-videos/blob/master/example/the_valley_compressed.mp4?raw=tru",
                                flickMultiManager: flickMultiManager,
                                image: "images/logo.png",
                                typeVideoType: "network",
                              ),
                            ))
                        : Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: Container(
                              height: 400,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          "https://cdn.pixabay.com/photo/2018/01/14/23/12/nature-3082832__480.jpg"))),
                            ),
                          ),
                    UIHelper.verticalSpaceMd,
                    PostActionButtons(),
                    UIHelper.verticalSpaceSm,
                    MessageTagWidget(
                      name: "Bishen",
                      message: "My Favourite riding 😍",
                      listTags: ["#Cricket", "#Game", "#Strome"],
                    ),
                    Divider(
                      color: Colors.black,
                    ),
                  ],
                ),
              );
            }));
  }
}
