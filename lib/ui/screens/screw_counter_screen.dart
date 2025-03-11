import 'dart:math';

import 'package:flutter/material.dart';
import 'package:skrew_counter/data/consts/constants.dart';
import 'package:skrew_counter/ui/screens/add_players_data.dart';
import 'package:skrew_counter/ui/widgets/app_main_button.dart';
import 'package:skrew_counter/ui/widgets/app_text.dart';
import 'package:skrew_counter/ui/widgets/app_text_area.dart';
import 'package:skrew_counter/ui/widgets/rank_container.dart';

class ScrewCounterScreen extends StatefulWidget {
  final int number;
  final List<String> data;
  ScrewCounterScreen({required this.number, required this.data});

  @override
  State<ScrewCounterScreen> createState() => _ScrewCounterScreenState();
}

class _ScrewCounterScreenState extends State<ScrewCounterScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  List<Map<String, dynamic>> playerData = [];
  int currentRound = 1;

  @override
  void initState() {
    super.initState();
    // Initialize playerData with widget.data
    playerData = widget.data
        .map((name) => {'name': name, 'rank': 0, 'score': 0})
        .toList();
    updateRanks();
  }

  void updatePlayerRank(int index, int points) {
    setState(() {
      playerData[index]['score'] += points;
      updateRanks();
    });
  }

  void showHelpDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Help'),
          content: Text('This is the help information.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void showRoundResults() {
    scaffoldKey.currentState!.showBottomSheet(
      (context) {
        List<TextEditingController> controllers = playerData
            .map((player) =>
                TextEditingController(text: player['score'].toString()))
            .toList();

        return Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.8,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(22.0),
              topRight: Radius.circular(22.0),
            ),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF592735),
                Color(0xFF2F2D3A),
                Color(0xFF463259),
                Color(0xFF592735),
                Color(0xFF592735),
                Color(0xFF463259),
                Color(0xFF2F2D3A),
                Color(0xFF592735),
              ],
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(
                      Icons.close_rounded,
                      color: AppColors.appSecColor,
                      size: 40,
                    ),
                  ),
                  AppText(
                    text: 'نتائج الجولة',
                    color: AppColors.appSecColor,
                    fontsize: 25,
                  )
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: playerData.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: AppText(
                              text: playerData[index]['name'],
                              color: AppColors.appMainColor,
                              fontsize: 20,
                            ),
                          ),
                          SizedBox(
                            width: 100,
                            child: TextField(
                              controller: controllers[index],
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Score',
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    for (int i = 0; i < playerData.length; i++) {
                      playerData[i]['score'] += int.parse(controllers[i].text);
                    }
                    updateRanks();
                  });
                  Navigator.of(context).pop();
                  nextRound(); // Move to the next round after submitting scores
                },
                child: Text('Submit Scores and Next Round'),
              ),
            ],
          ),
        );
      },
    );
  }

  void nextRound() {
    if (currentRound < 5) {
      setState(() {
        currentRound++;
      });
    }
  }

  void updateRanks() {
    playerData.sort((a, b) => a['score'].compareTo(b['score']));
    for (int i = 0; i < playerData.length; i++) {
      playerData[i]['rank'] = i + 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Container(
        width: MediaQuery.of(context).size.width,
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
                        builder: (context) => AddPlayers(number: 3),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_rounded,
                    size: 30,
                  ),
                ),
                Image.asset(
                  'assets/images/logo.png',
                  height: 80,
                ),
                IconButton(
                  color: AppColors.appSecColor,
                  onPressed: showHelpDialog,
                  icon: Icon(
                    Icons.help,
                    size: 30,
                  ),
                ),
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.6,
              child: ListView.builder(
                itemCount: playerData.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      RankContainer(
                        playerName: playerData[index]['name'],
                        rank: playerData[index]['rank'],
                        score: playerData[index]['score'],
                      ),
                      if (currentRound == 3 || currentRound == 4)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () => updatePlayerRank(index, 10),
                              child: Text('+10'),
                            ),
                            SizedBox(width: 10),
                            ElevatedButton(
                              onPressed: () => updatePlayerRank(index, -10),
                              child: Text('-10'),
                            ),
                          ],
                        ),
                    ],
                  );
                },
              ),
            ),
            Material(
              elevation: 3,
              borderOnForeground: false,
              shadowColor: Color(0xffD99441),
              borderRadius: BorderRadius.circular(32),
              child: MaterialButton(
                color: Color(0xffD99441),
                onPressed: showRoundResults,
                height: 60,
                minWidth: MediaQuery.of(context).size.width,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
                child: AppText(
                  text: currentRound < 5 ? 'الجولة الجاية' : 'انتهاء اللعبة',
                  color: AppColors.appMainColor,
                  fontsize: 40,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
