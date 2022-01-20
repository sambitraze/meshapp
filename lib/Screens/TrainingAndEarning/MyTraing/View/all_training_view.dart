import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meshapp/Home/Widgets/search_widget.dart';
import 'package:meshapp/Screens/TrainingAndEarning/Controller/training_earning_controller.dart';
import 'package:meshapp/Screens/TrainingAndEarning/MyTraing/Model/trainig_model.dart';
import 'package:meshapp/Screens/TrainingAndEarning/MyTraing/View/training_list_adaptor.dart';
import 'package:meshapp/UIController/text_styles.dart';
import 'package:meshapp/Widgets/custom_button.dart';
import 'package:meshapp/core/helpers/ui_helpers.dart';

class AllTrainingView extends StatefulWidget {
  const AllTrainingView({Key? key}) : super(key: key);

  @override
  _AllTrainingViewState createState() => _AllTrainingViewState();
}

class _AllTrainingViewState extends State<AllTrainingView> {
  @override
  Widget build(BuildContext context) {
    Get.put(TrainingEarningController());
    return GetBuilder<TrainingEarningController>(builder: (builder) {
      return Column(
        children: [
          UIHelper.verticalSpaceSm,
          HomeSearchWidget(),
          UIHelper.verticalSpaceSm,
          Expanded(
            child: Container(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: builder.listAllTraings.length,
                  itemBuilder: (context, index) {
                    TrainingModel model = builder.listAllTraings[index];
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
                                Text(
                                  "Preview",
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
