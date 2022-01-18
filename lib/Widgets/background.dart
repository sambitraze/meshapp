import 'package:flutter/material.dart';

class BackgroundWidget extends StatelessWidget {
  Widget? child;
  BackgroundWidget({this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [Image.asset("images/background.png"), child!],
      ),
    );
  }
}
