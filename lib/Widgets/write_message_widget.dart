import 'package:flutter/material.dart';
import 'package:meshapp/UIController/text_styles.dart';
import 'package:meshapp/core/helpers/ui_helpers.dart';

class WriteMessageCotainer extends StatelessWidget {
  TextEditingController? controller;
  Function()? onSend;
  var backcolor;
  var textColor;
  var prefix;
  var hint;

  WriteMessageCotainer(
      {this.controller,
      this.onSend,
      this.backcolor,
      this.prefix,
      this.textColor,
      this.hint});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: Card(
              color: backcolor ?? Colors.white.withOpacity(0.5),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              elevation: 10,
              child: Row(
                children: [
                  prefix ??
                      Container(
                        width: 0,
                        height: 0,
                      ),
                  Expanded(
                    child: Container(
                      height: 50,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: TextField(
                        controller: controller,
                        style: textStyleRubicRegular(
                            color: textColor ?? Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                        decoration: InputDecoration(
                            hintText: hint ?? "Write a comment..",
                            hintStyle: textStyleRubicRegular(
                                color: textColor ?? Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                            border: InputBorder.none),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25)),
                    ),
                  ),
                ],
              ),
            ),
          ),
          UIHelper.horizontalSpaceSm,
          GestureDetector(
            onTap: onSend,
            child: Container(
                width: 55,
                height: 55,
                child: Card(
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Image.asset(
                      "images/Path.png",
                      width: 25,
                      height: 25,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                )),
          )
        ],
      ),
    );
  }
}
