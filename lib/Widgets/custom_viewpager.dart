import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meshapp/Screens/ArtistsProfile/Views/about_page.dart';
import 'package:meshapp/Screens/ArtistsProfile/Views/experience_page.dart';
import 'package:meshapp/Screens/ArtistsProfile/Views/portfolio_page.dart';
import 'package:meshapp/Screens/ArtistsProfile/Views/training_page.dart';
import 'package:meshapp/Screens/Win/Model/artist_model.dart';
import 'package:meshapp/UIController/app_theme.dart';
import 'package:meshapp/UIController/text_styles.dart';

class CustomViewPager extends StatefulWidget {
  List<String>? listTags;
  List<Widget>? listViews;
  var initialIndex;
  CustomViewPager({Key? key, this.listTags, this.listViews, this.initialIndex})
      : super(key: key);

  @override
  _CustomViewPagerState createState() => _CustomViewPagerState();
}

class _CustomViewPagerState extends State<CustomViewPager> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: DefaultTabController(
      length: widget.listTags!.length,
      initialIndex: widget.initialIndex ?? 0,
      child: Column(
        children: [
          TabBar(
            isScrollable: true,
            indicatorColor: AppTheme.primaryColor,
            unselectedLabelColor: Colors.grey,
            unselectedLabelStyle: GoogleFonts.rubik(
                fontSize: 18.48847770690918,
                letterSpacing: 0,
                fontWeight: FontWeight.w400,
                height: 1.8888889199201293),
            labelStyle: GoogleFonts.rubik(
                fontSize: 18.48847770690918,
                letterSpacing: 0,
                fontWeight: FontWeight.w600,
                height: 1.8888889199201293),
            labelColor: Colors.black,
            tabs: widget.listTags!.map((e) {
              return Tab(
                child: Text(
                  e,
                ),
              );
            }).toList(),
          ),
          Expanded(
            child: TabBarView(
              children: widget.listViews!,
            ),
          )
        ],
      ),
    ));
  }
}
