import 'dart:io';

import 'package:flutter/material.dart';
import 'package:meshapp/Home/Views/postaction_buttons.dart';
import 'package:meshapp/Home/Widgets/message_tags_widget.dart';
import 'package:meshapp/Screens/AddPost/Widget/tabbar_widget.dart';
import 'package:meshapp/Screens/Profile/profile_model.dart';
import 'package:meshapp/Screens/Profile/user_profile_tile.dart';
import 'package:meshapp/UIController/app_theme.dart';
import 'package:meshapp/UIController/text_styles.dart';
import 'package:meshapp/Widgets/VideoPlayer/multi_manager/flick_multi_manager.dart';
import 'package:meshapp/Widgets/VideoPlayer/multi_manager/flick_multi_player.dart';
import 'package:meshapp/core/helpers/ui_helpers.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class BookmarkView extends StatefulWidget {
  ProfileModel? model;
  BookmarkView({Key? key, this.model}) : super(key: key);

  @override
  _BookmarkViewState createState() => _BookmarkViewState();
}

class _BookmarkViewState extends State<BookmarkView>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  late FlickMultiManager flickMultiManager;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
    flickMultiManager = FlickMultiManager();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = UIHelper.getScreenSize(context);
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          // give the tab bar a height [can change hheight to preferred height]
          Container(
            height: 50,
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Color.fromRGBO(160, 155, 155, 0.25000000298023224),
              borderRadius: BorderRadius.circular(
                25.0,
              ),
            ),
            child: TabBar(
              controller: _tabController,
              // give the indicator a decoration (color and border radius)
              indicator: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.30000000149011612),
                      offset: Offset(0, 10),
                      blurRadius: 10)
                ],
                borderRadius: BorderRadius.circular(
                  25.0,
                ),
                color: Colors.white,
              ),
              labelColor: AppTheme.primaryColor,
              labelStyle: textStylemanropeRegular(fontSize: 14.0),
              unselectedLabelColor: Colors.grey,
              unselectedLabelStyle: textStylemanropeRegular(fontSize: 14.0),
              tabs: [
                // first tab [you can add an icon using the icon property]
                Tab(
                  text: 'PICTURES',
                ),

                // second tab [you can add an icon using the icon property]
                Tab(
                  text: 'VIDEOS',
                ),
                Tab(
                  text: 'QESTIONS',
                ),
              ],
            ),
          ),
          // tab bar view here
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.only(top: 10),
                    child: Wrap(
                      runSpacing: 5,
                      spacing: 5,
                      alignment: WrapAlignment.center,
                      children: List.generate(
                          widget.model!.listBookmarkImages!.length, (index) {
                        return Column(
                          children: [
                            UserProfileTile(),
                            Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              child: Container(
                                  height: 200,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(widget.model!
                                              .listBookmarkImages![index])))),
                            )
                          ],
                        );
                      }),
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.only(top: 10),
                    child: Wrap(
                      runSpacing: 5,
                      spacing: 5,
                      alignment: WrapAlignment.center,
                      children: List.generate(
                          widget.model!.listBookmarkVideos!.length, (index) {
                        return Column(
                          children: [
                            UserProfileTile(),
                            Container(
                                height: 250,
                                margin: EdgeInsets.all(0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: FlickMultiPlayer(
                                    url: widget
                                        .model!.listBookmarkVideos![index],
                                    flickMultiManager: flickMultiManager,
                                    image: "images/logo.png",
                                    typeVideoType: "network",
                                  ),
                                )),
                          ],
                        );
                      }),
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.only(top: 10),
                    child: Wrap(
                      runSpacing: 5,
                      spacing: 5,
                      alignment: WrapAlignment.center,
                      children: List.generate(
                          widget.model!.listBookmarkQuestions!.length, (index) {
                        return Column(
                          children: [
                            UserProfileTile(),
                            // UIHelper.verticalSpaceMd,
                            MessageTagWidget(
                              name: "",
                              message:
                                  widget.model!.listBookmarkQuestions![index],
                              listTags: ["#Cricket", "#Game", "#Strome"],
                            ),
                            UIHelper.verticalSpaceMd,
                            PostActionButtons(),
                            UIHelper.verticalSpaceSm,
                            Divider(
                              color: Colors.black,
                            ),
                          ],
                        );
                      }),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
