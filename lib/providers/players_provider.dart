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

  String returnWinner() {
    final winner = state.firstWhere((player) => player.rank == 1,
        orElse: () => Player(name: 'No winner', id: 0, rank: 0, score: 0));
    return winner?.name ?? 'No winner';
  }

  void updatePlayersScore(Map<int, int> scores) {
    // scores is a map with player id as key and score as value
    state = state.map((player) {
      if (scores.containsKey(player.id)) {
        return player.copyWith(score: player.score + scores[player.id]!);
      }
      return player;
    }).toList();
  }

  void updatePlayerScore(int playerId, int score) {
    state = state.map((player) {
      if (player.id == playerId) {
        return player.copyWith(score: player.score + score);
      }
      return player;
    }).toList();
  }

  // Other methods

  void resetScores() {
    state = state.map((player) => player.copyWith(score: 0)).toList();
  }

  void updateRanks() {
    state.sort((a, b) => a.score.compareTo(b.score));

    state = state.asMap().entries.map((entry) {
      return entry.value.copyWith(rank: entry.key + 1);
    }).toList();
  }
}

final playersProvider =
    StateNotifierProvider<PlayersNotifier, List<Player>>((ref) {
  return PlayersNotifier();
});
