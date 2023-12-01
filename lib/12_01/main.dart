

import 'Cleric.dart';

void main() {
  // A) Cleric(“아서스", hp: 40, mp: 5)
  // B) Cleric(“아서스", hp: 35) mp <- maxMp
  // C) Cleric(“아서스") hp <- maxHp , mp <- maxMp
  // D) Cleric() - 에러발생;
  // E) 생성자는 가능한 한 중복되는 코드가 없도록 작성한다 ?

  // A)
  // Cleric cl = Cleric('아서스', hp: 40, mp: 5);

  // B)
  // Cleric cl = Cleric('아서스', hp: 40);

  // C)
  Cleric('아서스');

  // D)
  // Cleric(); -> 에러발생

}








