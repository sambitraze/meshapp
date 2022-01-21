import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meshapp/Screens/TrainingAndEarning/Controller/training_earning_controller.dart';
import 'package:meshapp/Screens/TrainingAndEarning/MyEarning/Model/earning_model.dart';
import 'package:meshapp/Screens/TrainingAndEarning/MyEarning/accountdetail.dart';
import 'package:meshapp/Screens/TrainingAndEarning/MyEarning/earning_list_adaptor.dart';
import 'package:meshapp/UIController/app_theme.dart';
import 'package:meshapp/UIController/text_styles.dart';
import 'package:meshapp/Widgets/custom_button.dart';
import 'package:meshapp/Widgets/custom_nav_bar.dart';
import 'package:meshapp/Widgets/order_floatingbutton.dart';
import 'package:meshapp/core/helpers/ui_helpers.dart';

class MyearningScreen extends StatefulWidget {
  const MyearningScreen({Key? key}) : super(key: key);

  @override
  _MyearningScreenState createState() => _MyearningScreenState();
}

class _MyearningScreenState extends State<MyearningScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = UIHelper.getScreenSize(context);
    return GetBuilder<TrainingEarningController>(builder: (builder) {
      return Scaffold(
          backgroundColor: Color(0xffF5F7FC),
          body: Container(
            width: size.width,
            height: size.height,
            padding: EdgeInsets.all(0),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Your Earning',
                  textAlign: TextAlign.left,
                  style: textStylePoppinsRegular(
                    color: Color.fromRGBO(137, 89, 252, 1),
                    fontSize: 15,
                    letterSpacing: 0,
                    fontWeight: FontWeight.w500,
                    /*PERCENT not supported*/
                  ),
                ),
                UIHelper.verticalSpaceSm,
                headerBox(size),
                UIHelper.verticalSpaceL,
                Expanded(
                    child: Container(
                  width: size.width,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: AppTheme.primaryColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        addBankButton(),
                        UIHelper.verticalSpaceSm,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Card(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: ListTile(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              leading: Image.asset("images/bank.png"),
                              title: Text("Bank Details",
                                  style: textStyleRubicRegular(
                                    fontSize: 18.0,
                                    color: AppTheme.primaryColor,
                                    fontWeight: FontWeight.w600,
                                  )),
                              subtitle: Text(
                                  "This account is used to facilitate all your deposits and withdrawals",
                                  style: textStyleRubicRegular(
                                    fontSize: 14.0,
                                    color: AppTheme.primaryColor,
                                    fontWeight: FontWeight.w400,
                                  )),
                            ),
                          ),
                        ),
                        UIHelper.verticalSpaceSm,
                        for (EarninigModel model in builder.listEarnings)
                          EarningListAdaptorView(model)
                        // ListView.builder(
                        //     shrinkWrap: true,
                        //     itemBuilder: (context, index) {
                        //       return Container();
                        //     })
                      ],
                    ),
                  ),
                ))
              ],
            ),
          ));
    });
  }

  Padding addBankButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Get.to(AccountDetail());
        },
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("images/stopred.png", width: 20),
              UIHelper.horizontalSpaceSm,
              Text(
                "Add Bank Details",
                style: textStyleRubicRegular(fontSize: 14.0),
              )
            ],
          ),
        ),
      ),
    );
  }

  headerBox(Size size) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: AppTheme.primaryColor,
        child: Container(
          width: size.width,
          padding: EdgeInsets.symmetric(horizontal: 10),
          height: 80,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text("COURSE PRICE",
                      style: textStyleRubicRegular(
                          fontSize: 12, color: Colors.white)),
                  UIHelper.horizontalSpaceSm,
                  Text("₹ 1000.0",
                      style: textStyleRubicRegular(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.w600))
                ],
              )),
              Expanded(
                  child: CustomButton(
                () {},
                text: "WITHDRAW",
                textcolor: AppTheme.primaryColor,
                height: 45.0,
                fsize: 14.0,
                color: Colors.white,
              ))
            ],
          ),
        ),
      ),
    );
  }
}
