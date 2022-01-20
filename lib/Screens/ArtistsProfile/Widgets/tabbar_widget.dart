import 'dart:io';

import 'package:flutter/material.dart';
import 'package:meshapp/Home/Views/home_posts.dart';
import 'package:meshapp/Home/Views/home_question_posts.dart';
import 'package:meshapp/Screens/Win/Model/artist_model.dart';
import 'package:meshapp/UIController/app_theme.dart';
import 'package:meshapp/UIController/text_styles.dart';
import 'package:meshapp/Widgets/custom_button.dart';
import 'package:meshapp/core/helpers/ui_helpers.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class ProfileTabbarWidget extends StatefulWidget {
  ArtistModel? model;
  ProfileTabbarWidget({this.model});
  @override
  _ProfileTabbarWidgetState createState() => _ProfileTabbarWidgetState();
}

class _ProfileTabbarWidgetState extends State<ProfileTabbarWidget>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
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
      padding: const EdgeInsets.all(8.0),
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
                  text: 'SOCIALS',
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
                          widget.model!.listPostImages!.length, (index) {
                        return Stack(
                          children: [
                            Container(
                                width: size.width * 0.29,
                                height: size.width * 0.29,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          widget.model!.listPostImages![index]),
                                    ))),
                            Positioned(
                                right: 10,
                                bottom: 10,
                                child: Image.asset(
                                  "images/expand.png",
                                  width: 20,
                                  height: 20,
                                ))
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
                          widget.model!.listPostVideos!.length, (index) {
                        return Stack(
                          children: [
                            FutureBuilder<String>(
                                future: getThumbnail(
                                        widget.model!.listPostVideos![index])
                                    .then((value) {
                                  return value;
                                }),
                                builder: (context, snap) {
                                  print(".." + snap.data.toString());

                                  return snap.data == null
                                      ? Container()
                                      : Container(
                                          width: size.width * 0.29,
                                          height: size.width * 0.29,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: FileImage(File(
                                                      snap.data.toString())))),
                                        );
                                }),
                            Positioned(
                                right: 50,
                                bottom: 50,
                                child:
                                    Icon(Icons.play_arrow, color: Colors.white))
                          ],
                        );
                      }),
                    ),
                  ),
                ),

                //social buttons
                SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.only(top: 30),
                    child: Wrap(
                      runSpacing: 15,
                      spacing: 25,
                      alignment: WrapAlignment.center,
                      children: List.generate(widget.model!.listSocial!.length,
                          (index) {
                        return Stack(
                          children: [
                            Container(
                              width: size.width * 0.3,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Image.asset(
                                    widget.model!.listSocial![index].image,
                                    width: 50,
                                    height: 50,
                                  ),
                                  UIHelper.verticalSpaceMd,
                                  CustomButton(
                                    () {},
                                    text: "Connect",
                                    height: 40.0,
                                  )
                                ],
                              ),
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
  


  Future<dynamic> getThumbnail(url) async {
    final fileName = await VideoThumbnail.thumbnailFile(
        video: url,
        thumbnailPath: (await getTemporaryDirectory()).path,
        imageFormat: ImageFormat.WEBP,
        maxHeight:
            64, // specify the height of the thumbnail, let the width auto-scaled to keep the source aspect ratio
        quality: 75,
        timeMs: 1000);
    print("??" + fileName!);
    return fileName;
  }
}
