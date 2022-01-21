import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meshapp/Screens/ArtistsProfile/artist_profile_screen.dart';
import 'package:meshapp/Screens/Win/Controller/artist_controller.dart';
import 'package:meshapp/Screens/Win/Model/artist_model.dart';
import 'package:meshapp/UIController/text_styles.dart';
import 'package:meshapp/Widgets/custom_button.dart';

class RequestAdaptor extends StatefulWidget {
  ArtistModel? model;
  RequestAdaptor({Key? key, this.model}) : super(key: key);

  @override
  _RequestAdaptorState createState() => _RequestAdaptorState();
}

class _RequestAdaptorState extends State<RequestAdaptor> {
  @override
  Widget build(BuildContext context) {
    Get.put(ArtistController());
    return Builder(builder: (context) {
      return Container(
        child: Column(
          children: [
            ListTile(
              onTap: () {
                Get.to(ArtistProfileScreen(
                  false,
                  model: widget.model,
                ));
              },
              leading: Hero(
                tag: "artist" + widget.model!.name,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(widget.model!.image),
                  radius: 30,
                ),
              ),
              title: Text(widget.model!.name,
                  style: textStyleRubicRegular(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 14)),
              subtitle: Text(widget.model!.designation,
                  style: textStyleRubicRegular(
                      color: Colors.grey,
                      fontWeight: FontWeight.normal,
                      fontSize: 12)),
              trailing: CustomButton(
                () {
                  Get.put(ArtistController()).acceptFollowRequest(widget.model);
                },
                width: 80,
                height: 35.0,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(
                      "images/addfollow.png",
                      width: 20,
                      height: 20,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Accept",
                      style: textStyleRubicRegular(color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 100,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.model!.listPostImages!.length,
                  itemBuilder: (context, indexx) {
                    return Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    widget.model!.listPostImages![indexx]))),
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              color: Colors.black,
            )
          ],
        ),
      );
    });
  }
}
