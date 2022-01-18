import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:meshapp/Screens/Chat/Model/chat_friend_model.dart';
import 'package:meshapp/Screens/Chat/Model/message_model.dart';
import 'package:meshapp/UIController/app_theme.dart';
import 'package:meshapp/UIController/text_styles.dart';
import 'package:meshapp/Widgets/write_message_widget.dart';
import 'package:meshapp/core/helpers/ui_helpers.dart';

import 'Controller/chat_controller.dart';

class UserChatScreen extends StatefulWidget {
  ChatFriendModel? model;
  UserChatScreen({this.model});

  @override
  _UserChatScreenState createState() => _UserChatScreenState();
}

class _UserChatScreenState extends State<UserChatScreen> {
  TextEditingController comController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = UIHelper.getScreenSize(context);
    Get.put(ChatController);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        title: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: CircleAvatar(
            backgroundImage: NetworkImage(widget.model!.image!),
          ),
          title: Text(
            widget.model!.name!,
            style: textStyleRobotoBold(fontSize: 16),
          ),
          subtitle: Text("Meshenger",
              style: textStyleRobotoBold(
                  fontSize: 12, color: AppTheme.primaryColor)),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.error, color: AppTheme.primaryColor))
        ],
      ),
      body: GetBuilder<ChatController>(builder: (chatControlelr) {
        return Container(
          width: size.width,
          height: size.height,
          child: Column(
            children: [
              UIHelper.verticalSpaceMd,
              Expanded(
                child: Container(
                  child: ListView.builder(
                      itemCount: chatControlelr.listMessage.length,
                      reverse: true,
                      itemBuilder: (context, index) {
                        MessageModel model = chatControlelr.listMessage[index];
                        return chatMessageTile(
                            model.message, index.isEven ? true : false);
                      }),
                ),
              ),
              writeMessageBox()
            ],
          ),
        );
      }),
    );
  }

  Widget chatMessageTile(String message, bool sendByMe) {
    return Column(
      crossAxisAlignment:
          sendByMe ? CrossAxisAlignment.start : CrossAxisAlignment.end,
      children: [
        Container(
            margin: EdgeInsets.only(
                bottom: 5,
                top: 5,
                left: sendByMe ? MediaQuery.of(context).size.width * 0.25 : 10,
                right:
                    !sendByMe ? MediaQuery.of(context).size.width * 0.25 : 10),
            child: Text(
              "12-02-2020",
              style: textStyleRobotoRegular(
                  fontSize: 12, color: Color(0xffA4AAB2)),
            )),
        Row(
          mainAxisAlignment:
              sendByMe ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            Flexible(
              child: Container(
                  margin: EdgeInsets.only(
                      top: 5,
                      bottom: 5,
                      left: sendByMe
                          ? MediaQuery.of(context).size.width * 0.3
                          : 10,
                      right: !sendByMe
                          ? MediaQuery.of(context).size.width * 0.3
                          : 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      bottomRight:
                          sendByMe ? Radius.circular(0) : Radius.circular(24),
                      topRight: Radius.circular(24),
                      bottomLeft:
                          sendByMe ? Radius.circular(24) : Radius.circular(0),
                    ),
                    color: sendByMe ? AppTheme.primaryColor : Color(0xffC2C6CC),
                  ),
                  padding: EdgeInsets.all(16),
                  child: Text(
                    message,
                    style: textStyleRobotoRegular(
                        color: sendByMe ? Colors.white : Colors.black,
                        fontSize: 14),
                  )),
            ),
          ],
        ),
      ],
    );
  }

  Widget writeMessageBox() {
    return GetBuilder<ChatController>(builder: (controller) {
      return Container(
          margin: EdgeInsets.only(bottom: 20, top: 10),
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Center(
              child: WriteMessageCotainer(
            controller: comController,
            hint: "Message",
            textColor: Colors.black,
            prefix: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Icon(Icons.emoji_emotions),
            ),
            backcolor: Color(0xffD5D5D5),
            onSend: () {
              controller.sendMessage(MessageModel(
                  message: comController.text, time: DateTime.now()));

              comController.text = "";
            },
          )));
    });
  }
}
