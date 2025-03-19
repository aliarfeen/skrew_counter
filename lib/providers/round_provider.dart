import 'package:riverpod/riverpod.dart';

class RoundNotifier extends StateNotifier<int> {
  RoundNotifier() : super(1);

  void nextRound() {
    state++;
  }

  void resetRounds() {
    state = 1;
  }
  //TO DO add the fourth(silent round) and fifth round(doublicate round)
}

final roundProvider = StateNotifierProvider<RoundNotifier, int>((ref) {
  return RoundNotifier();
});
