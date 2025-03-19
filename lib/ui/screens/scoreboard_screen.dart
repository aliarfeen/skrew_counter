import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skrew_counter/data/consts/constants.dart';
import 'package:skrew_counter/providers/players_provider.dart';
import 'package:skrew_counter/ui/screens/set_players_number.dart';
import 'package:skrew_counter/ui/widgets/app_text.dart';
import 'package:skrew_counter/ui/widgets/rank_container.dart';

class ScrewCounterScreen extends ConsumerStatefulWidget {
  final int number;
  ScrewCounterScreen({
    required this.number,
  });

  @override
  ConsumerState<ScrewCounterScreen> createState() => _ScrewCounterScreenState();
}

class _ScrewCounterScreenState extends ConsumerState<ScrewCounterScreen> {
  late List<Map<String, Object>> playerData;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  int currentRound = 1;

  @override
  Widget build(BuildContext context) {
    playerData = ref.watch(playersProvider).map((player) {
      return {
        'name': player.name,
        'score': 0,
        'rank': 0,
      };
    }).toList();
    return Scaffold(
      key: scaffoldKey,
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
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
                        builder: (context) => PlayersNumber(),
                      ),
                    );
                  },
                  icon: const Icon(
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
                  onPressed: () => {},
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
                        scoreController: TextEditingController(),
                        playerName: playerData[index]['name'] as String,
                        rank: playerData[index]['rank'] as int,
                        score: playerData[index]['score'] as int,
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
                onPressed: () => {},
                height: 60,
                minWidth: MediaQuery.of(context).size.width,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
                child: AppText(
                  context: context,
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
