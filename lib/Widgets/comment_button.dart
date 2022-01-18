import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meshapp/Home/comment_screen.dart';
import 'package:meshapp/UIController/text_styles.dart';
import 'package:meshapp/core/helpers/ui_helpers.dart';

class CommentButton extends StatefulWidget {
  bool? isLiked;
  int? Count;
  CommentButton({this.isLiked, this.Count});

  @override
  _CommentButtonState createState() => _CommentButtonState();
}

class _CommentButtonState extends State<CommentButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(CommentScreen());
      },
      child: Container(
        child: Row(
          children: [
            widget.isLiked!
                ? Image.asset(
                    "images/Comment.png",
                    width: 18,
                    height: 16,
                  )
                : Image.asset(
                    "images/Comment.png",
                    width: 18,
                    height: 16,
                  ),
            UIHelper.horizontalSpaceMini,
            Text(widget.Count.toString(),
                style: textStyleRubicRegular(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.black))
          ],
        ),
      ),
    );
  }
}
