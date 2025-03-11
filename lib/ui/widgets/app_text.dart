// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  String text;
  double? fontsize = 80;
  Color? color = Color(0xffD99441);
  AppText({Key? key, required this.text, this.color, this.fontsize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text, // the Text
      style: TextStyle(
          // styling the text
          fontSize: fontsize, //the size of the text
          fontWeight: FontWeight.bold,
          fontFamily: 'LBC', // font weight
          color: color), //text color
    );
  }
}
