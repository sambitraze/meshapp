import 'package:flutter/material.dart';
import 'package:meshapp/UIController/app_theme.dart';
import 'package:meshapp/UIController/text_styles.dart';

class UserProfileTile extends StatelessWidget {
  const UserProfileTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: const CircleAvatar(
        radius: 25,
        backgroundColor: Color(0xff8959FC),
        child: CircleAvatar(
          radius: 24,
          backgroundColor: Colors.white,
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://cdn.pixabay.com/photo/2015/01/06/16/14/woman-590490__340.jpg'),
            radius: 23,
          ),
        ),
      ),
      title: Text("Bishen Ponnanna",
          style: textStyleRubicRegular(
              fontSize: 15.0,
              fontWeight: FontWeight.w500,
              color: Colors.black)),
      subtitle: Text("30 mins ago",
          style: textStyleRubicRegular(
              fontSize: 12.0,
              fontWeight: FontWeight.w400,
              color: Colors.black)),
      trailing: PopupMenuButton<int>(
        color: Colors.white,
        itemBuilder: (context) => [
          PopupMenuItem<int>(
              value: 0,
              child: Row(
                children: [
                  Text(
                    "Delete",
                    style: textStylePoppinsRegular(color: Colors.red),
                  ),
                  Spacer(),
                  Icon(Icons.delete, color: Colors.red)
                ],
              )),
          PopupMenuItem<int>(
              value: 1,
              child: Row(
                children: [
                  Text("Edit",
                      style: textStylePoppinsRegular(color: Colors.black)),
                  Spacer(),
                  Icon(Icons.edit, color: Colors.black)
                ],
              )),
        ],
        onSelected: (item) {},
      ),
    );
  }
}
