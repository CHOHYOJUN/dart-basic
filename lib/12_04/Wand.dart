class Wand {
  String _name;
  double _power;

  Wand({required String? name, required double power})
      : _name = name ?? (throw Exception('name은 null 일 수 없습니다.')),
        _power = power {
    if (_name.length < 3) throw Exception('name은 3자 이상이야 합니다.');
    if (_power < 0.5 || _power > 100.0) throw Exception('지팡이 마력은 0.5이상 ~ 100.0 이하여야 합니다.');
  }

  String get name => _name;
  double get power => _power;

  set name(String value) {
    /// [1] null 일수 없고, 반드시 3문자 이상 이어야 한다.
    if(value == null || value.length < 3) throw Exception('null 일수 없고, 반드시 3문자 이상 이어야 한다.');
    _name = value;
  }

  set power(double value) {
      /// [2] 지팡이 마력은 0.5이상 ~ 100.0 이하여야 한다.
      if(!(value >= 0.5 && value <= 100.0)) throw Exception('지팡이 마력은 0.5이상 ~ 100.0 이하여야 합니다.');
    _power = value;
  }


}