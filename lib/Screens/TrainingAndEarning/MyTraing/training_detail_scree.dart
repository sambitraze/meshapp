import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meshapp/Screens/AuditionAndCompetition/Competition/Model/competition_model.dart';
import 'package:meshapp/Screens/AuditionAndCompetition/Competition/Views/competition_view.dart';
import 'package:meshapp/Screens/AuditionAndCompetition/Competition/send_offer_screen.dart';
import 'package:meshapp/Screens/TrainingAndEarning/MyTraing/Model/trainig_model.dart';
import 'package:meshapp/UIController/text_styles.dart';
import 'package:meshapp/Widgets/custom_button.dart';
import 'package:meshapp/core/helpers/ui_helpers.dart';

class TrainingDetailScreen extends StatefulWidget {
  TrainingModel? model;
  TrainingDetailScreen({Key? key, this.model}) : super(key: key);

  @override
  _TrainingDetailScreenState createState() => _TrainingDetailScreenState();
}

class _TrainingDetailScreenState extends State<TrainingDetailScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = UIHelper.getScreenSize(context);
    return Scaffold(
      backgroundColor: Color(0xffF5F7FC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back, color: Colors.black)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          padding: EdgeInsets.all(0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: size.width,
                color: Colors.white,
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Hero(
                          tag: widget.model!.companyImage +
                              widget.model!.comapnyName,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image.network(
                              widget.model!.companyImage,
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Spacer(),
                        Column(
                          children: [
                            Text("COURSE PRICE",
                                style: textStyleRubicRegular(
                                    fontSize: 18, color: Colors.black)),
                            UIHelper.verticalSpaceSm,
                            Text("₹ " + widget.model!.price,
                                style: textStyleRubicRegular(
                                    fontSize: 21,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold))
                          ],
                        )
                      ],
                    ),
                    UIHelper.verticalSpaceMd,
                    Row(
                      children: [
                        Text(widget.model!.comapnyName,
                            style: textStylePoppinsRegular(
                                color: Colors.black,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500)),
                        Spacer(),
                        Text(widget.model!.applyDate.toString(),
                            style: textStylePoppinsRegular(
                                color: Colors.grey,
                                fontSize: 12.0,
                                fontWeight: FontWeight.w400))
                      ],
                    )
                  ],
                ),
              ),
              UIHelper.verticalSpaceMd,
              Container(
                width: size.width,
                color: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: titleWidget(
                              title: "Course Title",
                              value: widget.model!.title.toString()),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: titleWidget(
                              title: "Category",
                              value: widget.model!.category.toString()),
                        ),
                        Expanded(
                          child: Container(),
                        )
                      ],
                    )
                  ],
                ),
              ),
              UIHelper.verticalSpaceMd,
              Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                ),
                child: titleWidget(
                    title: "Description", value: widget.model!.desc),
              ),
              UIHelper.verticalSpaceMd,
              Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                ),
                child: postsWidget(
                    title: "COURSE PREVIEW",
                    list: widget.model!.listFilesUrl,
                    size: size),
              ),
              UIHelper.verticalSpaceMd,
              Center(
                child: Container(
                    width: 300,
                    child: CustomButton(() {
                      // Get.to(OfferScreen(model: widget.model!));
                    }, text: "ENROLL NOW")),
              ),
              UIHelper.verticalSpaceMd,
            ],
          ),
        ),
      ),
    );
  }

  Widget titleWidget({var title, var value}) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            textAlign: TextAlign.left,
            style: textStylePoppinsRegular(
                color: Colors.black, fontWeight: FontWeight.w700, fontSize: 14),
          ),
          UIHelper.verticalSpaceSm,
          Text(
            value,
            style: textStylePoppinsRegular(
                color: Colors.black, fontWeight: FontWeight.w400, fontSize: 13),
          ),
        ],
      ),
    );
  }

  Widget postsWidget({var title, list, size}) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            textAlign: TextAlign.left,
            style: textStylePoppinsRegular(
                color: Colors.black, fontWeight: FontWeight.w700, fontSize: 14),
          ),
          UIHelper.verticalSpaceSm,
          list.length > 0
              ? Container(
                  width: size.width,
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  child: Wrap(
                    runSpacing: 5,
                    spacing: 5,
                    alignment: WrapAlignment.start,
                    children: List.generate(list.length, (index) {
                      return Stack(
                        children: [
                          Container(
                              width: size.width * 0.29,
                              height: size.width * 0.29,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(list[index]),
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
              : Container(),
        ],
      ),
    );
  }
}
