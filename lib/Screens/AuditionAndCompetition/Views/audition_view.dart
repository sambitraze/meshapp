import 'package:flutter/material.dart';
import 'package:meshapp/Screens/AuditionAndCompetition/Views/active_compition.dart';
import 'package:meshapp/Widgets/custom_viewpager.dart';

import 'my_compitition.dart';

class AuditionView extends StatefulWidget {
  const AuditionView({Key? key}) : super(key: key);

  @override
  _AuditionViewState createState() => _AuditionViewState();
}

class _AuditionViewState extends State<AuditionView> {
  @override
  Widget build(BuildContext context) {
    return Container(
        // child: CustomViewPager(
        //   listTags: ["Active audition", "My audition"],
        //   listViews: [ActiveCompitition(), MyCompition()],
        // ),
        );
  }
}
