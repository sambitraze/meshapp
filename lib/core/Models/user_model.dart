// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.emailVerifiedAt,
    required this.currentTeamId,
    required this.profilePhotoPath,
    required this.createdAt,
    required this.updatedAt,
    required this.phoneNumber,
    required this.postalCode,
    required this.type,
    required this.status,
    required this.phone,
    required this.gender,
    required this.birthDate,
    required this.webservice,
    required this.active,
    required this.emailVerifyToken,
    required this.profilePhotoUrl,
  });

  int id;
  String firstName;
  String lastName;
  String email;
  DateTime? emailVerifiedAt;
  dynamic currentTeamId;
  dynamic profilePhotoPath;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic phoneNumber;
  dynamic postalCode;
  int type;
  int status;
  int phone;
  dynamic gender;
  dynamic birthDate;
  bool webservice;
  bool active;
  String emailVerifyToken;
  String profilePhotoUrl;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"] == null ? null : json["id"],
        firstName: json["first_name"] == null ? null : json["first_name"],
        lastName: json["last_name"] == null ? null : json["last_name"],
        email: json["email"] == null ? null : json["email"],
        emailVerifiedAt: json["email_verified_at"] == null
            ? null
            : DateTime.parse(json["email_verified_at"]),
        currentTeamId: json["current_team_id"],
        profilePhotoPath: json["profile_photo_path"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        phoneNumber: json["phone_number"],
        postalCode: json["postal_code"],
        type: json["type"] == null ? null : json["type"],
        status: json["status"] == null ? null : json["status"],
        phone: json["phone"] == null ? null : json["phone"],
        gender: json["gender"],
        birthDate: json["birth_date"],
        webservice: json["webservice"] == null ? null : json["webservice"],
        active: json["active"] == null ? null : json["active"],
        emailVerifyToken: json["email_verify_token"] == null
            ? null
            : json["email_verify_token"],
        profilePhotoUrl: json["profile_photo_url"] == null
            ? null
            : json["profile_photo_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "first_name": firstName == null ? null : firstName,
        "last_name": lastName == null ? null : lastName,
        "email": email == null ? null : email,
        "email_verified_at":
            emailVerifiedAt == null ? null : emailVerifiedAt!.toIso8601String(),
        "current_team_id": currentTeamId,
        "profile_photo_path": profilePhotoPath,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "phone_number": phoneNumber,
        "postal_code": postalCode,
        "type": type == null ? null : type,
        "status": status == null ? null : status,
        "phone": phone == null ? null : phone,
        "gender": gender,
        "birth_date": birthDate,
        "webservice": webservice == null ? null : webservice,
        "active": active == null ? null : active,
        "email_verify_token":
            emailVerifyToken == null ? null : emailVerifyToken,
        "profile_photo_url": profilePhotoUrl == null ? null : profilePhotoUrl,
      };
}
