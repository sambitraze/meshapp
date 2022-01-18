import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meshapp/Home/Widgets/home_appbar.dart';
import 'package:meshapp/Screens/Win/Controller/artist_controller.dart';
import 'package:meshapp/Screens/Win/Model/artist_model.dart';
import 'package:meshapp/Screens/Win/Views/win_adaptor.dart';
import 'package:meshapp/Screens/Win/Widgets/win_appbar.dart';
import 'package:meshapp/UIController/text_styles.dart';
import 'package:meshapp/Widgets/app_drawer.dart';
import 'package:meshapp/Widgets/custom_button.dart';
import 'package:meshapp/Widgets/custom_nav_bar.dart';
import 'package:meshapp/Widgets/order_floatingbutton.dart';
import 'package:meshapp/core/helpers/ui_helpers.dart';

class WinScreen extends StatefulWidget {
  const WinScreen({Key? key}) : super(key: key);

  @override
  _WinScreenState createState() => _WinScreenState();
}

class _WinScreenState extends State<WinScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    Get.put(ArtistController());
    Size size = UIHelper.getScreenSize(context);
    return GetBuilder<ArtistController>(builder: (builder) {
      return Scaffold(
        key: scaffoldKey,
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterDocked,
        floatingActionButton: OrderFloatingButton(),
        bottomNavigationBar: MyCustomNav(1),
        drawer: AppDrawer(),
        body: Container(
          padding: EdgeInsets.all(10),
          width: size.width,
          height: size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              WinAppBar(scaffoldKey: scaffoldKey),
              //  UIHelper.verticalSpaceSm,
              Expanded(
                child: ListView.builder(
                    itemCount: builder.listArtists.length,
                    itemBuilder: (context, index) {
                      ArtistModel model = builder.listArtists[index];
                      return WinAdaptor(model: model);
                    }),
              ),
            ],
          ),
        ),
      );
    });
  }
}
