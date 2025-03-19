import 'package:riverpod/riverpod.dart';
import 'package:skrew_counter/data/models/player_model.dart';

class PlayersNotifier extends StateNotifier<List<Player>> {
  int numberOfPlayers = 0;
  PlayersNotifier() : super([]);

  void addPlayer(List<String> names) {
    state = [];
    if (names.isNotEmpty) {
      for (var name in names) {
        state = [
          ...state,
          Player(name: name, id: state.length + 1, rank: state.length + 1)
        ];
      }
    }
  }

  void resetPlayers(int index) {
    state = [];
  }

  void setNumberOfPlayers(int number) {
    numberOfPlayers = number;
  }
}

final playersProvider =
    StateNotifierProvider<PlayersNotifier, List<Player>>((ref) {
  return PlayersNotifier();
});
