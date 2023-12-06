
import '../../../interface/army_unionable.dart';
import '../../interface/protoss.dart';

abstract class ProtossUnit implements Protoss, ArmyUnionable {
  int hp;
  int shield;

  ProtossUnit({
    required this.hp,
    required this.shield,
  });
}
