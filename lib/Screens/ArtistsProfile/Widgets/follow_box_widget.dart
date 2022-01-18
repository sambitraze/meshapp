import 'package:flutter/material.dart';
import 'package:meshapp/UIController/text_styles.dart';

class FollowBoxWidget extends StatelessWidget {
  var title;
  var number;
  FollowBoxWidget({Key? key, this.number, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            child: Text(number.toString(),
                textAlign: TextAlign.left,
                style: textStyleRubicRegular(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600)),
          ),
          Container(
            child: Text(title,
                textAlign: TextAlign.center,
                style:
                    textStyleRubicRegular(fontSize: 15, color: Colors.black)),
          ),
        ],
      ),
    );
  }
}
