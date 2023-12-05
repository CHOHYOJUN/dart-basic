class Sword {
  String name;
  int damage;

  Sword({
    required this.name,
    required this.damage,
  });
}

void main() {
  final sword = Sword(
    name: '불의검',
    damage: 10,
  );
}