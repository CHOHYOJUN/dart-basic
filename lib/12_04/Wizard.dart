import 'Wand.dart';

class Wizard {
  String _name;
  int _hp;
  int _mp;
  Wand _wand;

  Wizard({
    required String? name,
    required int hp,
    required int mp,
    required Wand? wand,
  })
      : _name = name ?? (throw Exception('Wizard name은 null 일 수 없습니다.')),
        _hp = (hp < 0) ? 0 : hp,
        _mp = (mp > 0) ? mp : throw Exception('Wizard mp는 0보다 작을 수 없습니다.'),
        _wand = wand ?? (throw Exception('wand는 null 일 수 없습니다.'))
  ; // end - 생성자


  int get hp => _hp;

  int get mp => _mp;

  String get name => _name;

  Wand? get wand => _wand;


  set hp(int hp) {
    /// [5] 음수가 되는 상황에서 0을 설정 되도록 한다.
    _hp = (hp < 0) ? 0 : hp;
  }

  set mp(int mp) {
    /// [4] MP가 0 이상 이어야 한다.
    if (mp < 0) throw Exception('MP가 0 이상 이어야 합니다.');
    _mp = mp;
  }

  set name(String name) {
    /// [1] null 일수 없고, 반드시 3문자 이상 이어야 한다.
    if (name == null || name.length < 3) throw Exception('name은 null일 수 없고, 3문자 이상이어야 합니다.');
    _name = name;
  }

  set wand(Wand? wand) {

    /// [3] 지팡이는 null 일수 없고, [1] 지팡이 이름도 null 일수 없다.
    if(wand == null || wand.name == null ) throw Exception('지팡이 or 지팡이 name이 null 일 수 없습니다.');

    /// [1] 지팡이 이름은 3문자 이상이어야 한다.
    if(wand.name.length < 3 ) throw Exception('지팡이 이름은 3문자 이상 이어야 합니다.');

    /// [2] 지팡이 마력은 0.5이상 ~ 100.0 이하여야 한다.
    if(!(wand.power >= 0.5 && wand.power <= 100.0)) throw Exception('지팡이 마력은 0.5이상 ~ 100.0 이하여야 합니다.');

    _wand = wand;
  }
}
