import 'package:flutter/material.dart';
import 'package:meshapp/Screens/AuditionAndCompetition/Competition/Views/active_compition.dart';
import 'package:meshapp/Screens/AuditionAndCompetition/Competition/Views/my_compitition.dart';
import 'package:meshapp/Screens/TrainingAndEarning/MyTraing/View/active_training_view.dart';
import 'package:meshapp/Widgets/custom_viewpager.dart';

import 'all_training_view.dart';
import 'my_training.dart';

bool? isCompetition;

class MyTrainigMainView extends StatefulWidget {
  bool isCompetitionn;

  MyTrainigMainView(this.isCompetitionn, {Key? key}) : super(key: key);

  @override
  _MyTrainigMainViewState createState() => _MyTrainigMainViewState();
}

class _MyTrainigMainViewState extends State<MyTrainigMainView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isCompetition = widget.isCompetitionn;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.only(top: 15),
      child: CustomViewPager(
        listTags: ["Active Training ", "All Courses", "My Training"],
        listViews: [ActiveTrainingView(), AllTrainingView(), MyTrainin()],
      ),
    );
  }
}
