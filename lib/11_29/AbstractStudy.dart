
abstract class IronMan {
  late String name;
  late String suitColor;
  late int damage;

  IronMan();

  void fly();

  void shootLasers();

  void withstandDamage();
}

//@override 구문을 사용하여 abstract method 구현
class Mark50 extends IronMan {
  late int powerLevel;

  Mark50(
      {required String name, required String suitColor, required int damage, required this.powerLevel})
      : super() {
    this.name = name;
    this.suitColor = suitColor;
    this.damage = damage;
  }

  @override
  void fly() {
    print('$name 고도: $powerLevel ');
  }

  @override
  void shootLasers() {
    print('$name is shooting lasers!');
  }

  @override
  void withstandDamage() {
    print('$name 의 Damage: $damage ');
  }

  void sultColor(){
    print('$name 의 컬러: $suitColor');
  }

}