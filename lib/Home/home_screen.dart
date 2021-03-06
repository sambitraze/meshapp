import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meshapp/Home/Controller/home_post_controller.dart';
import 'package:meshapp/Home/Views/home_posts.dart';
import 'package:meshapp/Home/Widgets/search_widget.dart';
import 'package:meshapp/Screens/AddPost/Widget/tabbar_widget.dart';
import 'package:meshapp/UIController/app_theme.dart';
import 'package:meshapp/UIController/text_styles.dart';
import 'package:meshapp/Home/Widgets/home_appbar.dart';
import 'package:meshapp/Widgets/app_drawer.dart';
import 'package:meshapp/Widgets/custom_nav_bar.dart';
import 'package:meshapp/Widgets/order_floatingbutton.dart';
import 'package:meshapp/core/helpers/ui_helpers.dart';

import 'Views/home_question_posts.dart';

class HomeScreen extends StatefulWidget {
  var barTitle;
  HomeScreen({Key? key, this.barTitle}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Get..put(HomePostController());
    Size size = UIHelper.getScreenSize(context);
    return GetBuilder<HomePostController>(builder: (builder) {
      return Scaffold(
        key: UIHelper.scaffoldKey,
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterDocked,
        floatingActionButton: OrderFloatingButton(),
        bottomNavigationBar: MyCustomNav(0),
        drawer: AppDrawer(),
        body: Container(
          padding: EdgeInsets.all(10),
          width: size.width,
          height: size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              HomeAppBar(
                barTitile: !builder.isHome ? "Collaborators" : "EXPLORE",
              ),
              UIHelper.verticalSpaceSm,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: HomeSearchWidget(),
              ),
              UIHelper.verticalSpaceSm,
              PostTabbarWidget(
                listTags: ["Posts", "Questions"],
                listViews: [
                  // first tab bar view widget
                  HomePostsView(),
                  HomeQuestionPosts(),
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}
