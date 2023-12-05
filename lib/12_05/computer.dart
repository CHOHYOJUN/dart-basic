import 'package:untitled/12_05/tangible_asset.dart';

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




