import 'package:flutter/material.dart';
import 'package:meshapp/Screens/AuditionAndCompetition/Competition/Views/active_compition.dart';
import 'package:meshapp/Screens/AuditionAndCompetition/Competition/Views/my_compitition.dart';
import 'package:meshapp/Widgets/custom_viewpager.dart';

bool? isCompetition;

class CompetitionView extends StatefulWidget {
  bool isCompetitionn;

  CompetitionView(this.isCompetitionn, {Key? key}) : super(key: key);

  @override
  _CompetitionViewState createState() => _CompetitionViewState();
}

class _CompetitionViewState extends State<CompetitionView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isCompetition = widget.isCompetitionn;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15),
      child: CustomViewPager(
        listTags: [
          "Active ${isCompetition! ? "competition" : "audition"}",
          "My ${isCompetition! ? "competition" : "audition"}"
        ],
        listViews: [ActiveCompitition(), MyCompition()],
      ),
    );
  }
}
