import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:flutter/material.dart';
import 'package:skrew_counter/data/consts/constants.dart';
import 'package:skrew_counter/providers/players_provider.dart';
import 'package:skrew_counter/ui/screens/add_players_name.dart';
import 'package:skrew_counter/ui/screens/scoreboard_screen.dart';
import 'package:skrew_counter/ui/screens/set_players_number.dart';
import 'package:skrew_counter/ui/widgets/app_main_button.dart';
import 'package:skrew_counter/ui/widgets/app_text.dart';

class EndGameScreen extends ConsumerStatefulWidget {
  const EndGameScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<EndGameScreen> createState() => _EndGameScreenState();
}

class _EndGameScreenState extends ConsumerState<EndGameScreen> {
  late String winnerName;

  @override
  void initState() {
    super.initState();
    winnerName = ref.read(playersProvider.notifier).returnWinner();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: MediaQuery.of(context).size.width * 1,
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
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
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    AppText(
                      text: 'الفائز هو',
                      context: context,
                      fontsize: 30,
                    ),
                    AppText(
                      fontsize: 40,
                      text: winnerName,
                      context: context,
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PlayersNumber(),
                            ),
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              color: AppColors.appSecColor,
                              borderRadius: BorderRadius.circular(16)),
                          height: MediaQuery.of(context).size.height * .16,
                          width: MediaQuery.of(context).size.height * .16,
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.fiber_new_rounded,
                                size: 60,
                                color: AppColors.appMainColor,
                              ),
                              Text('لعبة جديدة',
                                  style: TextStyle(
                                      color: AppColors.appMainColor,
                                      fontSize: 20))
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          ref.read(playersProvider.notifier).resetScores();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ScrewCounterScreen(
                                      number: ref
                                          .read(playersProvider.notifier)
                                          .numberOfPlayers)));
                        },
                        child: Container(
                          margin: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              color: AppColors.appSecColor,
                              borderRadius: BorderRadius.circular(16)),
                          height: MediaQuery.of(context).size.height * .16,
                          width: MediaQuery.of(context).size.height * .16,
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.replay_circle_filled_outlined,
                                size: 60,
                                color: AppColors.appMainColor,
                              ),
                              Text('إعادة اللعبة',
                                  style: TextStyle(
                                      color: AppColors.appMainColor,
                                      fontSize: 20))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )),
    );
  }
}
