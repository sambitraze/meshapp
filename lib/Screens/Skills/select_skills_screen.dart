import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meshapp/Home/home_screen.dart';
import 'package:meshapp/Screens/Skills/Controller/skill_controller.dart';
import 'package:meshapp/Screens/Skills/Models/skill_model.dart';
import 'package:meshapp/Screens/Skills/Views/skills_view.dart';
import 'package:meshapp/UIController/text_styles.dart';
import 'package:meshapp/Widgets/custom_button.dart';
import 'package:meshapp/core/helpers/ui_helpers.dart';

class SelectSkillsScreen extends StatefulWidget {
  const SelectSkillsScreen({Key? key}) : super(key: key);

  @override
  _SelectSkillsScreenState createState() => _SelectSkillsScreenState();
}

class _SelectSkillsScreenState extends State<SelectSkillsScreen> {
  @override
  Widget build(BuildContext context) {
    Get.put(SkillController());
    Size size = UIHelper.getScreenSize(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: GetBuilder<SkillController>(builder: (skillController) {
          return Container(
            width: size.width,
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                UIHelper.verticalSpaceL,
                Text(
                  "Complete Your Profile",
                  style: textStyleRubicRegular(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
                UIHelper.verticalSpaceSm,
                Text(
                  "Select Skills That You Possess",
                  style: textStylemanropeRegular(
                      fontSize: 14.0, fontWeight: FontWeight.w600),
                ),
                UIHelper.verticalSpaceL,
                Wrap(
                  runSpacing: 1,
                  spacing: 1,
                  alignment: WrapAlignment.center,
                  children:
                      List.generate(skillController.listSkills.length, (index) {
                    SkillModel model = skillController.listSkills[index];
                    return SkillView(model: model);
                  }),
                ),
                UIHelper.verticalSpaceXL,
                CustomButton(
                  () {
                    Get.to(HomeScreen());
                  },
                  text: "Continue",
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
