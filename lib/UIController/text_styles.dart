import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:get/get.dart';

const fontWeightExtraLight = FontWeight.w200;
const fontWeightLight = FontWeight.w300;
const fontWeightRegular = FontWeight.w400;
const fontWeightMedium = FontWeight.w500;
const fontWeightW600 = FontWeight.w600;
const fontWeightSemiBold = FontWeight.w700;
const fontWeightBold = FontWeight.w700;
const fontWeightExtraBold = FontWeight.w800;
const double fontMedium1 = 12.0;
TextStyle textStyleRobotoExtraLight({
  Color? color,
  double? fontSize,
}) =>
    TextStyle(
        color: color ?? Colors.black,
        fontSize: fontSize ?? fontMedium1,
        fontWeight: fontWeightExtraLight,
        letterSpacing: 0.8);

TextStyle textStyleRobotoLight({
  Color? color,
  double? fontSize,
}) =>
    TextStyle(
        color: color ?? Colors.black,
        fontSize: fontSize ?? fontMedium1,
        fontWeight: fontWeightLight,
        letterSpacing: 0.8);

TextStyle textStyleRobotoRegular({Color? color, double? fontSize}) => TextStyle(
    color: color ?? Colors.black,
    fontSize: fontSize ?? fontMedium1,
    fontWeight: fontWeightRegular,
    letterSpacing: 0.8);

TextStyle textStyleRobotoMedium({Color? color, double? fontSize}) => TextStyle(
    color: color ?? Colors.black,
    fontSize: fontSize ?? fontMedium1,
    fontWeight: fontWeightMedium,
    letterSpacing: 0.8);

TextStyle textStyleRobotoW600({Color? color, double? fontSize}) => TextStyle(
    color: color ?? Colors.black,
    fontSize: fontSize ?? fontMedium1,
    fontWeight: fontWeightW600,
    letterSpacing: 0.8);

TextStyle textStyleRobotoSemiBold({Color? color, double? fontSize}) =>
    TextStyle(
        color: color ?? Colors.black,
        fontSize: fontSize ?? fontMedium1,
        fontWeight: fontWeightSemiBold,
        letterSpacing: 0.8);

TextStyle textStyleRobotoBold({Color? color, double? fontSize}) => TextStyle(
    color: color ?? Colors.black,
    fontSize: fontSize ?? fontMedium1,
    fontWeight: fontWeightBold,
    letterSpacing: 0.8);

TextStyle textStyleRobotoSlabRegular({
  Color? color,
  double? fontSize,
  FontWeight? fontWeight,
}) =>
    GoogleFonts.robotoSlab(
        color: color ?? Colors.black,
        fontSize: fontSize ?? fontMedium1,
        fontWeight: fontWeight ?? fontWeightRegular,
        letterSpacing: 0.8);

TextStyle textStyleRobotoSlabLight({
  Color? color,
  double? fontSize,
}) =>
    GoogleFonts.robotoSlab(
        color: color ?? Colors.black,
        fontSize: fontSize ?? fontMedium1,
        fontWeight: fontWeightLight,
        letterSpacing: 0.8);

// Lato

TextStyle textStyleLatoExtraBold({
  Color? color,
  double? fontSize,
  double? letterSpacing,
}) =>
    GoogleFonts.lato(
      color: color ?? Colors.black,
      fontSize: fontSize ?? fontMedium1,
      fontWeight: fontWeightExtraBold,
      letterSpacing: letterSpacing ?? 0,
    );

TextStyle textStyleLatoSemiBold({
  Color? color,
  double? fontSize,
  double? letterSpacing,
}) =>
    GoogleFonts.lato(
      color: color != null
          ? color
          : Get.isDarkMode
              ? Colors.grey
              : Colors.black,
      fontSize: fontSize ?? fontMedium1,
      fontWeight: fontWeightSemiBold,
      letterSpacing: letterSpacing ?? 0,
    );

TextStyle textStyleLatoW600({
  Color? color,
  double? fontSize,
  double? letterSpacing,
}) =>
    GoogleFonts.lato(
      color: color ?? Colors.black,
      fontSize: fontSize ?? fontMedium1,
      fontWeight: fontWeightW600,
      letterSpacing: letterSpacing ?? 0,
    );

TextStyle textStyleLatoRegular({
  Color? color,
  double? fontSize,
  double? letterSpacing,
}) =>
    GoogleFonts.lato(
      color: color != null
          ? color
          : Get.isDarkMode
              ? Colors.white
              : Colors.black,
      fontSize: fontSize ?? fontMedium1,
      fontWeight: fontWeightRegular,
      letterSpacing: letterSpacing ?? 0,
    );

TextStyle textStyleRubicRegular(
        {Color? color,
        double? fontSize,
        double? letterSpacing,
        var height,
        FontWeight? fontWeight}) =>
    GoogleFonts.rubik(
      color: color ?? Colors.white,
      fontSize: fontSize ?? fontMedium1,
      fontWeight: fontWeight ?? fontWeightRegular,
      letterSpacing: letterSpacing ?? 0,
    );
TextStyle textStylemanropeRegular(
        {Color? color,
        double? fontSize,
        var height,
        double? letterSpacing,
        FontWeight? fontWeight}) =>
    GoogleFonts.manrope(
      color: color ?? Colors.black,
      fontSize: fontSize ?? fontMedium1,
      fontWeight: fontWeight ?? fontWeightRegular,
      letterSpacing: letterSpacing ?? 0,
    );
TextStyle textStyleInterRegular(
        {Color? color,
        double? fontSize,
        double? letterSpacing,
        FontWeight? fontWeight}) =>
    GoogleFonts.inter(
      color: color ?? Colors.black,
      fontSize: fontSize ?? fontMedium1,
      fontWeight: fontWeight ?? fontWeightRegular,
      letterSpacing: letterSpacing ?? 0,
    );
TextStyle textStylePoppinsRegular(
        {Color? color,
        double? fontSize,
        double? letterSpacing,
        FontWeight? fontWeight}) =>
    GoogleFonts.poppins(
      color: color ?? Colors.black,
      fontSize: fontSize ?? fontMedium1,
      fontWeight: fontWeight ?? fontWeightRegular,
      letterSpacing: letterSpacing ?? 0,
    );
