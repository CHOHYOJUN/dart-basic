
import '../../interface/medic_curable.dart';
import 'interface/protoss_unit.dart';

class Zealot extends ProtossUnit implements MedicCurable {
  @override
  String name;

  Zealot({
    required this.name,
    required super.hp,
    required super.shield,
  });


}
