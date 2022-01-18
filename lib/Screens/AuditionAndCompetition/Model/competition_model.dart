import 'package:meshapp/Screens/Win/Model/artist_model.dart';

class CompetitionModel {
  var title;
  var desc;
  var category;
  var location;
  var applyDate;
  var applyBeforeDate;
  var comapnyName;
  var companyImage;

  var status;
  List<ArtistModel>? listOffers;
  CompetitionModel(
      {this.applyDate,
      this.category,
      this.desc,
      this.listOffers,
      this.location,
      this.status,
      this.applyBeforeDate,
      this.comapnyName,
      this.companyImage,
      this.title});
}
