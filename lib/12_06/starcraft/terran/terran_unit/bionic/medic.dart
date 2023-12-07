import '../../../interface/medic_curable.dart';
import 'interface/bionic.dart';

class Medic extends Bionic implements MedicCurable {
  @override
  String name;

  Medic({
    required this.name,
    required super.hp,
  });

  void heal(MedicCurable unit) {
    unit.hp += 10;
  }


}