import 'package:flutter/material.dart';
import 'package:skrew_counter/data/consts/constants.dart';
import 'package:skrew_counter/ui/widgets/app_text.dart';

class AppMainButton extends StatelessWidget {
  final void Function(BuildContext)? onPressWithContext;
  final String text;
  final double marginWidth;
  final Widget screen;
  const AppMainButton(
      {super.key,
      this.onPressWithContext,
      this.marginWidth = 80,
      required this.text,
      required this.screen});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: marginWidth),
      child: Material(
        elevation: 3,
        borderOnForeground: false,
        shadowColor: Color(0xffD99441),
        borderRadius: BorderRadius.circular(32),
        child: MaterialButton(
            color: Color(0xffD99441),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => screen),
              );
            },
            height: 60,
            minWidth: MediaQuery.of(context).size.width,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
            child: AppText(
              context: context,
              text: text,
              color: AppColors.appMainColor,
              fontsize: 40,
            )),
      ),
    );
  }
}
