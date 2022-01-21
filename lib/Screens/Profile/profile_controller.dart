import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:meshapp/Screens/Profile/profile_model.dart';

class ProfileController extends GetxController {
  ProfileModel profileModel = ProfileModel(
      name: "Anie Jhonson",
      image:
          "https://images.unsplash.com/photo-1593010932917-92bd21088dee?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTl8fGRhbmNlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60",
      gender: "Female",
      age: "21",
      folloers: "1023",
      followings: "1022",
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
      listQuestions: [
        "Another upcoming game strom coming soon,be ready urban city.Darklight Back 😍",
        "be ready urban city.Darklight Back 😍"
      ],
      listBookmarkImages: [
        "https://images.unsplash.com/photo-1593010932917-92bd21088dee?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTl8fGRhbmNlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60",
        "https://images.unsplash.com/photo-1547153760-18fc86324498?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8ZGFuY2V8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60",
        "https://images.unsplash.com/photo-1535525153412-5a42439a210d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8ZGFuY2V8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60",
        "https://media.istockphoto.com/photos/asian-young-woman-created-her-dancing-video-by-smartphone-camera-to-picture-id1303246836?b=1&k=20&m=1303246836&s=170667a&w=0&h=Sqt9wr0bzr9tZ2vcx1hoXGkVgK9RIzeXQ1dm69MM0zg=",
        "https://media.istockphoto.com/photos/childhood-and-dream-about-big-and-famous-future-conceptual-image-with-picture-id1302452450?b=1&k=20&m=1302452450&s=170667a&w=0&h=bZ2TZ7fHPc99hky0uSSZhZXm-gGjmjRGFcQYAdbY6ZA="
      ],
      listBookmarkVideos: [
        "https://storage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
        "https://storage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
      ],
      listBookmarkQuestions: [
        "Another upcoming game strom coming soon,be ready urban city.Darklight Back 😍",
        "be ready urban city.Darklight Back 😍"
      ]);
}
