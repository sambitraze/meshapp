import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meshapp/Home/Views/home_posts.dart';
import 'package:meshapp/Home/Views/home_question_posts.dart';
import 'package:meshapp/Screens/AddPost/Widget/tabbar_widget.dart';
import 'package:meshapp/core/helpers/ui_helpers.dart';

import 'Views/addpostview.dart';

class PostAddScreen extends StatefulWidget {
  const PostAddScreen({Key? key}) : super(key: key);

  @override
  _PostAddScreenState createState() => _PostAddScreenState();
}

class _PostAddScreenState extends State<PostAddScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = UIHelper.getScreenSize(context);
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.arrow_back, color: Colors.black)),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Container(
          width: size.width,
          height: size.height,
          margin: EdgeInsets.symmetric(horizontal: 0),
          child: Column(
            children: [
              PostTabbarWidget(
                listTags: ["Posts", "Questions"],
                listViews: [
                  // first tab bar view widget
                  AddPostView(true),
                  AddPostView(false),
                ],
              ),
            ],
          ),
        ));
  }
}
