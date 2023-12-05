import 'package:untitled/12_05/tangible_asset.dart';

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