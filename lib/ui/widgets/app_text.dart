// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String text;
  final double? fontsize;
  final Color? color;
  final BuildContext context;

  const AppText({
    Key? key,
    required this.text,
    this.color = const Color(0xffD99441),
    this.fontsize = 80,
    required this.context,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        overflow: TextOverflow.ellipsis,
        fontSize: fontsize,
        fontWeight: FontWeight.bold,
        fontFamily: 'LBC',
        color: color,
      ),
    );
  }
}
