import 'package:get/get.dart';
import 'package:meshapp/Screens/AuditionAndCompetition/Model/competition_model.dart';

class CompetitionController extends GetxController {
  List<CompetitionModel> listCompetitions = [
    CompetitionModel(
        comapnyName: "Mesh-studio",
        companyImage:
            "https://cdn.pixabay.com/photo/2017/03/27/12/45/hindu-2178480_1280.jpg",
        title: "Wanted Song Composer",
        applyDate: "30 July, 2021",
        applyBeforeDate: "30 Dec, 2021",
        category: "-Singing",
        desc:
            "We want a experience song composer.My comapny has a large number of employees i think you want to become our company member.",
        listOffers: [],
        location: "New-Delhi",
        status: "Applied"),
    CompetitionModel(
        comapnyName: "Dance-studio",
        companyImage:
            "https://cdn.pixabay.com/photo/2018/02/06/14/07/ease-3134828_1280.jpg",
        title: "Want A Hiphop dancer",
        applyDate: "01 Aug, 2021",
        applyBeforeDate: "30 Aug, 2021",
        category: "-Dence",
        desc:
            "Are you joining our team? we give you attractive pay and also give a chance to a bollywood movie",
        listOffers: [],
        location: "Haryaana",
        status: "Expires Soon"),
    CompetitionModel(
        comapnyName: "T-Series",
        companyImage:
            "https://cdn.pixabay.com/photo/2016/03/30/05/41/music-1290087_1280.jpg",
        title: "Wanted Punjabi singer",
        applyDate: "30 July, 2021",
        applyBeforeDate: "30 Dec, 2021",
        category: "-Singing",
        desc:
            "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint.  Exercitation veniam consequat sunt nostrud amet.",
        listOffers: [],
        location: "New-Delhi",
        status: "")
  ];
  List<CompetitionModel> listMyCompetitiions = [];

  List<String> listCategoeries = [
    "Music And Audio",
    "Writing And Translation",
    "Singing",
    "Art",
    "Dance",
    "Excersice And Yoga",
    "Music And Audio",
    "Writing And Translation",
    "Singing",
    "Art",
    "Dance",
    "Excersice And Yoga",
    "Music And Audio",
    "Writing And Translation",
    "Singing",
    "Art",
    "Dance",
    "Excersice And Yoga",
    "Music And Audio",
    "Writing And Translation",
    "Singing",
    "Art",
    "Dance",
    "Excersice And Yoga"
  ];
  Future addToMyCompetition(CompetitionModel model) async {
    listMyCompetitiions.add(model);
    update();
  }
}
