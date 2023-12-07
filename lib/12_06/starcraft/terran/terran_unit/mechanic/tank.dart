import '../../../interface/scv_repairable.dart';
import 'interface/mechanic.dart';

class Tank extends Mechanic implements SCVRepairable {
  Tank({
    required this.name,
    required super.hp,
  });

  @override
  String name;
}