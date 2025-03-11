import 'dart:math';
import 'package:numberpicker/numberpicker.dart';
import 'package:flutter/material.dart';
import 'package:skrew_counter/data/consts/constants.dart';
import 'package:skrew_counter/ui/screens/add_players_data.dart';
import 'package:skrew_counter/ui/widgets/app_main_button.dart';
import 'package:skrew_counter/ui/widgets/app_text.dart';
import 'package:skrew_counter/ui/widgets/num_card_selector.dart';

class PlayersNumber extends StatefulWidget {
  @override
  State<PlayersNumber> createState() => _PlayersNumberState();
}

class _PlayersNumberState extends State<PlayersNumber> {
  int _currentHorizontalIntValue = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width * 1,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            tileMode: TileMode.mirror,
            colors: [
              Color(0xFF2F2D3A),
              Color(0xFF463259),
              Color(0xFF592735),
              Color(0xFF592735),
              Color(0xFF463259),
              Color(0xFF2F2D3A),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              height: 80,
            ),
            AppText(
              text: 'عدد اللاعبين ؟',
              fontsize: 40,
              color: Color(0xffD99441),
            ),
            NumberPicker(
              value: _currentHorizontalIntValue,
              minValue: 2,
              maxValue: 5,
              step: 1,
              itemHeight: 300,
              axis: Axis.horizontal,
              selectedTextStyle: TextStyle(
                  // styling the text
                  fontSize: 70, //the size of the text
                  fontWeight: FontWeight.bold,
                  fontFamily: 'LBC', // font weight
                  color: AppColors.appSecColor),
              textStyle: TextStyle(
                  // styling the text
                  fontSize: 40, //the size of the text
                  fontWeight: FontWeight.bold,
                  fontFamily: 'LBC', // font weight
                  color: const Color.fromARGB(130, 217, 149, 65)),
              onChanged: (value) =>
                  setState(() => _currentHorizontalIntValue = value),
            ),
            SizedBox(
              height: 40,
            ),
            Builder(builder: (context) {
              return AppMainButton(
                text: 'التالى',
                screen: AddPlayers(
                  number: _currentHorizontalIntValue,
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
