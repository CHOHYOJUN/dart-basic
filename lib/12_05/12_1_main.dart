
// 연습문제 12-1
import 'package:untitled/12_05/book.dart';
import 'package:untitled/12_05/computer.dart';


/// 연습문제 12-1 / 12-2
void main(){

   Book book1 = Book(name: '플러터', price: 3000, color: 'red', isbn: 'A123', weight: 3);
   Book book2 = Book(name: '코틀린', price: 2000, color: 'blue', isbn: 'B123', weight: 5.5);
   Computer computer1 = Computer(name: '업무용1', price: 100000, color: 'black', makerName: '삼보', weight: 15.4);
   Computer computer2 = Computer(name: '업무용2', price: 200000, color: 'white', makerName: '레노버', weight: 23.1);

   // 자산의 상각비용을 계산하는 기능
   book1.calculateAmortization();
   computer2.calculateAmortization();

}

// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ  [ 각 클래스 파일 내용 모음 -> 추후 [상속 , 인터페이스] 관계 참고 용 ] ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ

// [top]
abstract class Asset {
  // 자산의 이름을 저장할 변수를 선언
  final String name;

  const Asset({
    required this.name,
  });
}

//----

// [1] 무형자산
abstract class IntangibleAsset extends Asset {
  IntangibleAsset({required super.name, required});

  /// 무형 자산의 상각비용을 계산하는 기능
  void calculateAmortization();
}

// [1-1]특허
class Patent extends IntangibleAsset {
  String patentNumber;

  Patent({
    required this.patentNumber,
    required super.name,
  });

  @override
  void calculateAmortization() {
    // 특허의 상각비용을 계산하는 기능을 구현
  }
}

//----

// [2] 유형 자산
abstract class TangibleAsset extends Asset implements Thing {
  @override
  double weight;

  TangibleAsset({
    required this.weight,
    required super.name,
  });

  /// 유형 자산의 상각비용을 계산하는 기능 구현
  void calculateAmortization();
}

// [2-1]물건
abstract interface class Thing {
  double get weight;

  set weight(double weight);
}

//----

// [2-2]
class Book extends TangibleAsset {
  @override
  String name;

  int price;
  String color;
  String isbn;

  @override
  double weight;

  Book({
    required this.name,
    required this.price,
    required this.color,
    required this.isbn,
    required this.weight,
  }) : super(weight: 0.0, name: '');

  @override
  void calculateAmortization() {
    /// 유형 자산의 상각비용을 계산하는 기능 구현
  }
}

// [2-2]
class Computer extends TangibleAsset {
  @override
  String name;

  int price;
  String color;
  String makerName;

  @override
  double weight;

  Computer({
    required this.name,
    required this.price,
    required this.color,
    required this.makerName,
    required this.weight,
  }) : super(weight: 0.0, name: '');

  @override
  void calculateAmortization() {
    /// 유형 자산의 상각비용을 계산하는 기능 구현
  }
}
