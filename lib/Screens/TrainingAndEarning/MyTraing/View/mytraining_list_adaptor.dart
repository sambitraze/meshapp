import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:meshapp/Screens/AuditionAndCompetition/Competition/Controller/compitition_controller.dart';
import 'package:meshapp/Screens/AuditionAndCompetition/Competition/Model/competition_model.dart';
import 'package:meshapp/Screens/AuditionAndCompetition/Competition/Views/competition_view.dart';
import 'package:meshapp/Screens/AuditionAndCompetition/Competition/Views/edit_mycompetition.dart';
import 'package:meshapp/Screens/AuditionAndCompetition/Competition/competion_detail_scree.dart';
import 'package:meshapp/Screens/TrainingAndEarning/Controller/training_earning_controller.dart';
import 'package:meshapp/Screens/TrainingAndEarning/MyTraing/Model/trainig_model.dart';
import 'package:meshapp/Screens/TrainingAndEarning/MyTraing/View/edit_mytraining.dart';
import 'package:meshapp/UIController/app_theme.dart';
import 'package:meshapp/UIController/text_styles.dart';
import 'package:meshapp/Widgets/custom_button.dart';

class MyTrainingListAdaptorView extends StatelessWidget {
  TrainingModel model;
  bool? isActiveCompetition;
  MyTrainingListAdaptorView(this.model, {Key? key, this.isActiveCompetition})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(TrainingEarningController());
    return GetBuilder<TrainingEarningController>(builder: (builder) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: GestureDetector(
          onTap: () {
            if (isActiveCompetition!) {
              // Get.to(
              //     CompetitionDetailScreen(
              //       model: model,
              //     ),
              //     transition: Transition.circularReveal);
            }
          },
          child: Card(
            elevation: 5,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Column(children: [
              ListTile(
                contentPadding: EdgeInsets.only(left: 10),
                leading: Hero(
                  tag: model.companyImage + model.comapnyName,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.network(model.companyImage,
                        width: 50, height: 50, fit: BoxFit.cover),
                  ),
                ),
                title: Row(
                  children: [
                    Text(
                      model.title,
                      maxLines: 1,
                      style: textStyleRubicRegular(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                  ],
                ),
                subtitle: Text(model.comapnyName),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: [
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(children: <TextSpan>[
                        TextSpan(
                            text: "Category",
                            style: textStyleRubicRegular(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Colors.black)),
                        TextSpan(
                            text: model.category,
                            style: textStyleRubicRegular(
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                                color: Colors.black)),
                      ]),
                    ),
                    Spacer(),
                    Row(
                      children: [],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(children: [
                  Container(
                      height: 35,
                      width: 90,
                      child: CustomButton(
                        () {
                          Get.to(EditMyTrainingScreen(
                            model: model,
                          ));
                        },
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset("images/edit.png",
                                  width: 15, height: 15),
                              Text("Edit",
                                  style: textStyleRubicRegular(
                                      color: Colors.white))
                            ]),
                      )),
                  Spacer(),
                  Container(
                      height: 35,
                      width: 170,
                      child: CustomButton(
                        () {},
                        text: "My Enrollments(23)",
                        fsize: 12.0,
                      ))
                ]),
              )
            ]),
          ),
        ),
      );
    });
  }
}
