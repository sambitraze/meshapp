import 'package:get/get.dart';
import 'package:meshapp/Home/Model/post_model.dart';

class HomePostController extends GetxController {
  List<PostModel> listPost = [];
  Future addUserPost(model) async {
    listPost.add(model);
    update();
  }
}
