import 'interface/protoss_unit.dart';
import '../../interface/scv_repairable.dart';

class Dragun extends ProtossUnit implements SCVRepairable {

  @override
  String name;

  Dragun({
    required this.name,
    required super.hp,
    required super.shield,
  });




}
