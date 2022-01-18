import 'package:flutter/material.dart';
import 'package:meshapp/UIController/app_theme.dart';
import 'package:meshapp/UIController/text_styles.dart';
import 'package:meshapp/core/helpers/ui_helpers.dart';

class CustomButton extends StatelessWidget {
  double? width;
  var color;
  var child;
  var text;
  var textcolor;
  var weight;
  var fsize;
  var onTap;
  var height;
  CustomButton(this.onTap,
      {this.child,
      this.color,
      this.fsize,
      this.text,
      this.textcolor,
      this.weight,
      this.height,
      this.width});

  @override
  Widget build(BuildContext context) {
    Size size = UIHelper.getScreenSize(context);
    return MaterialButton(
      onPressed: onTap,
      shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: AppTheme.primaryColor),
          borderRadius: BorderRadius.circular(10)),
      minWidth: width ?? size.width,
      height: height ?? 55,
      elevation: 5,
      color: color ?? AppTheme.primaryColor,
      child: child ??
          Text(
            text,
            style: textStylemanropeRegular(
                color: textcolor ?? Colors.white,
                fontWeight: weight ?? FontWeight.normal,
                fontSize: fsize ?? 16.00),
          ),
    );
  }
}
