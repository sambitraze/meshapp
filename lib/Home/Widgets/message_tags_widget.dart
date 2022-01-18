import 'package:flutter/material.dart';
import 'package:meshapp/UIController/app_theme.dart';
import 'package:meshapp/UIController/text_styles.dart';
import 'package:meshapp/core/helpers/ui_helpers.dart';

class MessageTagWidget extends StatelessWidget {
  var message;
  var fontSize;
  List<String>? listTags;
  var name;
  MessageTagWidget(
      {Key? key, this.message, this.listTags, this.name, this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = UIHelper.getScreenSize(context);
    return Container(
      width: size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            textAlign: TextAlign.left,
            text: TextSpan(children: <TextSpan>[
              TextSpan(
                  text: "$name" + " ",
                  style: textStyleInterRegular(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  )),
              TextSpan(
                  text: message,
                  style: textStyleInterRegular(
                      fontSize: fontSize ?? 16, color: Color(0xff204050))),
            ]),
          ),
          UIHelper.verticalSpaceSm,
          Wrap(
              alignment: WrapAlignment.start,
              runAlignment: WrapAlignment.start,
              crossAxisAlignment: WrapCrossAlignment.start,
              children: listTags!
                  .map((e) => Text(
                        e,
                        style: textStyleRubicRegular(
                            color: AppTheme.primaryColor,
                            fontSize: fontSize ?? 16),
                      ))
                  .toList())
        ],
      ),
    );
  }
}
