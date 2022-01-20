import 'package:get/get.dart';
import 'package:meshapp/Screens/AuditionAndCompetition/Competition/Model/competition_model.dart';

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
        listFilesUrl: [
          "https://media.istockphoto.com/photos/futuristic-woman-dance-pose-picture-id1300011415?b=1&k=20&m=1300011415&s=170667a&w=0&h=h5e59yQQtlu6mZyvispB2YmiYyWu3jB35tsXhRtboFU=",
          "https://images.unsplash.com/photo-1547153760-18fc86324498?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8ZGFuY2V8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60",
          "https://images.unsplash.com/photo-1535525153412-5a42439a210d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8ZGFuY2V8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60",
          "https://images.unsplash.com/photo-1541904845547-0eaf866de232?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fGRhbmNlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60",
        ],
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
        listFilesUrl: [
          "https://media.istockphoto.com/photos/futuristic-woman-dance-pose-picture-id1300011415?b=1&k=20&m=1300011415&s=170667a&w=0&h=h5e59yQQtlu6mZyvispB2YmiYyWu3jB35tsXhRtboFU=",
          "https://images.unsplash.com/photo-1547153760-18fc86324498?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8ZGFuY2V8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60",
          "https://images.unsplash.com/photo-1535525153412-5a42439a210d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8ZGFuY2V8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60",
          "https://images.unsplash.com/photo-1541904845547-0eaf866de232?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fGRhbmNlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60",
        ],
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
        listFilesUrl: [
          "https://media.istockphoto.com/photos/futuristic-woman-dance-pose-picture-id1300011415?b=1&k=20&m=1300011415&s=170667a&w=0&h=h5e59yQQtlu6mZyvispB2YmiYyWu3jB35tsXhRtboFU=",
          "https://images.unsplash.com/photo-1547153760-18fc86324498?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8ZGFuY2V8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60",
          "https://images.unsplash.com/photo-1535525153412-5a42439a210d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8ZGFuY2V8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60",
          "https://images.unsplash.com/photo-1541904845547-0eaf866de232?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fGRhbmNlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60",
        ],
        status: "")
  ];
  List<CompetitionModel> listMyCompetitiions = [];
 
  List<CompetitionModel> listMyAudiions = [];

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
  List<CompetitionModel> listOffers = [
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
        listFilesUrl: [
          "https://media.istockphoto.com/photos/futuristic-woman-dance-pose-picture-id1300011415?b=1&k=20&m=1300011415&s=170667a&w=0&h=h5e59yQQtlu6mZyvispB2YmiYyWu3jB35tsXhRtboFU=",
          "https://images.unsplash.com/photo-1547153760-18fc86324498?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8ZGFuY2V8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60",
          "https://images.unsplash.com/photo-1535525153412-5a42439a210d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8ZGFuY2V8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60",
          "https://images.unsplash.com/photo-1541904845547-0eaf866de232?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fGRhbmNlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60",
        ],
        location: "New-Delhi",
        offerDesc:
            "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.",
        status: ""),
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
        listFilesUrl: [
          "https://images.unsplash.com/photo-1535525153412-5a42439a210d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8ZGFuY2V8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60",
          "https://images.unsplash.com/photo-1541904845547-0eaf866de232?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fGRhbmNlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60",
        ],
        offerDesc:
            "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint.",
        location: "New-Delhi",
        status: "Applied")
  ];
  Future addToMyCompetition(CompetitionModel model) async {
    listMyCompetitiions.add(model);
    update();
  }

  Future addToMyAudition(CompetitionModel model) async {
    listMyAudiions.add(model);
    update();
  }

  Future addToMyCompetitionOffers(CompetitionModel model) async {
    listOffers.add(model);
    update();
  }

  Future removeFROMMyCompetition(CompetitionModel model) async {
    listMyCompetitiions.removeWhere((element) => element == model);
    update();
  }

  Future removeFROMMyAudion(CompetitionModel model) async {
    listMyAudiions.removeWhere((element) => element == model);
    update();
  }

  Future removeFROMMyCompetitionOffer(CompetitionModel model) async {
    listOffers.removeWhere((element) => element == model);
    update();
  }
}
