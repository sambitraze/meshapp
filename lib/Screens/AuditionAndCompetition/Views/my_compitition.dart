import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meshapp/Home/Widgets/search_widget.dart';
import 'package:meshapp/Screens/AuditionAndCompetition/Controller/compitition_controller.dart';
import 'package:meshapp/Screens/AuditionAndCompetition/Model/competition_model.dart';
import 'package:meshapp/Screens/AuditionAndCompetition/Views/competition_list_adaptor.dart';
import 'package:meshapp/UIController/text_styles.dart';
import 'package:meshapp/Widgets/custom_button.dart';
import 'package:meshapp/core/helpers/ui_helpers.dart';

import 'create_competition.dart';

class MyCompition extends StatefulWidget {
  const MyCompition({Key? key}) : super(key: key);

  @override
  _MyCompitionState createState() => _MyCompitionState();
}

class _MyCompitionState extends State<MyCompition> {
  @override
  Widget build(BuildContext context) {
    Get.put(CompetitionController());
    return GetBuilder<CompetitionController>(builder: (builder) {
      return Column(
        children: [
          UIHelper.verticalSpaceSm,
          Expanded(
            child: Container(
              child: builder.listMyCompetitiions.length > 0
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: builder.listMyCompetitiions.length,
                      itemBuilder: (context, index) {
                        CompetitionModel model =
                            builder.listMyCompetitiions[index];
                        return CompetitionListAdaptorView(model,
                            isActiveCompetition: false);
                      })
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("images/nodata.png",
                            width: 200, height: 200),
                        UIHelper.verticalSpaceL,
                        createCompetitionButton(),
                      ],
                    ),
            ),
          ),
        ],
      );
    });
  }

  Container createCompetitionButton() {
    return Container(
        width: 260,
        margin: EdgeInsets.symmetric(horizontal: 0),
        child: CustomButton(
          () {
            Get.to(CreateCompetitionScreen());
          },
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Image.asset("images/plus.png", width: 25, height: 25),
            Text("Create A Competition",
                style: textStyleRubicRegular(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.white))
          ]),
        ));
  }
}
