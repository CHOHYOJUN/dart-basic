import 'package:untitled/12_05/asset.dart';
import 'package:untitled/12_05/thing.dart';

// 유형 자산
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