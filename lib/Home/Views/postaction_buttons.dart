import 'package:flutter/material.dart';
import 'package:meshapp/Widgets/comment_button.dart';
import 'package:meshapp/Widgets/like_button.dart';
import 'package:meshapp/Widgets/share_button.dart';
import 'package:meshapp/core/helpers/ui_helpers.dart';

class PostActionButtons extends StatefulWidget {
  const PostActionButtons({Key? key}) : super(key: key);

  @override
  _PostActionButtonsState createState() => _PostActionButtonsState();
}

class _PostActionButtonsState extends State<PostActionButtons> {
  @override
  Widget build(BuildContext context) {
    bool isLike = true;
    return Container(
      child: Row(
        children: [
          LikeButton(
            isLiked: isLike,
            Count: 385,
            ontap: () {
              setState(() {
                isLike = !isLike;
              });
            },
          ),
          UIHelper.horizontalSpaceSm,
          CommentButton(
            isLiked: true,
            Count: 10,
          ),
          UIHelper.horizontalSpaceSm,
          ShareButton(),
          Spacer(),
          Image.asset(
            "images/Bookmark.png",
            width: 18,
            height: 16,
          )
        ],
      ),
    );
  }
}
