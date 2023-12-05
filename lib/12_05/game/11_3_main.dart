import 'Hero.dart';
import 'PoisonSlime.dart';


/// 연습문제 11-3 - 상속 - 독 슬라임
void main() {
  print(Hero.money);

  final hero = Hero(name: '용사', hp: 100);
  hero.name = 'aa';
  print(hero.hp);
  hero.hp = 100;

  Hero.moneyRandom();

  print('');

  PoisonSlime poisonSlime = PoisonSlime('A');

  poisonSlime.attack(hero);




}