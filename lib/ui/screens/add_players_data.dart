// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';

import 'package:skrew_counter/data/consts/constants.dart';
import 'package:skrew_counter/ui/screens/add_players.dart';
import 'package:skrew_counter/ui/screens/screw_counter_screen.dart';
import 'package:skrew_counter/ui/widgets/app_main_button.dart';
import 'package:skrew_counter/ui/widgets/app_text.dart';
import 'package:skrew_counter/ui/widgets/app_text_area.dart';

class AddPlayers extends StatefulWidget {
  final int number;

  AddPlayers({
    Key? key,
    required this.number,
  }) : super(key: key);

  @override
  State<AddPlayers> createState() => _AddPlayersState();
}

class _AddPlayersState extends State<AddPlayers> {
  late List<TextEditingController> _controllers;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(widget.number, (_) => TextEditingController());
  }

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
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    color: AppColors.appSecColor,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PlayersNumber()));
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_rounded,
                      size: 30,
                    )),
                Image.asset(
                  'assets/images/logo.png',
                  height: 80,
                ),
                IconButton(
                    color: AppColors.appSecColor,
                    onPressed: () {},
                    icon: Icon(
                      Icons.help,
                      size: 30,
                    )),
              ],
            ),
            AppText(
              text: 'أدخل أسماء اللاعبين',
              fontsize: 30,
              color: Color(0xffD99441),
            ),
            SizedBox(
              height: 40,
            ),
            Column(children: [
              ..._controllers
                  .map((controller) => AppTextField(controller: controller))
                  .toList(),
            ]),
            // AppTextField(controller: controller),
            // AppTextField(controller: controller),
            // AppTextField(controller: controller),
            // AppTextField(controller: controller),
            // AppTextField(controller: controller),
            SizedBox(
              height: 40,
            ),
            // ElevatedButton(
            //   onPressed: () {
            //     List<String> data =
            //         _controllers.map((controller) => controller.text).toList();
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) =>
            //             ScrewCounterScreen(number: widget.number, data: data),
            //       ),
            //     );
            //   },
            //   child: Text('Submit'),
            // ),
            Material(
              elevation: 3,
              borderOnForeground: false,
              shadowColor: Color(0xffD99441),
              borderRadius: BorderRadius.circular(32),
              child: MaterialButton(
                  color: Color(0xffD99441),
                  onPressed: () {
                    List<String> data = _controllers
                        .map((controller) => controller.text)
                        .toList();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ScrewCounterScreen(
                            number: widget.number, data: data),
                      ),
                    );
                  },
                  height: 60,
                  minWidth: MediaQuery.of(context).size.width,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32)),
                  child: AppText(
                    text: 'يلا بينا',
                    color: AppColors.appMainColor,
                    fontsize: 40,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
