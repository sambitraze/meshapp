import 'package:get/get.dart';
import 'package:meshapp/Screens/Chat/Model/chat_friend_model.dart';
import 'package:meshapp/Screens/Chat/Model/chat_model.dart';
import 'package:meshapp/Screens/Chat/Model/message_model.dart';

class ChatController extends GetxController {
  List<ChatModel> listConversations = [
    ChatModel(
        id: 1,
        name: "Ankur",
        image:
            "https://images.pexels.com/photos/620340/pexels-photo-620340.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
        message: "Lets meet tomorrow",
        time: ". 3:09 PM",
        isOnline: false,
        status: "deliver"),
    ChatModel(
        id: 1,
        name: "Stella",
        image:
            "https://images.pexels.com/photos/1755385/pexels-photo-1755385.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
        message: "Hey What's up?",
        time: ". Wed",
        isOnline: true,
        status: "unread"),
    ChatModel(
        id: 1,
        name: "Stella",
        image:
            "https://images.pexels.com/photos/1755385/pexels-photo-1755385.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
        message: "Hey What's up?",
        time: ". Wed",
        isOnline: true,
        status: "unread")
  ];
  List<ChatFriendModel> listFriends = [
    ChatFriendModel(
        name: "Tanim",
        isOnline: true,
        image:
            "https://images.pexels.com/photos/620340/pexels-photo-620340.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"),
    ChatFriendModel(
        name: "Ankur",
        isOnline: false,
        image:
            "https://images.pexels.com/photos/1399288/pexels-photo-1399288.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
    ChatFriendModel(
        name: "Stella",
        isOnline: false,
        image:
            "https://images.pexels.com/photos/1755385/pexels-photo-1755385.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"),
    ChatFriendModel(
      name: "Rosy",
      isOnline: true,
      image:
          "https://images.pexels.com/photos/1766938/pexels-photo-1766938.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
    ),
    ChatFriendModel(
        name: "Ani",
        isOnline: false,
        image:
            "https://images.pexels.com/photos/1399288/pexels-photo-1399288.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
    ChatFriendModel(
        name: "Tanim",
        isOnline: true,
        image:
            "https://images.pexels.com/photos/620340/pexels-photo-620340.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"),
  ];
  List<MessageModel> listMessage = [];
  Future sendMessage(model) async {
    listMessage.add(model);
    update();
  }
}
