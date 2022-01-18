import 'package:flutter/material.dart';
import 'package:get/get.dart';

CustomAppBar({leadingIconColor, title, titleTextColor, backgroundColor}) {
  return AppBar(
    centerTitle: true,
    title: Text(
      title ?? "",
      style: TextStyle(color: titleTextColor ?? Colors.black),
    ),
    leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: Icon(
          Icons.arrow_back_ios,
          color: leadingIconColor ?? Colors.black,
        )),
    backgroundColor: backgroundColor ?? Colors.transparent,
    elevation: 0,
  );
}
