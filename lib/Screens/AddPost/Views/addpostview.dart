import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:meshapp/UIController/app_theme.dart';
import 'package:meshapp/UIController/text_styles.dart';
import 'package:meshapp/Widgets/VideoPlayer/multi_manager/flick_multi_manager.dart';
import 'package:meshapp/Widgets/VideoPlayer/multi_manager/flick_multi_player.dart';
import 'package:meshapp/Widgets/custom_button.dart';
import 'package:meshapp/core/helpers/ui_helpers.dart';

class AddPostView extends StatefulWidget {
  bool isPost;
  AddPostView(this.isPost);

  @override
  _AddPostViewState createState() => _AddPostViewState();
}

class _AddPostViewState extends State<AddPostView> {
  var textStory = '';
  List<String> listTags = [];
  FilePickerResult? result;
  TextEditingController tagController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = UIHelper.getScreenSize(context);
    return SingleChildScrollView(
      child: Container(
        width: size.width,
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UIHelper.verticalSpaceMd,
            textStory != '' || result != null
                ? Center(
                    child: Container(
                      width: 120,
                      child: CustomButton(
                        () {},
                        text: "Post",
                        height: 40.0,
                      ),
                    ),
                  )
                : Container(),
            storyTextField(),
            UIHelper.verticalSpaceL,
            Visibility(
                visible: widget.isPost,
                child:
                    result == null ? dottedBorderContainer() : getPotsWidget()),
            //  dottedBorderContainer(),

            // result == null ? Container() : getPotsWidget(),
            UIHelper.verticalSpaceL,
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              elevation: 10,
              child: TextField(
                controller: tagController,
                textAlign: TextAlign.end,
                decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(15),
                      child: InkWell(
                          onTap: () {
                            setState(() {
                              listTags.add(tagController.text);
                              tagController.text = "";
                            });
                          },
                          child: Text("Add Tag")),
                    ),
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    hintText: "Type Tag To Enter",
                    hintStyle: textStyleRubicRegular(
                        fontSize: 14.0, color: Colors.grey)),
              ),
            ),
            UIHelper.verticalSpaceMd,
            Wrap(
              alignment: WrapAlignment.start,
              children: [
                for (var e in listTags)
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    color: AppTheme.primaryColor,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(e, style: textStyleRubicRegular(fontSize: 13)),
                          SizedBox(
                            width: 5,
                          ),
                          InkWell(
                              onTap: () {
                                setState(() {
                                  listTags
                                      .removeWhere((element) => element == e);
                                });
                              },
                              child: Icon(Icons.close, color: Colors.white))
                        ],
                      ),
                    ),
                  )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget getPotsWidget() {
    if (result!.files.single.extension == "jpg") {
      return Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Stack(
          children: [
            Container(
              height: 300,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: FileImage(File(result!.files.single.path!)))),
            ),
            closeButton()
          ],
        ),
      );
    } else if (result!.files.single.extension == "mp4") {
      FlickMultiManager flickMultiManager = new FlickMultiManager();
      return Container(
          height: 300,
          margin: EdgeInsets.all(0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Stack(
              children: [
                FlickMultiPlayer(
                  url: result!.files.single.path!,
                  flickMultiManager: flickMultiManager,
                  image: "images/logo.png",
                  typeVideoType: "mp4",
                ),
                closeButton()
              ],
            ),
          ));
    } else {
      return Container();
    }
  }

  Positioned closeButton() {
    return Positioned(
        top: 10,
        right: 10,
        child: Container(
          width: 30,
          height: 30,
          child: FloatingActionButton(
              elevation: 10,
              child: Icon(Icons.close, color: AppTheme.primaryColor),
              backgroundColor: Colors.white,
              onPressed: () {
                setState(() {
                  result = null;
                });
              }),
        ));
  }

  DottedBorder dottedBorderContainer() {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: Radius.circular(15),
      color: AppTheme.primaryColor,
      strokeWidth: 2,
      dashPattern: [5, 4],
      child: InkWell(
        onTap: () async {
          result = await FilePicker.platform.pickFiles();

          setState(() {
            if (result != null) {
              File file = File(result!.files.single.path!);
              print(result!.files.single.extension);
            } else {
              // User canceled the picker
            }
          });
        },
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          child: Container(
            height: 60,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Select Media File",
                      style: textStyleRubicRegular(
                          fontSize: 16, color: Colors.grey)),
                  Image.asset(
                    "images/upload.png",
                    width: 30,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  TextField storyTextField() {
    return TextField(
      style: textStyleRubicRegular(fontSize: 18, color: Colors.black),
      keyboardType: TextInputType.multiline,
      maxLines: null,
      onChanged: (text) {
        setState(() {
          textStory = text;
        });
      },
      decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Image.asset(
              "images/profileprefix.png",
              width: 35,
              height: 35,
              fit: BoxFit.cover,
            ),
          ),
          hintText: "What’s happening?",
          hintStyle: textStyleRubicRegular(fontSize: 18, color: Colors.grey)),
    );
  }
}
