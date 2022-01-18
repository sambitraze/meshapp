import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  var text;
  var color;
  var fontSize;
  var weight;
  var height;
  CustomText({this.color, this.fontSize, this.height, this.text, this.weight});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color,
          fontSize: fontSize != null ? fontSize : 14.0,
          fontWeight: weight != null ? weight : FontWeight.normal,
          height: height ?? 0),
    );
  }
}
