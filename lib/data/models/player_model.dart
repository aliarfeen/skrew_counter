class Player {
  final String name;
  final int id;
  final int rank;

  Player({required this.name, required this.id, required this.rank});

  @override
  String toString() {
    return 'Player{id: $id, name: $name}';
  }
}
