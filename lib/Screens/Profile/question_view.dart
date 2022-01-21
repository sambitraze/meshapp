import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meshapp/Home/Views/postaction_buttons.dart';
import 'package:meshapp/Home/Widgets/message_tags_widget.dart';
import 'package:meshapp/Screens/Profile/profile_controller.dart';
import 'package:meshapp/Screens/Profile/user_profile_tile.dart';
import 'package:meshapp/core/helpers/ui_helpers.dart';

class ProfileQuestionView extends StatefulWidget {
  const ProfileQuestionView({Key? key}) : super(key: key);

  @override
  _ProfileQuestionViewState createState() => _ProfileQuestionViewState();
}

class _ProfileQuestionViewState extends State<ProfileQuestionView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(builder: (builder) {
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: builder.profileModel.listQuestions!.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    UserProfileTile(),
                    // UIHelper.verticalSpaceMd,
                    MessageTagWidget(
                      name: "",
                      message: builder.profileModel.listQuestions![index],
                      listTags: ["#Cricket", "#Game", "#Strome"],
                    ),
                    UIHelper.verticalSpaceMd,
                    PostActionButtons(),
                    UIHelper.verticalSpaceSm,
                    Divider(
                      color: Colors.black,
                    ),
                  ],
                );
              }),
        ),
      );
    });
  }
}
