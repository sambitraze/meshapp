import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meshapp/Home/Widgets/search_widget.dart';
import 'package:meshapp/Screens/Chat/Controller/chat_controller.dart';
import 'package:meshapp/Screens/Chat/Model/chat_friend_model.dart';
import 'package:meshapp/Screens/Chat/user_chat_screen.dart';
import 'package:meshapp/UIController/app_theme.dart';
import 'package:meshapp/UIController/text_styles.dart';
import 'package:meshapp/core/helpers/ui_helpers.dart';

import 'Model/chat_model.dart';

class Chats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = UIHelper.getScreenSize(context);
    Get.put(ChatController());
    return GetBuilder<ChatController>(builder: (builder) {
      return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
            leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(Icons.arrow_back, color: Colors.black)),
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 16.0, bottom: 8.0),
            child: ListView(
              children: <Widget>[
                chatHeader(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: HomeSearchWidget(),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Container(height: 100.0, child: Circular(builder)),
                ),
                for (ChatModel model in builder.listConversations)
                  CircleProfs(model, size),
                SizedBox(
                  height: 20.0,
                ),
              ],
            ),
          ));
    });
  }

  Row chatHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            width: 70,
            height: 70,
            child: Stack(children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://cdn.pixabay.com/photo/2015/01/06/16/14/woman-590490__340.jpg'),
                radius: 30,
              ),
              Positioned(
                top: 3,
                right: 0,
                child: Container(
                  width: 30,
                  height: 20,
                  //  transform: Matrix4.translationValues(15, 5, 0),
                  decoration: BoxDecoration(
                      color: Colors.red,
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(25)),
                  child: Center(
                    child: Text(
                      "9+",
                      style: textStyleRobotoBold(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )
            ])),
        Text("Chat", style: textStyleRobotoSemiBold(fontSize: 24))
      ],
    );
  }

  CircleProfs(ChatModel model, size) {
    return InkWell(
      onTap: () {
        Get.to(UserChatScreen(
          model: ChatFriendModel(
            
              name: model.name, image: model.image, isOnline: model.isOnline),
        ));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(shape: BoxShape.circle),
        child: Row(
          children: <Widget>[
            Stack(
              fit: StackFit.passthrough,
              children: <Widget>[
                CircleAvatar(
                  radius: 32.0,
                  backgroundColor:
                      model.isOnline! ? AppTheme.primaryColor : Colors.white,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(model.image),
                    radius: 30.0,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      model.isOnline! ? 46.0 : 37.0, 37.0, 0.0, 0.0),
                  child: model.isOnline!
                      ? Container(
                          width: 20.0,
                          height: 20.0,
                          decoration: BoxDecoration(
                              color: model.isOnline == true
                                  ? AppTheme.primaryColor
                                  : Colors.grey,
                              border: Border.all(
                                width: 4.0,
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(15.0)),
                        )
                      : Container(
                          width: 30,
                          height: 20,
                          //  transform: Matrix4.translationValues(15, 5, 0),
                          decoration: BoxDecoration(
                              color: Color(0xffE5F8DF),
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(25)),
                          child: Center(
                            child: Text(
                              "11m",
                              style: textStyleRobotoBold(
                                  color: Colors.black, fontSize: 10),
                            ),
                          ),
                        ),
                )
              ],
            ),
            SizedBox(
              width: 10.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  model.name,
                  style: textStyleRobotoSemiBold(fontSize: 14),
                ),
                SizedBox(
                  height: 4.0,
                ),
                Container(
                  width: size.width - 110,
                  child: Row(
                    children: <Widget>[
                      Text(
                        model.message,
                        style: textStyleRobotoSemiBold(
                            fontSize: 12, color: Colors.grey),
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 2.0,
                      ),
                      Text(
                        model.time,
                        style: textStyleRobotoSemiBold(
                            fontSize: 12, color: Colors.grey),
                      ),
                      Spacer(),
                      model.status == "unread"
                          ? Container(
                              width: 15,
                              height: 15,
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(25)),
                            )
                          : Container(
                              child: Image.asset("images/Read.png",
                                  width: 15, height: 15))
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  CircleProfss(ChatFriendModel model) {
    return GestureDetector(
      onTap: () {
        Get.to(UserChatScreen(model: model));
      },
      child: Container(
        decoration: BoxDecoration(shape: BoxShape.circle),
        width: 70,
        margin: EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          children: <Widget>[
            Stack(
              fit: StackFit.passthrough,
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: NetworkImage(model.image!),
                  radius: 30.0,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(45.0, 35.0, 3.0, 2.0),
                  child: Container(
                    width: 20.0,
                    height: 20.0,
                    decoration: BoxDecoration(
                        color: model.isOnline == true
                            ? AppTheme.primaryColor
                            : Colors.grey,
                        border: Border.all(
                          width: 4.0,
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(15.0)),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 1.0,
            ),
            AutoSizeText(
              model.name!,
              maxLines: 2,
              minFontSize: 12,
              maxFontSize: 14,
              textAlign: TextAlign.center,
              style: textStyleRobotoBold(
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget Circular(builder1) {
    return GetBuilder<ChatController>(builder: (builder) {
      return ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: 20.0,
                height: 20.0,
                decoration: BoxDecoration(
                    color: AppTheme.primaryColor,
                    border: Border.all(
                      width: 4.0,
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(15.0)),
              ),
              Text(
                "Online",
                style: textStyleRobotoBold(fontSize: 12),
              )
            ],
          ),
          SizedBox(
            width: 20.0,
          ),
          for (ChatFriendModel friendModel in builder.listFriends)
            CircleProfss(friendModel),
        ],
      );
    });
  }
}
