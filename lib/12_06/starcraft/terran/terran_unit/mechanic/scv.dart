import '../../../interface/medic_curable.dart';
import '../../../interface/scv_repairable.dart';
import 'interface/mechanic.dart';

class SCV extends Mechanic implements SCVRepairable, MedicCurable {

  @override
  String name;

  SCV({
    required this.name,
    required super.hp,
  });

  void repair(SCVRepairable unit) {
    unit.hp += 10;
  }

  double earn() {
    // todo
    return 0;
  }

}