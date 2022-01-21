import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:meshapp/Screens/Win/Model/artist_model.dart';
import 'package:meshapp/Screens/Win/Model/experience_model.dart';
import 'package:meshapp/Screens/Win/Model/skill_model.dart';
import 'package:meshapp/Screens/Win/Model/social_model.dart';
import 'package:meshapp/Screens/Win/Model/training_model.dart';

class ArtistController extends GetxController {
  List<ArtistModel> listArtists = [
    ArtistModel(
        name: "James Bute",
        designation: "Artist",
        image:
            "https://cdn.pixabay.com/photo/2015/01/06/16/14/woman-590490__340.jpg",
        gender: "Male",
        age: "21",
        folloers: "312",
        followings: "102",
        about:
            "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.Read More",
        experience:
            "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.Read More",
        training:
            "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.Read More",
        skills: [
          SkillModel(title: "Theatre", color: Colors.purple),
          SkillModel(title: "Music", color: Colors.red),
          SkillModel(title: "Art", color: Colors.pink),
          SkillModel(title: "Modeling", color: Colors.green),
          SkillModel(title: "Others", color: Colors.lightBlue)
        ],
        experiences: [
          ExperienceModel(title: "Videography 1 Year", color: Colors.purple),
          ExperienceModel(title: "Photography 2 years", color: Colors.red),
          ExperienceModel(title: "Modeling 1 year", color: Colors.green),
        ],
        trainingTags: [
          TrainingModel(title: "Doodle 1 year 1 month", color: Colors.purple),
          TrainingModel(title: "ETC 1 year", color: Colors.red),
        ],
        listPostImages: [
          "https://media.istockphoto.com/photos/futuristic-woman-dance-pose-picture-id1300011415?b=1&k=20&m=1300011415&s=170667a&w=0&h=h5e59yQQtlu6mZyvispB2YmiYyWu3jB35tsXhRtboFU=",
          "https://images.unsplash.com/photo-1547153760-18fc86324498?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8ZGFuY2V8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60",
          "https://images.unsplash.com/photo-1535525153412-5a42439a210d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8ZGFuY2V8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60",
          "https://images.unsplash.com/photo-1541904845547-0eaf866de232?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fGRhbmNlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60",
          "https://images.unsplash.com/photo-1495791185843-c73f2269f669?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fGRhbmNlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60"
        ],
        listPostVideos: [
          "https://storage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4",
          "https://storage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4",
          "https://storage.googleapis.com/gtv-videos-bucket/sample/ForBiggerMeltdowns.mp4",
          "https://storage.googleapis.com/gtv-videos-bucket/sample/SubaruOutbackOnStreetAndDirt.mp4",
        ],
        listSocial: [
          SocialModel(platform: "Facebook", image: "images/facebook.png"),
          SocialModel(platform: "Twitter", image: "images/twitter.png"),
          SocialModel(platform: "Linkdlin", image: "images/linkdlin.png"),
          SocialModel(platform: "Instagram", image: "images/insta.png")
        ]),
    ArtistModel(
        name: "Anie Jhonson",
        designation: "Dancer",
        image:
            "https://images.unsplash.com/photo-1593010932917-92bd21088dee?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTl8fGRhbmNlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60",
        gender: "Female",
        age: "21",
        folloers: "1023",
        followings: "1022",
        about:
            "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.Read More",
        experience:
            "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.Read More",
        training:
            "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.Read More",
        skills: [
          SkillModel(title: "Theatre", color: Colors.purple),
          SkillModel(title: "Music", color: Colors.red),
          SkillModel(title: "Art", color: Colors.pink),
        ],
        experiences: [
          ExperienceModel(title: "Videography 2 Year", color: Colors.purple),
          ExperienceModel(title: "Photography 5 years", color: Colors.red),
          ExperienceModel(title: "Modeling 1 year", color: Colors.green),
        ],
        trainingTags: [
          TrainingModel(title: "Doodle 1 year 1 month", color: Colors.purple),
          TrainingModel(title: "ETC 1 year", color: Colors.red),
        ],
        listPostImages: [
          "https://images.unsplash.com/photo-1593010932917-92bd21088dee?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTl8fGRhbmNlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60",
          "https://images.unsplash.com/photo-1547153760-18fc86324498?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8ZGFuY2V8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60",
          "https://images.unsplash.com/photo-1535525153412-5a42439a210d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8ZGFuY2V8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60",
          "https://media.istockphoto.com/photos/asian-young-woman-created-her-dancing-video-by-smartphone-camera-to-picture-id1303246836?b=1&k=20&m=1303246836&s=170667a&w=0&h=Sqt9wr0bzr9tZ2vcx1hoXGkVgK9RIzeXQ1dm69MM0zg=",
          "https://media.istockphoto.com/photos/childhood-and-dream-about-big-and-famous-future-conceptual-image-with-picture-id1302452450?b=1&k=20&m=1302452450&s=170667a&w=0&h=bZ2TZ7fHPc99hky0uSSZhZXm-gGjmjRGFcQYAdbY6ZA="
        ],
        listPostVideos: [
          "https://storage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
          "https://storage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
        ],
        listSocial: [
          SocialModel(platform: "Facebook", image: "images/facebook.png"),
          SocialModel(platform: "Twitter", image: "images/twitter.png"),
          SocialModel(platform: "Linkdlin", image: "images/linkdlin.png"),
          SocialModel(platform: "Instagram", image: "images/insta.png")
        ]),
  ];
  List<ArtistModel> listFollowRequets = [
    ArtistModel(
        name: "Sheruk khan",
        designation: "Artist",
        image:
            "https://cdn.pixabay.com/photo/2015/01/06/16/14/woman-590490__340.jpg",
        gender: "Male",
        age: "21",
        folloers: "100",
        followings: "02",
        about:
            "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.Read More",
        experience:
            "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.Read More",
        training:
            "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.Read More",
        skills: [
          SkillModel(title: "Theatre", color: Colors.purple),
          SkillModel(title: "Music", color: Colors.red),
          SkillModel(title: "Art", color: Colors.pink),
          SkillModel(title: "Modeling", color: Colors.green),
          SkillModel(title: "Others", color: Colors.lightBlue)
        ],
        experiences: [
          ExperienceModel(title: "Videography 1 Year", color: Colors.purple),
          ExperienceModel(title: "Photography 2 years", color: Colors.red),
          ExperienceModel(title: "Modeling 1 year", color: Colors.green),
        ],
        trainingTags: [
          TrainingModel(title: "Doodle 1 year 1 month", color: Colors.purple),
          TrainingModel(title: "ETC 1 year", color: Colors.red),
        ],
        listPostImages: [
          "https://media.istockphoto.com/photos/futuristic-woman-dance-pose-picture-id1300011415?b=1&k=20&m=1300011415&s=170667a&w=0&h=h5e59yQQtlu6mZyvispB2YmiYyWu3jB35tsXhRtboFU=",
          "https://images.unsplash.com/photo-1547153760-18fc86324498?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8ZGFuY2V8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60",
          "https://images.unsplash.com/photo-1535525153412-5a42439a210d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8ZGFuY2V8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60",
          "https://images.unsplash.com/photo-1541904845547-0eaf866de232?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fGRhbmNlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60",
          "https://images.unsplash.com/photo-1495791185843-c73f2269f669?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fGRhbmNlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60"
        ],
        listPostVideos: [
          "https://storage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4",
          "https://storage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4",
          "https://storage.googleapis.com/gtv-videos-bucket/sample/ForBiggerMeltdowns.mp4",
          "https://storage.googleapis.com/gtv-videos-bucket/sample/SubaruOutbackOnStreetAndDirt.mp4",
        ],
        listSocial: [
          SocialModel(platform: "Facebook", image: "images/facebook.png"),
          SocialModel(platform: "Twitter", image: "images/twitter.png"),
          SocialModel(platform: "Linkdlin", image: "images/linkdlin.png"),
          SocialModel(platform: "Instagram", image: "images/insta.png")
        ]),
    ArtistModel(
        name: "Sulman Khan",
        designation: "Actor",
        image:
            "https://images.unsplash.com/photo-1593010932917-92bd21088dee?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTl8fGRhbmNlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60",
        gender: "Male",
        age: "21",
        folloers: "1023",
        followings: "1022",
        about:
            "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.Read More",
        experience:
            "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.Read More",
        training:
            "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.Read More",
        skills: [
          SkillModel(title: "Theatre", color: Colors.purple),
          SkillModel(title: "Music", color: Colors.red),
          SkillModel(title: "Art", color: Colors.pink),
        ],
        experiences: [
          ExperienceModel(title: "Videography 2 Year", color: Colors.purple),
          ExperienceModel(title: "Photography 5 years", color: Colors.red),
          ExperienceModel(title: "Modeling 1 year", color: Colors.green),
        ],
        trainingTags: [
          TrainingModel(title: "Doodle 1 year 1 month", color: Colors.purple),
          TrainingModel(title: "ETC 1 year", color: Colors.red),
        ],
        listPostImages: [
          "https://images.unsplash.com/photo-1593010932917-92bd21088dee?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTl8fGRhbmNlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60",
          "https://images.unsplash.com/photo-1547153760-18fc86324498?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8ZGFuY2V8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60",
          "https://images.unsplash.com/photo-1535525153412-5a42439a210d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8ZGFuY2V8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60",
          "https://media.istockphoto.com/photos/asian-young-woman-created-her-dancing-video-by-smartphone-camera-to-picture-id1303246836?b=1&k=20&m=1303246836&s=170667a&w=0&h=Sqt9wr0bzr9tZ2vcx1hoXGkVgK9RIzeXQ1dm69MM0zg=",
          "https://media.istockphoto.com/photos/childhood-and-dream-about-big-and-famous-future-conceptual-image-with-picture-id1302452450?b=1&k=20&m=1302452450&s=170667a&w=0&h=bZ2TZ7fHPc99hky0uSSZhZXm-gGjmjRGFcQYAdbY6ZA="
        ],
        listPostVideos: [
          "https://storage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
          "https://storage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
        ],
        listSocial: [
          SocialModel(platform: "Facebook", image: "images/facebook.png"),
          SocialModel(platform: "Twitter", image: "images/twitter.png"),
          SocialModel(platform: "Linkdlin", image: "images/linkdlin.png"),
          SocialModel(platform: "Instagram", image: "images/insta.png")
        ]),
    ArtistModel(
        name: "Amir Khan",
        designation: "Actor",
        image:
            "https://images.unsplash.com/photo-1535525153412-5a42439a210d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8ZGFuY2V8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60",
        gender: "Male",
        age: "21",
        folloers: "1023",
        followings: "1022",
        about:
            "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.Read More",
        experience:
            "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.Read More",
        training:
            "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.Read More",
        skills: [
          SkillModel(title: "Theatre", color: Colors.purple),
          SkillModel(title: "Music", color: Colors.red),
          SkillModel(title: "Art", color: Colors.pink),
        ],
        experiences: [
          ExperienceModel(title: "Videography 2 Year", color: Colors.purple),
          ExperienceModel(title: "Photography 5 years", color: Colors.red),
          ExperienceModel(title: "Modeling 1 year", color: Colors.green),
        ],
        trainingTags: [
          TrainingModel(title: "Doodle 1 year 1 month", color: Colors.purple),
          TrainingModel(title: "ETC 1 year", color: Colors.red),
        ],
        listPostImages: [
          "https://images.unsplash.com/photo-1593010932917-92bd21088dee?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTl8fGRhbmNlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60",
          "https://images.unsplash.com/photo-1547153760-18fc86324498?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8ZGFuY2V8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60",
          "https://images.unsplash.com/photo-1535525153412-5a42439a210d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8ZGFuY2V8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60",
          "https://media.istockphoto.com/photos/asian-young-woman-created-her-dancing-video-by-smartphone-camera-to-picture-id1303246836?b=1&k=20&m=1303246836&s=170667a&w=0&h=Sqt9wr0bzr9tZ2vcx1hoXGkVgK9RIzeXQ1dm69MM0zg=",
          "https://media.istockphoto.com/photos/childhood-and-dream-about-big-and-famous-future-conceptual-image-with-picture-id1302452450?b=1&k=20&m=1302452450&s=170667a&w=0&h=bZ2TZ7fHPc99hky0uSSZhZXm-gGjmjRGFcQYAdbY6ZA="
        ],
        listPostVideos: [
          "https://storage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
          "https://storage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
        ],
        listSocial: [
          SocialModel(platform: "Facebook", image: "images/facebook.png"),
          SocialModel(platform: "Twitter", image: "images/twitter.png"),
          SocialModel(platform: "Linkdlin", image: "images/linkdlin.png"),
          SocialModel(platform: "Instagram", image: "images/insta.png")
        ]),
  ];

  List<ArtistModel> listFollowArtist = [];
  Future addFollow(model) async {
    listFollowArtist.add(model);
    update();
  }

  Future removeFollow(model) async {
    listFollowArtist.removeWhere((element) => element == model);
    update();
  }

  isFollowing(model) {
    return listFollowArtist.contains(model);
  }

  acceptFollowRequest(model) {
    addFollow(model);
    removeFollowFromRequest(model);
  }

  Future removeFollowFromRequest(model) async {
    listFollowRequets.removeWhere((element) => element == model);
    update();
  }
}
