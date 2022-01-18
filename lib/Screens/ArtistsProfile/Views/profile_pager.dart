import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meshapp/Screens/ArtistsProfile/Views/about_page.dart';
import 'package:meshapp/Screens/ArtistsProfile/Views/experience_page.dart';
import 'package:meshapp/Screens/ArtistsProfile/Views/portfolio_page.dart';
import 'package:meshapp/Screens/ArtistsProfile/Views/training_page.dart';
import 'package:meshapp/Screens/Win/Model/artist_model.dart';
import 'package:meshapp/UIController/app_theme.dart';
import 'package:meshapp/UIController/text_styles.dart';

class ProfileViewPager extends StatefulWidget {
  ArtistModel? model;
  ProfileViewPager({Key? key, this.model}) : super(key: key);

  @override
  _ProfileViewPagerState createState() => _ProfileViewPagerState();
}

class _ProfileViewPagerState extends State<ProfileViewPager> {
  @override
  Widget build(BuildContext context) {
    List<String> listTags = ["ABOUT", "EXPERIENCE", "TRAINING", "PORTFOLIO"];
    return Expanded(
      child: Container(
          child: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
            backgroundColor: Colors.white,
            flexibleSpace: Column(
              mainAxisAlignment: MainAxisAlignment.end,
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
                  tabs: listTags.map((e) {
                    return Tab(
                      child: Text(
                        e,
                      ),
                    );
                  }).toList(),
                )
              ],
            ),
          ),
          body: TabBarView(
            children: [
              AboutPage(listSkills: widget.model!.skills),
              ExperiencePage(listSkills: widget.model!.experiences!),
              TrainingPage(listSkills: widget.model!.trainingTags!),
              PortfolioPage(
                model: widget.model,
              )
            ],
          ),
        ),
      )),
    );
  }
}
