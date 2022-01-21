import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:meshapp/Screens/AuditionAndCompetition/Competition/Controller/compitition_controller.dart';
import 'package:meshapp/Screens/AuditionAndCompetition/Competition/Model/competition_model.dart';
import 'package:meshapp/Screens/AuditionAndCompetition/Competition/Views/competition_view.dart';
import 'package:meshapp/Screens/AuditionAndCompetition/Competition/Views/edit_mycompetition.dart';
import 'package:meshapp/Screens/AuditionAndCompetition/Competition/competion_detail_scree.dart';
import 'package:meshapp/Screens/TrainingAndEarning/Controller/training_earning_controller.dart';
import 'package:meshapp/Screens/TrainingAndEarning/MyEarning/Model/earning_model.dart';
import 'package:meshapp/Screens/TrainingAndEarning/MyTraing/Model/trainig_model.dart';
import 'package:meshapp/Screens/TrainingAndEarning/MyTraing/training_detail_scree.dart';
import 'package:meshapp/UIController/app_theme.dart';
import 'package:meshapp/UIController/text_styles.dart';
import 'package:meshapp/Widgets/custom_button.dart';

class EarningListAdaptorView extends StatelessWidget {
  EarninigModel model;

  EarningListAdaptorView(this.model, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(TrainingEarningController());
    return GetBuilder<TrainingEarningController>(builder: (builder) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: GestureDetector(
          onTap: () {},
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
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Rating: ",
                        style: textStylePoppinsRegular(color: Colors.black)),
                    RatingBar.builder(
                      initialRating: model.rating!,
                      minRating: 1,
                      direction: Axis.horizontal,
                      itemCount: 5,
                      itemSize: 20,
                      tapOnlyMode: true,
                      allowHalfRating: true,
                      ignoreGestures: true,
                      itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: AppTheme.primaryColor,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
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
                    ),
                    Spacer(),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(children: <TextSpan>[
                        TextSpan(
                            text: "Total Earned-₹ ",
                            style: textStyleRubicRegular(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                                color: Colors.black)),
                        TextSpan(
                            text: model.price,
                            style: textStyleRubicRegular(
                                fontWeight: FontWeight.w600,
                                fontSize: 14.0,
                                color: AppTheme.primaryColor)),
                      ]),
                    ),
                  ],
                ),
              )
            ]),
          ),
        ),
      );
    });
  }
}
