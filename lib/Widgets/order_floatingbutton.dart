import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meshapp/Screens/AddPost/postadd_screen.dart';
import 'package:meshapp/UIController/app_theme.dart';
import 'dart:math' as math;

import 'custom_text.dart';

class OrderFloatingButton extends StatelessWidget {
  const OrderFloatingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: FloatingActionButton(
        onPressed: () {
          Get.to(PostAddScreen());
        },
        child: Transform.rotate(
          angle: 45 * math.pi / 180,
          child: Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: AppTheme.primaryColor,
              borderRadius: BorderRadius.circular(23),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 7,
                  offset: Offset(3, 0), // changes position of shadow
                ),
              ],
            ),
            child: Center(
                child: Transform.rotate(
              angle: -45 * math.pi / 180,
              child: Image.asset(
                "images/plus.png",
                width: 20,
                height: 20,
              ),
            )),
          ),
        ),
        backgroundColor: AppTheme.primaryColor,
        elevation: 10,
        splashColor: Colors.grey,
      ),
    );
  }
}
