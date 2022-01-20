import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meshapp/Screens/TrainingAndEarning/Controller/training_earning_controller.dart';
import 'package:meshapp/Screens/TrainingAndEarning/MyTraing/Model/trainig_model.dart';
import 'package:meshapp/Screens/TrainingAndEarning/MyTraing/View/training_list_adaptor.dart';
import 'package:meshapp/UIController/text_styles.dart';
import 'package:meshapp/Widgets/custom_button.dart';
import 'package:meshapp/core/helpers/ui_helpers.dart';

class ActiveTrainingView extends StatefulWidget {
  const ActiveTrainingView({Key? key}) : super(key: key);

  @override
  _ActiveTrainingViewState createState() => _ActiveTrainingViewState();
}

class _ActiveTrainingViewState extends State<ActiveTrainingView> {
  @override
  Widget build(BuildContext context) {
    Get.put(TrainingEarningController());
    return GetBuilder<TrainingEarningController>(builder: (builder) {
      return Column(
        children: [
          UIHelper.verticalSpaceSm,
          Expanded(
            child: Container(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: builder.listActiveTraings.length,
                  itemBuilder: (context, index) {
                    TrainingModel model = builder.listActiveTraings[index];
                    return TrainingListAdaptorView(
                      model,
                      isActiveCompetition: true,
                      childButton: Container(
                          height: 35,
                          width: 150,
                          child: CustomButton(
                            () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset("images/play.png",
                                    width: 20, height: 20),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Continue",
                                  style: textStylePoppinsRegular(
                                      color: Colors.white, fontSize: 14.0),
                                )
                              ],
                            ),
                          )),
                    );
                  }),
            ),
          ),
        ],
      );
    });
  }
}
