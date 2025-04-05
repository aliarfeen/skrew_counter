class Player {
  final String name;
  final int id;
  int score;
  final int rank;

  Player({
    required this.name,
    required this.id,
    this.score = 0, // Default score to 0
    required this.rank,
  });

  Player copyWith({
    String? name,
    int? id,
    int? score,
    int? rank,
  }) {
    return Player(
      name: name ?? this.name,
      id: id ?? this.id,
      score: score ?? this.score,
      rank: rank ?? this.rank,
    );
  }
}
