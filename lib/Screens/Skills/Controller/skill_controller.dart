import 'package:get/get.dart';
import 'package:meshapp/Screens/Skills/Models/skill_model.dart';

class SkillController extends GetxController {
  List<SkillModel> listSkills = [
    SkillModel(id: 1, title: "Photography", image: "images/photography.png"),
    SkillModel(id: 2, title: "Shopping", image: "images/Shopping.png"),
    SkillModel(id: 3, title: "Karaoke", image: "images/Karaoke.png"),
    SkillModel(id: 4, title: "Yoga", image: "images/Yoga.png"),
    SkillModel(id: 5, title: "Cooking", image: "images/Cooking.png"),
    SkillModel(id: 6, title: "Tennis", image: "images/Tennis.png"),
    SkillModel(id: 7, title: "Run", image: "images/Run.png"),
    SkillModel(id: 8, title: "Swimming", image: "images/Swimming.png"),
    SkillModel(id: 9, title: "Art", image: "images/Art.png"),
    SkillModel(id: 10, title: "Travelling", image: "images/Travelling.png"),
    SkillModel(id: 11, title: "Extreme", image: "images/Extreme.png"),
    SkillModel(id: 12, title: "Music", image: "images/Music.png"),
    SkillModel(id: 13, title: "Drink", image: "images/Drink.png"),
    SkillModel(id: 14, title: "Video games", image: "images/game.png"),
  ];
  List<SkillModel> selectedlistSkills = [];
  void updateSkills(SkillModel model) {
    if (selectedlistSkills.contains(model)) {
      selectedlistSkills.removeWhere((element) => element == model);
    } else {
      selectedlistSkills.add(model);
    }
    print(selectedlistSkills.length);
    update();
  }
}
