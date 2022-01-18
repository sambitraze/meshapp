import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meshapp/Home/Controller/comment_controller.dart';
import 'package:meshapp/UIController/app_theme.dart';
import 'package:meshapp/UIController/text_styles.dart';
import 'package:meshapp/Widgets/write_message_widget.dart';
import 'package:meshapp/core/Models/comment_model.dart';
import 'package:meshapp/core/helpers/ui_helpers.dart';

import 'Widgets/message_tags_widget.dart';
import 'package:get/get.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({Key? key}) : super(key: key);

  @override
  _CommentScreenState createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  TextEditingController comController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = UIHelper.getScreenSize(context);
    Get.put(CommentController());
    return GetBuilder<CommentController>(builder: (commentController) {
      return Scaffold(
        backgroundColor: AppTheme.primaryColor,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.arrow_back, color: Colors.black)),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            "Comments",
            style: textStyleRubicRegular(
                fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Image.asset(
                "images/menucircle.png",
                width: 25,
                height: 5,
              ),
            )
          ],
        ),
        body: Container(
          width: size.width,
          height: size.height,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25)),
                  ),
                  padding: EdgeInsets.all(10),
                  child: Column(children: [
                    MessageTagWidget(
                      name: "",
                      fontSize: 18.0,
                      message:
                          "Another upcoming game strom coming soon,be ready urban city.Darklight Back 😍",
                      listTags: ["#Cricket", "#Game", "#Strome"],
                    ),
                    UIHelper.verticalSpaceMd,
                    Expanded(
                      child: ListView.builder(
                          itemCount: commentController.listComments.length,
                          itemBuilder: (context, index) {
                            CommentModel model =
                                commentController.listComments[index];
                            var timeAgo = '2m';
                            commentController
                                .getTimeAgo(model.time)
                                .then((value) {
                              timeAgo = value;
                              print(">>><" + value);
                            });
                            return commentCard(timeAgo, model);
                          }),
                    )
                  ]),
                ),
              ),
              Container(
                  height: 150,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Center(
                      child: WriteMessageCotainer(
                    controller: comController,
                    onSend: () {
                      print("send");
                      CommentModel model = new CommentModel(
                          comment: comController.text, time: DateTime.now());
                      commentController.addComment(model);
                      setState(() {
                        comController.text = "";
                      });
                    },
                  )))
            ],
          ),
        ),
      );
    });
  }

  ListTile commentCard(String timeAgo, CommentModel model) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        backgroundImage: NetworkImage(
            'https://cdn.pixabay.com/photo/2015/01/06/16/14/woman-590490__340.jpg'),
        radius: 25,
      ),
      title: Row(
        children: [
          Text("Bishen Ponnanna",
              style: textStyleRubicRegular(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.black)),
          Spacer(),
          Text(timeAgo,
              style: textStyleRubicRegular(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.black))
        ],
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(model.comment,
              style: textStyleRubicRegular(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.black)),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              commentButton(text: "Like .", onTap: () {}),
              commentButton(text: " Reply .", onTap: () {}),
              commentButton(text: " Report", onTap: () {}),
            ],
          ),
        ],
      ),
    );
  }

  Widget commentButton({var text, var onTap}) {
    return InkWell(
      onTap: onTap,
      child: Text(
        text,
        style: textStyleRubicRegular(
            fontWeight: FontWeight.w600,
            fontSize: 14,
            color: Color(0xff8A8A8F)),
      ),
    );
  }
}
