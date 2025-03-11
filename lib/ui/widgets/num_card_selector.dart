// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:skrew_counter/data/consts/constants.dart';
import 'package:skrew_counter/ui/widgets/app_text.dart';

class ShadowContainer extends StatefulWidget {
  int number = 0;
  ShadowContainer({
    Key? key,
    required this.number,
  }) : super(key: key);

  @override
  _ShadowContainerState createState() => _ShadowContainerState();
}

class _ShadowContainerState extends State<ShadowContainer> {
  double _elevation = 5.0;

  void _increaseShadow() {
    setState(() {
      _elevation = _elevation == 1.0 ? 15.0 : 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _increaseShadow,
      child: Container(
          width: 70.0,
          height: 70.0,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.appMainColor,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color: Color(0xffD99441),
                spreadRadius: 1,
                blurRadius: _elevation,
                offset: Offset(0, 0), // changes position of shadow
              ),
            ],
          ),
          child: AppText(
            text: widget.number.toString(),
            fontsize: 60,
            color: Color(0xffD99441),
          )),
    );
  }
}
