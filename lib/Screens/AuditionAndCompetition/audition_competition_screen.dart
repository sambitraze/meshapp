import 'package:flutter/material.dart';
import 'package:meshapp/Screens/AddPost/Widget/tabbar_widget.dart';
import 'package:meshapp/Widgets/custom_nav_bar.dart';
import 'package:meshapp/Widgets/order_floatingbutton.dart';
import 'package:meshapp/core/helpers/ui_helpers.dart';

import 'Competition/Views/competition_view.dart';

class AuditionAndCompitition extends StatefulWidget {
  var initIndex;
  AuditionAndCompitition({Key? key, this.initIndex}) : super(key: key);

  @override
  _AuditionAndCompititionState createState() => _AuditionAndCompititionState();
}

class _AuditionAndCompititionState extends State<AuditionAndCompitition> {
  @override
  Widget build(BuildContext context) {
    Size size = UIHelper.getScreenSize(context);
    return Scaffold(
        backgroundColor: Color(0xffF5F7FC),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterDocked,
        floatingActionButton: OrderFloatingButton(),
        bottomNavigationBar: MyCustomNav(2),
        body: Container(
          width: size.width,
          height: size.height,
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).padding.top + 10,
              ),
              PostTabbarWidget(
                listTags: ["Competition", "Auditions"],
                listViews: [
                  CompetitionView(true),
                  // first tab bar view widget
                  CompetitionView(false),
                ],
                initIndex: widget.initIndex,
              ),
            ],
          ),
        ));
  }
}
