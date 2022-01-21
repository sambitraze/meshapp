import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:meshapp/UIController/text_styles.dart';
import 'package:meshapp/core/helpers/ui_helpers.dart';

class LikeButton extends StatefulWidget {
  bool? isLiked;
  int? Count;
  var ontap;
  LikeButton({this.isLiked, this.Count, this.ontap});

  @override
  _LikeButtonState createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.isLiked = !widget.isLiked!;
        });
      },
      child: Container(
        child: Row(
          children: [
            widget.isLiked!
                ? Image.asset(
                    "images/redLike.png",
                    width: 18,
                    height: 16,
                  )
                : Image.asset(
                    "images/Like.png",
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
