import 'package:flutter/material.dart';
import 'package:meshapp/UIController/text_styles.dart';
import 'package:meshapp/core/helpers/ui_helpers.dart';

class ShareButton extends StatefulWidget {
  ShareButton();

  @override
  _ShareButtonState createState() => _ShareButtonState();
}

class _ShareButtonState extends State<ShareButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Image.asset(
            "images/share.png",
            width: 18,
            height: 16,
          ),
          UIHelper.horizontalSpaceMini,
          Text("Share",
              style: textStyleRubicRegular(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.black))
        ],
      ),
    );
  }
}
