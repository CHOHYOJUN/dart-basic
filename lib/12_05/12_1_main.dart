
// 연습문제 12-1
import 'package:untitled/12_05/Book.dart';
import 'package:untitled/12_05/Computer.dart';

void main(){

   var book1 = Book(name: '플러터', price: 3000, color: 'red', isbn: 'A123');
   var book2 = Book(name: '코틀린', price: 2000, color: 'blue', isbn: 'B123');
   var computer1 = Computer(name: '업무용1', price: 100000, color: 'black', makerName: '삼보');
   var computer2 = Computer(name: '업무용2', price: 200000, color: 'white', makerName: '레노버');

   book1.saveAsset();
   book1.allAssetList();

   book2.saveAsset();
   book2.allAssetList();

   // ----

   computer1.saveAsset();
   computer1.allAssetList();

   computer2.saveAsset();
   computer2.allAssetList();


}