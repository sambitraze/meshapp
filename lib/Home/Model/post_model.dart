// To parse this JSON data, do
//
//     final postModel = postModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

PostModel postModelFromJson(String str) => PostModel.fromJson(json.decode(str));

String postModelToJson(PostModel data) => json.encode(data.toJson());

class PostModel {
  PostModel({
    required this.user,
    required this.post,
  });

  User? user;
  Post? post;

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        post: json["post"] == null ? null : Post.fromJson(json["post"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user == null ? null : user!.toJson(),
        "post": post == null ? null : post!.toJson(),
      };
}

class Post {
  Post({
    required this.type,
    required this.createdAt,
    required this.image,
    required this.video,
    required this.likes,
    required this.comments,
    required this.message,
    required this.tags,
  });

  String type;
  DateTime? createdAt;
  String image;
  String video;
  int likes;
  int comments;
  String message;
  List<String>? tags;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        type: json["type"] == null ? null : json["type"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        image: json["image"] == null ? null : json["image"],
        video: json["video"] == null ? null : json["video"],
        likes: json["likes"] == null ? null : json["likes"],
        comments: json["comments"] == null ? null : json["comments"],
        message: json["message"] == null ? null : json["message"],
        tags: json["tags"] == null
            ? null
            : List<String>.from(json["tags"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "type": type == null ? null : type,
        "createdAt": createdAt == null
            ? null
            : "${createdAt!.year.toString().padLeft(4, '0')}-${createdAt!.month.toString().padLeft(2, '0')}-${createdAt!.day.toString().padLeft(2, '0')}",
        "image": image == null ? null : image,
        "video": video == null ? null : video,
        "likes": likes == null ? null : likes,
        "comments": comments == null ? null : comments,
        "message": message == null ? null : message,
        "tags": tags == null ? null : List<dynamic>.from(tags!.map((x) => x)),
      };
}

class User {
  User({
    required this.name,
    required this.profileurl,
  });

  String name;
  String profileurl;

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"] == null ? null : json["name"],
        profileurl: json["profileurl"] == null ? null : json["profileurl"],
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "profileurl": profileurl == null ? null : profileurl,
      };
}
