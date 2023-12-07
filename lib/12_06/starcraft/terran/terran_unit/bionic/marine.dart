import '../../../interface/medic_curable.dart';
import 'interface/bionic.dart';

class Marine extends Bionic implements MedicCurable {
  @override
  String name;

  Marine({
    required this.name,
    required super.hp,
  });
}