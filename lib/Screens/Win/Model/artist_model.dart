import 'package:meshapp/Screens/Win/Model/experience_model.dart';
import 'package:meshapp/Screens/Win/Model/skill_model.dart';
import 'package:meshapp/Screens/Win/Model/social_model.dart';
import 'package:meshapp/Screens/Win/Model/training_model.dart';

class ArtistModel {
  var name;
  var id;
  var designation;
  var image;
  var gender;
  var age;
  var folloers;
  var followings;
  var about;
  var experience;
  var training;
  List<SkillModel>? skills;
  List<ExperienceModel>? experiences;
  List<TrainingModel>? trainingTags;
  List<String>? listPostImages;
  List<String>? listPostVideos;
  List<SocialModel>? listSocial;
  
  ArtistModel(
      {this.about,
      this.age,
      this.designation,
      this.experience,
      this.experiences,
      this.folloers,
      this.followings,
      this.gender,
      this.id,
      this.image,
      this.listPostImages,
      this.listPostVideos,
      this.listSocial,
      this.name,
      this.skills,
      this.training,
      this.trainingTags});
}
