import 'package:flutter/material.dart';
import 'package:meshapp/Screens/AddPost/Widget/tabbar_widget.dart';
import 'package:meshapp/Screens/TrainingAndEarning/MyEarning/my_earning_screen.dart';
import 'package:meshapp/Screens/TrainingAndEarning/MyTraing/View/mytraining_view.dart';
import 'package:meshapp/Widgets/custom_nav_bar.dart';
import 'package:meshapp/Widgets/order_floatingbutton.dart';
import 'package:meshapp/core/helpers/ui_helpers.dart';

class MyTrainigAndEarningScreen extends StatefulWidget {
  const MyTrainigAndEarningScreen({Key? key}) : super(key: key);

  @override
  _MyTrainigAndEarningScreenState createState() =>
      _MyTrainigAndEarningScreenState();
}

class _MyTrainigAndEarningScreenState extends State<MyTrainigAndEarningScreen> {
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
          padding: EdgeInsets.all(0),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).padding.top + 10,
              ),
              PostTabbarWidget(
                listTags: ["My training", "My Earning"],
                listViews: [
                  MyTrainigMainView(true),
                  // first tab bar view widget
                  MyearningScreen()
                ],
              ),
            ],
          ),
        ));
  }
}
