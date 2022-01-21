import 'package:meshapp/Home/Model/post_model.dart';

class ProfileModel {
  var name;
  var id;
  var image;
  var gender;
  var age;
  var folloers;
  var followings;
  List<String>? listPostImages;
  List<String>? listPostVideos;
  List<String>? listQuestions;

  List<String>? listBookmarkImages;
  List<String>? listBookmarkVideos;
  List<String>? listBookmarkQuestions;
  ProfileModel(
      {this.age,
      this.folloers,
      this.followings,
      this.gender,
      this.id,
      this.image,
      this.listBookmarkImages,
      this.listBookmarkQuestions,
      this.listBookmarkVideos,
      this.listPostImages,
      this.listPostVideos,
      this.listQuestions,
      this.name});
}
