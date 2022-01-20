import 'dart:io';

import 'package:meshapp/Screens/Win/Model/artist_model.dart';

class TrainingModel {
  var title;
  var desc;
  var category;
  var price;
  var applyDate;
  var applyBeforeDate;
  var comapnyName;
  var companyImage;
  var offerDesc;
  var courseLink;
  double? rating;
  List<File>? listFiles;
  List<String>? listFilesUrl;

  var status;
  List<ArtistModel>? listOffers;
  TrainingModel(
      {this.applyDate,
      this.category,
      this.desc,
      this.listOffers,
      this.price,
      this.rating,
      this.status,
      this.applyBeforeDate,
      this.comapnyName,
      this.companyImage,
      this.courseLink,
      this.offerDesc,
      this.listFiles,
      this.listFilesUrl,
      this.title});
}
