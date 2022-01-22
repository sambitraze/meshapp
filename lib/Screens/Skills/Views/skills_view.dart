import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meshapp/Screens/Skills/Controller/skill_controller.dart';
import 'package:meshapp/Screens/Skills/Models/skill_model.dart';
import 'package:meshapp/UIController/app_theme.dart';
import 'package:meshapp/UIController/text_styles.dart';
import 'package:meshapp/core/helpers/ui_helpers.dart';

class SkillView extends StatefulWidget {
  SkillModel? model;
  SkillView({this.model});

  @override
  _SkillViewState createState() => _SkillViewState();
}

class _SkillViewState extends State<SkillView> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    Size size = UIHelper.getScreenSize(context);
    return GetBuilder<SkillController>(builder: (controller) {
      isSelected = controller.selectedlistSkills.contains(widget.model);

      return Container(
        height: 60,
        width: (size.width * 0.48) - 20,
        child: GestureDetector(
          onTap: () {
            controller.updateSkills(widget.model!);
          },
          child: Card(
            color: isSelected ? AppTheme.primaryColor : Colors.white,
            // elevation: isSelected ? 10 : 3,
            shape: RoundedRectangleBorder(
                //     side: BorderSide(color: AppTheme.greyColor, width: 0.5),
                borderRadius: BorderRadius.circular(15)),
            child: Row(
              children: [
                UIHelper.horizontalSpaceSm,
                Image.asset(
                  widget.model!.image,
                  width: 25,
                  height: 25,
                  color: isSelected ? Colors.white : AppTheme.primaryColor,
                ),
                UIHelper.horizontalSpaceMd,
                Text(
                  widget.model!.title,
                  style: textStyleInterRegular(
                      fontSize: 14,
                      color: isSelected ? Colors.white : AppTheme.primaryColor),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
