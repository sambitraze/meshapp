import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meshapp/UIController/app_theme.dart';
import 'package:meshapp/UIController/text_styles.dart';
import 'package:meshapp/Widgets/custom_button.dart';
import 'package:meshapp/core/helpers/ui_helpers.dart';

class AccountDetail extends StatefulWidget {
  @override
  State<AccountDetail> createState() => _AccountDetailState();
}

class _AccountDetailState extends State<AccountDetail> {
  String? accounts;
  String radioButtonItem = 'ONE';

  // Group Value for Radio Button.
  int id = 1;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      height: 52,
                      width: 52,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(137, 89, 252, 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    UIHelper.verticalSpaceL,
                    labelTextField(
                        label: "Account Name", hint: "ex. Jonathan Paul Ive"),
                    labelTextField(
                        label: "Account Number",
                        hint: "50100392150387",
                        keyboard: TextInputType.number),
                    labelTextField(label: "IFSC CODE", hint: "HDFC00002990"),
                    UIHelper.verticalSpaceMd,
                    Text("Select Account Type",
                        style: textStylemanropeRegular(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 16.0)),
                    radioContainer(),
                    UIHelper.verticalSpaceMd,
                    CustomButton(
                      () {},
                      text: "SAVE",
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: 45.0,
                    ),
                    UIHelper.verticalSpaceSm,
                    CustomButton(
                      () {},
                      text: "EDIT",
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: 45.0,
                    ),
                  ]),
            )
          ],
        ),
      ),
    );
  }

  Row radioContainer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Radio(
          value: 1,
          activeColor: AppTheme.primaryColor,
          groupValue: id,
          onChanged: (val) {
            setState(() {
              radioButtonItem = 'Savings';
              id = 1;
            });
          },
        ),
        Text(
          'Savings',
          style: new TextStyle(fontSize: 17.0),
        ),
        UIHelper.horizontalSpaceL,
        Radio(
          value: 2,
          groupValue: id,
          activeColor: AppTheme.primaryColor,
          onChanged: (val) {
            setState(() {
              radioButtonItem = 'Current';
              id = 2;
            });
          },
        ),
        Text(
          'Current',
          style: new TextStyle(
            fontSize: 17.0,
          ),
        ),
      ],
    );
  }

  labelTextField({var label, var hint, var keyboard}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: textStylemanropeRegular(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(234, 236, 238, 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: SizedBox(
              width: 10,
              child: Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: TextField(
                  keyboardType: keyboard ?? TextInputType.text,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: hint,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
