import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:meshapp/core/Models/comment_model.dart';
import 'package:timeago/timeago.dart' as timeago;

class CommentController extends GetxController {
  List<CommentModel> listComments = [];
  Future addComment(model) async {
    listComments.add(model);
    update();
  }

  Future<String> getTimeAgo(DateTime time) async {
    return timeago.format(time, locale: 'en_short');
  }
}
