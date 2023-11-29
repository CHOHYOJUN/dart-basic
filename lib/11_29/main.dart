
import 'AbstractStudy.dart';
import 'MixinStudy.dart';


class Car{
  int _wheels = 4;


  int get wheels => _wheels;

  // int get wheels{
  //   return _wheels;
  // }


  set wheels(int wheel){
    _wheels = wheel;
  }

  // void setWheels(int wheel) {
  //   _wheels = wheel;
  // }

}

void main() {

  // runAbstract();

  runMixin();

}


void runAbstract(){
  Mark50 mark50 = Mark50(name: 'Mark50', suitColor: 'Red', damage: 1000, powerLevel: 30);
  mark50.fly();
  mark50.shootLasers();
  mark50.withstandDamage();
  mark50.sultColor();
}


void runMixin(){
  var bird = Bird('Bird'); // "Bird"라는 이름을 가진 Bird 객체 생성
  bird.fly(); // "I am flying!"을 출력합니다.
}