import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meshapp/Screens/AuditionAndCompetition/Competition/Model/competition_model.dart';
import 'package:meshapp/Screens/AuditionAndCompetition/Competition/Views/competition_view.dart';
import 'package:meshapp/Screens/AuditionAndCompetition/Competition/send_offer_screen.dart';
import 'package:meshapp/UIController/text_styles.dart';
import 'package:meshapp/Widgets/custom_button.dart';
import 'package:meshapp/core/helpers/ui_helpers.dart';

class CompetitionDetailScreen extends StatefulWidget {
  CompetitionModel? model;
  CompetitionDetailScreen({Key? key, this.model}) : super(key: key);

  @override
  _CompetitionDetailScreenState createState() =>
      _CompetitionDetailScreenState();
}

class _CompetitionDetailScreenState extends State<CompetitionDetailScreen> {
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
                              title: "Apply Before",
                              value: widget.model!.applyBeforeDate.toString()),
                        ),
                        Expanded(
                          child: titleWidget(
                              title: "Location",
                              value: widget.model!.location.toString()),
                        )
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
              !isCompetition!
                  ? Container(
                      color: Colors.white,
                      padding: EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      child: postsWidget(
                          title: "Media",
                          list: widget.model!.listFilesUrl,
                          size: size),
                    )
                  : Container(),
              UIHelper.verticalSpaceMd,
              Center(
                child: Container(
                    width: 300,
                    child: CustomButton(() {
                      Get.to(OfferScreen(model: widget.model!));
                    }, text: "Apply Now")),
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
