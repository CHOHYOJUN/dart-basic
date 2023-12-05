
import 'asset.dart';

// 무형자산
abstract class IntangibleAsset extends Asset {
  IntangibleAsset({required super.name, required});

  /// 무형 자산의 상각비용을 계산하는 기능
  void calculateAmortization();
}