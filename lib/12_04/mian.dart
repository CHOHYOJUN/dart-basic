import 'package:untitled/12_04/Wand.dart';
import 'package:untitled/12_04/Wizard.dart';


/// Wizard && Wand 캡슐화 예외처리 예제
void main() {

   // Wand wand = Wand(name:null, power: 0.1);

   Wand wand = Wand(name:'작대리', power: 0.5);

   // wand.name = '면봉';

   // wand.name = '작대기';


  Wizard wizard = Wizard(name: null, hp: 100, mp: 10, wand: wand);

  // wizard.name = '호날두';
  // wizard.name= '메시';

  // print(wizard.wand);
  // wizard.wand = null;







}