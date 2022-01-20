import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meshapp/Screens/AuditionAndCompetition/Competition/Controller/compitition_controller.dart';
import 'package:meshapp/Screens/AuditionAndCompetition/Competition/Model/competition_model.dart';
import 'package:meshapp/Screens/AuditionAndCompetition/Competition/viewalloffer_screen.dart';
import 'package:meshapp/UIController/app_theme.dart';
import 'package:meshapp/UIController/text_styles.dart';
import 'package:meshapp/Widgets/custom_button.dart';
import 'package:meshapp/core/helpers/ui_helpers.dart';

class OfferScreen extends StatefulWidget {
  CompetitionModel? model;

  OfferScreen({Key? key, this.model}) : super(key: key);

  @override
  _OfferScreenState createState() => _OfferScreenState();
}

class _OfferScreenState extends State<OfferScreen> {
  TextEditingController desc = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = UIHelper.getScreenSize(context);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text("Apply",
              style: textStylePoppinsRegular(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600)),
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.arrow_back, color: Colors.black)),
          centerTitle: true,
        ),
        body: Container(
          width: size.width,
          height: size.height,
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.only(left: 10),
                      leading: Hero(
                        tag: widget.model!.companyImage +
                            widget.model!.comapnyName,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.network(widget.model!.companyImage,
                              width: 50, height: 50, fit: BoxFit.cover),
                        ),
                      ),
                      title: Row(
                        children: [
                          Text(
                            widget.model!.title,
                            maxLines: 1,
                            style: textStyleRubicRegular(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                        ],
                      ),
                      subtitle: Text(widget.model!.comapnyName),
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
                              child: Text(widget.model!.location),
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
                                text: widget.model!.category,
                                style: textStyleRubicRegular(
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black)),
                          ]),
                        )
                      ]),
                    ),
                  ],
                ),
              ),
              UIHelper.verticalSpaceL,
              labelTextField(
                  controller: desc,
                  title: "Add a description to your offer",
                  hint: "Max 800 Char"),
              Spacer(),
              Center(
                child: Container(
                    width: 300,
                    child: CustomButton(() {
                      widget.model!.offerDesc = desc.text;
                      var data = Get.put(CompetitionController());
                      data.addToMyCompetitionOffers(widget.model!);

                      Get.to(AllOfferScreen(model: widget.model!));
                    }, text: "Send Offer")),
              ),
              UIHelper.verticalSpaceMd,
            ],
          ),
        ));
  }

  Widget labelTextField({var title, var hint, var controller, var maxLength}) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: textStyleRubicRegular(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500)),
          Container(
            transform: Matrix4.translationValues(0, -5, 0),
            child: TextField(
              controller: controller,
              //   maxLength: maxLength ?? 1000,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(
                hintText: hint,
                focusColor: AppTheme.primaryColor,
              ),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
