
import '../../../interface/army_unionable.dart';
import '../../interface/zerg.dart';

abstract class ZergUnit implements Zerg, ArmyUnionable {
  int hp;

  ZergUnit({required this.hp});
}