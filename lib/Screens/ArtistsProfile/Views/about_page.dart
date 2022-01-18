import 'package:flutter/material.dart';
import 'package:meshapp/Screens/Win/Model/skill_model.dart';
import 'package:meshapp/UIController/text_styles.dart';
import 'package:meshapp/core/helpers/ui_helpers.dart';

class AboutPage extends StatelessWidget {
  List<SkillModel>? listSkills;
  AboutPage({Key? key, this.listSkills}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UIHelper.verticalSpaceMd,
          Text(
              "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.Read More",
              style: textStyleRubicRegular(fontSize: 14, color: Colors.black)),
          UIHelper.verticalSpaceMd,
          Wrap(
            alignment: WrapAlignment.start,
            children: [
              for (SkillModel e in listSkills!)
                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  color: e.color,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(e.title,
                        style: textStyleRubicRegular(fontSize: 13)),
                  ),
                )
            ],
          )
        ],
      ),
    ));
  }
}
