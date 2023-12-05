
import 'package:untitled/12_05/intangible_asset.dart';

// 특허
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