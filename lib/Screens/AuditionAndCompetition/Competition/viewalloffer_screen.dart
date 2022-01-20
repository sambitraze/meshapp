import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meshapp/Screens/AuditionAndCompetition/Competition/Controller/compitition_controller.dart';
import 'package:meshapp/Screens/AuditionAndCompetition/Competition/Model/competition_model.dart';
import 'package:meshapp/Screens/AuditionAndCompetition/Competition/Views/competition_view.dart';
import 'package:meshapp/UIController/app_theme.dart';
import 'package:meshapp/UIController/text_styles.dart';
import 'package:meshapp/Widgets/custom_button.dart';
import 'package:meshapp/core/helpers/ui_helpers.dart';

class AllOfferScreen extends StatefulWidget {
  CompetitionModel? model;
  AllOfferScreen({Key? key, this.model}) : super(key: key);

  @override
  _AllOfferScreenState createState() => _AllOfferScreenState();
}

class _AllOfferScreenState extends State<AllOfferScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = UIHelper.getScreenSize(context);
    Get.put(CompetitionController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("View Offers",
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
      body: GetBuilder<CompetitionController>(builder: (builder) {
        return Container(
          width: size.width,
          height: size.height,
          child: ListView.builder(
              itemCount: builder.listOffers.length,
              itemBuilder: (context, index) {
                CompetitionModel model = builder.listOffers[index];
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
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
                            trailing: Container(
                              transform: Matrix4.translationValues(-10, -10, 0),
                              child: SizedBox(
                                  width: 30,
                                  height: 30,
                                  child: FloatingActionButton(
                                    onPressed: () {
                                      builder
                                          .removeFROMMyCompetitionOffer(model);
                                    },
                                    backgroundColor: Colors.white,
                                    child:
                                        Icon(Icons.close, color: Colors.black),
                                  )),
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
                          ),
                          Container(
                            width: size.width,
                            color: Color(0xffF4F4F4),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(model.offerDesc),
                            ),
                          ),
                          !isCompetition!
                              ? model.listFilesUrl!.length > 0
                                  ? Container(
                                      width: size.width,
                                      padding:
                                          EdgeInsets.only(top: 20, bottom: 20),
                                      child: Wrap(
                                        runSpacing: 5,
                                        spacing: 5,
                                        alignment: WrapAlignment.start,
                                        children: List.generate(
                                            model.listFilesUrl!.length,
                                            (index) {
                                          return Stack(
                                            children: [
                                              Container(
                                                  width: size.width * 0.29,
                                                  height: size.width * 0.29,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                      image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image: NetworkImage(
                                                            model.listFilesUrl![
                                                                index]),
                                                      ))),
                                              Positioned(
                                                  right: 10,
                                                  bottom: 10,
                                                  child: Image.asset(
                                                    "images/expand.png",
                                                    width: 20,
                                                    height: 20,
                                                  ))
                                            ],
                                          );
                                        }),
                                      ),
                                    )
                                  : Container()
                              : Container(),
                          UIHelper.verticalSpaceSm,
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Container(
                              height: 45,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: CustomButton(
                                      () {},
                                      text: "View Profile",
                                    ),
                                  ),
                                  UIHelper.horizontalSpaceSm,
                                  Expanded(
                                    child: CustomButton(
                                      () {},
                                      color: Colors.white,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset("images/message.png",
                                              width: 20, height: 20),
                                          UIHelper.horizontalSpaceSm,
                                          Text("Message",
                                              style: textStylePoppinsRegular(
                                                  color: AppTheme.primaryColor))
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                         
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }),
        );
      }),
    );
  }
}
