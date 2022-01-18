import 'package:flutter/material.dart';
import 'package:meshapp/Home/Views/home_posts.dart';
import 'package:meshapp/Home/Views/home_question_posts.dart';
import 'package:meshapp/UIController/app_theme.dart';
import 'package:meshapp/UIController/text_styles.dart';

class PostTabbarWidget extends StatefulWidget {
  List<Widget>? listViews;
  List<String>? listTags;
  PostTabbarWidget({Key? key, this.listTags, this.listViews}) : super(key: key);

  @override
  _PostTabbarWidgetState createState() => _PostTabbarWidgetState();
}

class _PostTabbarWidgetState extends State<PostTabbarWidget>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController =
        TabController(length: widget.listTags!.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // give the tab bar a height [can change hheight to preferred height]
            Container(
              height: 50,
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Color.fromRGBO(160, 155, 155, 0.25000000298023224),
                borderRadius: BorderRadius.circular(
                  25.0,
                ),
              ),
              child: TabBar(
                controller: _tabController,
                // give the indicator a decoration (color and border radius)
                indicator: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.30000000149011612),
                        offset: Offset(0, 10),
                        blurRadius: 10)
                  ],
                  borderRadius: BorderRadius.circular(
                    25.0,
                  ),
                  color: Colors.white,
                ),
                labelColor: AppTheme.primaryColor,
                labelStyle: textStylemanropeRegular(fontSize: 18.0),
                unselectedLabelColor: Colors.grey,
                unselectedLabelStyle: textStylemanropeRegular(fontSize: 18.0),
                tabs: [
                  // first tab [you can add an icon using the icon property]
                  for (var tag in widget.listTags!)
                    Tab(
                      text: tag,
                    ),

                  // second tab [you can add an icon using the icon property]
                ],
              ),
            ),
            // tab bar view here
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: widget.listViews!,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
