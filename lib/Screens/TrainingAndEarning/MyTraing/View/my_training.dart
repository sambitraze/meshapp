import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meshapp/Home/Widgets/search_widget.dart';
import 'package:meshapp/Screens/AuditionAndCompetition/Competition/Controller/compitition_controller.dart';
import 'package:meshapp/Screens/AuditionAndCompetition/Competition/Model/competition_model.dart';
import 'package:meshapp/Screens/AuditionAndCompetition/Competition/Views/competition_list_adaptor.dart';
import 'package:meshapp/Screens/TrainingAndEarning/Controller/training_earning_controller.dart';
import 'package:meshapp/Screens/TrainingAndEarning/MyTraing/Model/trainig_model.dart';
import 'package:meshapp/Screens/TrainingAndEarning/MyTraing/View/create_mytraining.dart';
import 'package:meshapp/Screens/TrainingAndEarning/MyTraing/View/mytraining_list_adaptor.dart';
import 'package:meshapp/UIController/app_theme.dart';
import 'package:meshapp/UIController/text_styles.dart';
import 'package:meshapp/Widgets/custom_button.dart';
import 'package:meshapp/core/helpers/ui_helpers.dart';

class MyTrainin extends StatefulWidget {
  const MyTrainin({Key? key}) : super(key: key);

  @override
  _MyTraininState createState() => _MyTraininState();
}

class _MyTraininState extends State<MyTrainin> {
  FilePickerResult? result;

  @override
  Widget build(BuildContext context) {
    Get.put(TrainingEarningController());
    return GetBuilder<TrainingEarningController>(builder: (builder) {
      return Column(
        children: [
          UIHelper.verticalSpaceSm,
          Expanded(
            child: Container(
                child: builder.listMyTrainig.length > 0
                    ? ListView.builder(
                        shrinkWrap: true,
                        itemCount: builder.listMyTrainig.length,
                        itemBuilder: (context, index) {
                          TrainingModel model = builder.listMyTrainig[index];
                          return MyTrainingListAdaptorView(model,
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
                      )),
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
            Get.to(CreateMyTrainingScreen());
          },
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Image.asset("images/plus.png", width: 25, height: 25),
            Text("Create My Training",
                style: textStyleRubicRegular(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.white))
          ]),
        ));
  }
}
