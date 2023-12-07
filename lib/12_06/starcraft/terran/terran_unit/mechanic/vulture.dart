import '../../../interface/scv_repairable.dart';
import 'interface/mechanic.dart';

class Vulture extends Mechanic implements SCVRepairable {
  @override
  String name;

  Vulture({
    required this.name,
    required super.hp,
  });
}