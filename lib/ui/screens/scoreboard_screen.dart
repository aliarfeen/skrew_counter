import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skrew_counter/data/consts/constants.dart';
import 'package:skrew_counter/providers/players_provider.dart';
import 'package:skrew_counter/ui/screens/end_game_screen.dart';
import 'package:skrew_counter/ui/screens/set_players_number.dart';
import 'package:skrew_counter/ui/widgets/app_text.dart';
import 'package:skrew_counter/ui/widgets/rank_container.dart';

class ScrewCounterScreen extends ConsumerStatefulWidget {
  final int number;

  const ScrewCounterScreen({
    super.key,
    required this.number,
  });

  @override
  ConsumerState<ScrewCounterScreen> createState() => _ScrewCounterScreenState();
}

class _ScrewCounterScreenState extends ConsumerState<ScrewCounterScreen> {
  late PlayersNotifier playersNotifier;
  late List<TextEditingController> _scoreControllers;
  late List<String?> _errorMessages;

  late List<Map<String, Object>> playerData;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  int currentRound = 1;

  @override
  void initState() {
    super.initState();
    playersNotifier = ref.read(playersProvider.notifier);
    _scoreControllers =
        List.generate(widget.number, (_) => TextEditingController());
    _errorMessages = List.generate(widget.number, (_) => null);
  }

  void _addScores() {
    bool isValid = true;
    Map<int, int> playerScores = {};
    for (int i = 0; i < playerData.length; i++) {
      if (_scoreControllers[i].text.isEmpty) {
        _errorMessages[i] = "جاب كام؟";
        isValid = false;
      } else if (!RegExp(r'^[0-9]+$').hasMatch(_scoreControllers[i].text)) {
        _errorMessages[i] = 'ارقام فقط';
        isValid = false;
      } else {
        _errorMessages[i] = null;
        int playerId = playerData[i]['id'] as int;
        int score = int.tryParse(_scoreControllers[i].text) ?? 0;
        playerScores[playerId] = score;
      }
    }

    setState(() {});

    if (isValid) {
      ref.read(playersProvider.notifier).updatePlayersScore(playerScores);
      ref.read(playersProvider.notifier).updateRanks();

      // Clear the text fields after updating the scores
      _scoreControllers.forEach((element) {
        element.text = "";
      });

      if (currentRound >= 5) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const EndGameScreen()),
        );
      } else {
        currentRound++;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    playerData = ref.watch(playersProvider).map((player) {
      return {
        'name': player.name,
        'score': player.score,
        'rank': player.rank,
        'id': player.id, // Add player id
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
                        builder: (context) => const PlayersNumber(),
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
                SizedBox(
                  width: MediaQuery.of(context).size.width * .15,
                )
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
                        scoreController: _scoreControllers[index],
                        playerName: playerData[index]['name'] as String,
                        rank: playerData[index]['rank'] as int,
                        score: playerData[index]['score'] as int,
                      ),
                      if (_errorMessages[index] != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            _errorMessages[index]!,
                            style: TextStyle(color: Colors.red),
                          ),
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
                onPressed: _addScores,
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
