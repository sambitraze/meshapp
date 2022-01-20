import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meshapp/Screens/AuditionAndCompetition/Competition/Controller/compitition_controller.dart';
import 'package:meshapp/Screens/AuditionAndCompetition/Competition/Model/competition_model.dart';
import 'package:meshapp/Screens/AuditionAndCompetition/Competition/Views/competition_view.dart';
import 'package:meshapp/Screens/AuditionAndCompetition/Competition/Views/edit_mycompetition.dart';
import 'package:meshapp/Screens/AuditionAndCompetition/Competition/competion_detail_scree.dart';
import 'package:meshapp/UIController/text_styles.dart';
import 'package:meshapp/Widgets/custom_button.dart';

class CompetitionListAdaptorView extends StatelessWidget {
  CompetitionModel model;
  bool? isActiveCompetition;
  CompetitionListAdaptorView(this.model, {Key? key, this.isActiveCompetition})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CompetitionController());
    return GetBuilder<CompetitionController>(builder: (builder) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: GestureDetector(
          onTap: () {
            if (isActiveCompetition!) {
              Get.to(
                  CompetitionDetailScreen(
                    model: model,
                  ),
                  transition: Transition.circularReveal);
            }
          },
          child: Card(
            elevation: 5,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
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
                  trailing: !isActiveCompetition!
                      ? Container(
                          transform: Matrix4.translationValues(-10, -10, 0),
                          child: SizedBox(
                              width: 30,
                              height: 30,
                              child: FloatingActionButton(
                                onPressed: () {
                                  isCompetition!
                                      ? builder.removeFROMMyCompetition(model)
                                      : builder.removeFROMMyAudion(model);
                                },
                                backgroundColor: Colors.white,
                                child: Icon(Icons.close, color: Colors.black),
                              )),
                        )
                      : model.status != ''
                          ? Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 5),
                              color: model.status == "Applied"
                                  ? Colors.green
                                  : Colors.orange,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  model.status != ''
                                      ? model.status == "Applied"
                                          ? Image.asset("images/applied.png",
                                              width: 15, height: 15)
                                          : Image.asset("images/stop.png",
                                              width: 15, height: 15)
                                      : Container(),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(model.status,
                                      style: textStyleRubicRegular(
                                          fontSize: 10.0,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.white))
                                ],
                              ),
                            )
                          : Container(width: 0, height: 0),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(children: [
                    Image.asset("images/mappin.png", width: 25, height: 25),
                    Container(
                        margin: EdgeInsets.only(left: 5),
                        decoration: BoxDecoration(
                            color: Color(0xffF5F7FC),
                            borderRadius: BorderRadius.circular(25)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(model.location),
                        )),
                    Spacer(),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(children: <TextSpan>[
                        TextSpan(
                            text: "Category",
                            style: textStyleRubicRegular(
                                fontWeight: FontWeight.w600,
                                color: Colors.black)),
                        TextSpan(
                            text: model.category,
                            style: textStyleRubicRegular(
                                fontWeight: FontWeight.normal,
                                color: Colors.black)),
                      ]),
                    )
                  ]),
                ),
                isActiveCompetition!
                    ? Container()
                    : Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(children: [
                          Container(
                              height: 35,
                              width: 90,
                              child: CustomButton(
                                () {
                                  Get.to(EditMyCompetitionScreen(
                                    model: model,
                                  ));
                                },
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
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
                              width: 150,
                              child: CustomButton(
                                () {},
                                text: "Review Offers(23)",
                                fsize: 12.0,
                              ))
                        ]),
                      )
              ],
            ),
          ),
        ),
      );
    });
  }
}
