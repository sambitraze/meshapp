import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meshapp/Home/Widgets/search_widget.dart';
import 'package:meshapp/Screens/AuditionAndCompetition/Competition/Controller/compitition_controller.dart';
import 'package:meshapp/Screens/AuditionAndCompetition/Competition/Model/competition_model.dart';
import 'package:meshapp/Screens/AuditionAndCompetition/Competition/Views/competition_list_adaptor.dart';
import 'package:meshapp/UIController/text_styles.dart';
import 'package:meshapp/core/helpers/ui_helpers.dart';

class ActiveCompitition extends StatefulWidget {
  const ActiveCompitition({Key? key}) : super(key: key);

  @override
  _ActiveCompititionState createState() => _ActiveCompititionState();
}

class _ActiveCompititionState extends State<ActiveCompitition> {
  @override
  Widget build(BuildContext context) {
    Get.put(CompetitionController());
    return GetBuilder<CompetitionController>(builder: (builder) {
      return Column(
        children: [
          UIHelper.verticalSpaceSm,
          HomeSearchWidget(),
          UIHelper.verticalSpaceSm,
          Expanded(
            child: Container(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: builder.listCompetitions.length,
                  itemBuilder: (context, index) {
                    CompetitionModel model = builder.listCompetitions[index];
                    return CompetitionListAdaptorView(model,
                        isActiveCompetition: true);
                  }),
            ),
          ),
        ],
      );
   
    });
  }
}
