import 'package:flutter/material.dart';
import 'package:meshapp/Screens/AuditionAndCompetition/Views/active_compition.dart';
import 'package:meshapp/Screens/AuditionAndCompetition/Views/my_compitition.dart';
import 'package:meshapp/Widgets/custom_viewpager.dart';

class CompetitionView extends StatefulWidget {
  const CompetitionView({Key? key}) : super(key: key);

  @override
  _CompetitionViewState createState() => _CompetitionViewState();
}

class _CompetitionViewState extends State<CompetitionView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15),
      child: CustomViewPager(
        listTags: ["Active competition", "My competition"],
        listViews: [ActiveCompitition(), MyCompition()],
      ),
    );
  }
}
