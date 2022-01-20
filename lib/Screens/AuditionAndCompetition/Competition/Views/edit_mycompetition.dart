import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meshapp/Screens/AuditionAndCompetition/Competition/Controller/compitition_controller.dart';
import 'package:meshapp/Screens/AuditionAndCompetition/Competition/Model/competition_model.dart';
import 'package:meshapp/UIController/app_theme.dart';
import 'package:meshapp/UIController/text_styles.dart';
import 'package:meshapp/Widgets/custom_button.dart';
import 'package:meshapp/core/helpers/ui_helpers.dart';

class EditMyCompetitionScreen extends StatefulWidget {
  CompetitionModel? model;
  EditMyCompetitionScreen({Key? key, this.model}) : super(key: key);

  @override
  _EditMyCompetitionScreenState createState() =>
      _EditMyCompetitionScreenState();
}

class _EditMyCompetitionScreenState extends State<EditMyCompetitionScreen> {
  var seletedCategory = 'Choose';
  DateTime? selectedDate = DateTime.now();
  TextEditingController title = new TextEditingController();
  TextEditingController desc = new TextEditingController();
  TextEditingController location = new TextEditingController();
  List<File> listFiles = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      title.text = widget.model!.title;
      desc.text = widget.model!.desc;

      location.text = widget.model!.location;
      seletedCategory = widget.model!.category;
      selectedDate = DateTime.parse(widget.model!.applyBeforeDate);
      if (widget.model!.listFiles != null) {
        listFiles = widget.model!.listFiles!;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = UIHelper.getScreenSize(context);
    Get.put(CompetitionController());
    return GetBuilder<CompetitionController>(builder: (provider) {
      return Scaffold(
          backgroundColor: Colors.white,
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
              padding: EdgeInsets.all(20),
              child: Column(children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                        "https://cdn.pixabay.com/photo/2015/01/06/16/14/woman-590490__340.jpg",
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover)),
                UIHelper.verticalSpaceSm,
                Text("Mesh-Studio",
                    style: textStylePoppinsRegular(
                        fontWeight: FontWeight.w500, fontSize: 16.0)),
                UIHelper.verticalSpaceL,
                labelTextField(
                    title: "Add a title",
                    hint: "Max 200 Chracters.",
                    controller: title,
                    maxLength: 200),
                labelTextField(
                    title: "Add a description",
                    controller: desc,
                    hint: "Max 300 Chracters.",
                    maxLength: 300),
                categoryPicker(title: "Choose a category"),
                labelTextField(
                    title: "Location",
                    hint: "Enter a location",
                    controller: location,
                    maxLength: 300),
                calenderPicker(title: "Apply Before"),
                listFiles.length > 0
                    ? Container(
                        width: size.width,
                        padding: EdgeInsets.only(top: 20, bottom: 20),
                        child: Wrap(
                          runSpacing: 5,
                          spacing: 5,
                          alignment: WrapAlignment.start,
                          children: List.generate(listFiles.length, (index) {
                            return Stack(
                              children: [
                                Container(
                                    width: size.width * 0.29,
                                    height: size.width * 0.29,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: FileImage(listFiles[index]),
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
                UIHelper.verticalSpaceL,
                CustomButton(
                  () {
                    CompetitionModel model = CompetitionModel(
                        comapnyName: "Mesh-Studio",
                        companyImage:
                            "https://cdn.pixabay.com/photo/2015/01/06/16/14/woman-590490__340.jpg",
                        title: title.text,
                        applyDate: DateTime.now().toString(),
                        applyBeforeDate: selectedDate.toString(),
                        category: "-" + seletedCategory,
                        desc: desc.text,
                        listOffers: [],
                        location: location.text,
                        status: "");

                    // provider.addToMyCompetition(model);

                    Get.back();
                  },
                  text: "Update",
                )
              ]),
            ),
          ));
    });
  }

  Widget labelTextField({var title, var hint, var controller, var maxLength}) {
    return Column(
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
    );
  }

  Widget categoryPicker({var title}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            var height = MediaQuery.of(context).size.height;
            var width = MediaQuery.of(context).size.width;
            Get.dialog(Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.4, right: 50),
                child: AlertDialog(
                  insetPadding: EdgeInsets.symmetric(horizontal: 30),
                  content:
                      GetBuilder<CompetitionController>(builder: (provider) {
                    return Container(
                        width: 200,
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: Expanded(
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: provider.listCategoeries.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      seletedCategory =
                                          provider.listCategoeries[index];
                                    });
                                    Get.back();
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(vertical: 5),
                                    child: Text(provider.listCategoeries[index],
                                        style: textStylePoppinsRegular(
                                            color: AppTheme.primaryColor,
                                            fontSize: 14)),
                                  ),
                                );
                              }),
                        ));
                  }),
                )));
          },
          child: Row(
            children: [
              Text(title,
                  style: textStyleRubicRegular(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500)),
              UIHelper.horizontalSpaceMd,
              Image.asset("images/dropdown.png", width: 20, height: 20)
            ],
          ),
        ),
        Row(
          children: [
            Text(seletedCategory,
                style: textStyleRubicRegular(
                    color: AppTheme.primaryColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500)),
            Spacer(),
            Column(
              children: [
                Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                        color: AppTheme.primaryColor,
                        borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Image.asset("images/plus.png"),
                    )),
                SizedBox(height: 5),
                Text("Add more category",
                    style:
                        textStyleRubicRegular(fontSize: 8, color: Colors.grey))
              ],
            )
          ],
        ),
        Divider(color: Colors.black),
        SizedBox(height: 10),
      ],
    );
  }

  Widget calenderPicker({var title}) {
    return GestureDetector(
      onTap: () async {
        final DateTime? selected = await showDatePicker(
          context: context,
          initialDate: selectedDate!,
          firstDate: DateTime(2010),
          lastDate: DateTime(2025),
        );
        if (selected != null && selected != selectedDate)
          setState(() {
            selectedDate = selected;
          });
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(title,
                  style: textStyleRubicRegular(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500)),
            ],
          ),
          Row(
            children: [
              Text(selectedDate.toString(),
                  style: textStyleRubicRegular(
                      color: AppTheme.primaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500)),
              Spacer(),
              Container(
                transform: Matrix4.translationValues(0, 0, 0),
                child: Column(
                  children: [
                    Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            color: AppTheme.primaryColor,
                            borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Image.asset("images/calender.png"),
                        )),
                    SizedBox(height: 5),
                    Text("Fix date click here",
                        style: textStyleRubicRegular(
                            fontSize: 8, color: Colors.grey))
                  ],
                ),
              )
            ],
          ),
          Divider(color: Colors.black),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
