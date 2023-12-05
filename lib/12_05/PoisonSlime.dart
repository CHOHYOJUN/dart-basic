import 'package:untitled/12_05/Slime.dart';

import 'Hero.dart';

class PoisonSlime extends Slime{

  int poisonAttackCount = 5;

  PoisonSlime(super.suffix);



  @override
  void attack(Hero hero) {
    hero.infoHp();

    super.attack(hero);
    hero.infoHp();


    if(poisonAttackCount > 0) {
      int poisonDmage = (hero.hp > 0) ? (hero.hp ~/ 5) : 0;
      hero.hp -= poisonDmage;
      poisonAttackCount--;

      print('추가로, 독포자를 살포했다!');
      print('$poisonDmage 포인트 데미지');
      hero.infoHp();
    }
  }

}