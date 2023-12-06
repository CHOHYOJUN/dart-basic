import 'Hero.dart';
import 'Slime.dart';

class PoisonSlime extends Slime {
  int poisonAttackCount = 5;

  PoisonSlime(super.suffix);

  @override
  void attack(Hero hero) {
    hero.infoHp();

    super.attack(hero);
    hero.infoHp();

    if (poisonAttackCount > 0) {
      int poisonDamage = (hero.hp > 0) ? (hero.hp ~/ 5) : 0;

      print('추가로, 독포자를 살포했다!');
      print('$poisonDamage 포인트 데미지');

      poisonAttackCount--;
      hero.hp -= poisonDamage;

      hero.infoHp();
    }

    hero.hp < 0 ? hero.hp = 0 : print('${hero.name}가 전사 했다. [GameOver]');
  }
}
