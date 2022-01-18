import 'package:flutter/material.dart';
import 'package:meshapp/UIController/app_theme.dart';
import 'package:meshapp/UIController/text_styles.dart';
import 'package:meshapp/core/helpers/ui_helpers.dart';

class HomeSearchWidget extends StatelessWidget {
  const HomeSearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Image.asset(
            "images/search.png",
            width: 30,
            height: 30,
          ),
          UIHelper.horizontalSpaceSm,
          Container(
            width: 1,
            height: 30,
            color: AppTheme.primaryColor,
          ),
          UIHelper.horizontalSpaceSm,
          Expanded(
            child: TextFormField(
              keyboardType: TextInputType.text,
              style: textStyleInterRegular(
                  fontSize: 18,
                  fontWeight: fontWeightW600,
                  color: AppTheme.primaryColor),
              decoration: InputDecoration(
                  hintText: "Search ..",
                  hintStyle: textStyleInterRegular(
                      fontSize: 18,
                      fontWeight: fontWeightW600,
                      color: AppTheme.greyColor),
                  border: InputBorder.none,
                  suffixIcon: Container(
                    width: 100,
                    height: 40,
                    child: Card(
                        elevation: 10,
                        color: AppTheme.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              "images/filtercircle.png",
                              width: 25,
                              height: 25,
                            ),
                            Text(
                              "Filters",
                              style: textStyleLatoRegular(
                                fontSize: 14.0,
                                color: Colors.white,
                              ),
                            )
                          ],
                        )),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
