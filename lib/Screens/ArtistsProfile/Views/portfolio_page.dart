import 'package:flutter/material.dart';
import 'package:meshapp/Screens/ArtistsProfile/Widgets/tabbar_widget.dart';
import 'package:meshapp/Screens/Win/Model/artist_model.dart';

class PortfolioPage extends StatefulWidget {
    ArtistModel? model;

   PortfolioPage({Key? key,this.model}) : super(key: key);

  @override
  _PortfolioPageState createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: ProfileTabbarWidget(model: widget.model,),
    );
  }
}
