import 'dart:math';

class Cleric {
  String name = "아벨";
  static const int maxHp = 50;
  static const int maxMp = 10;
  int hp;
  int mp;

  Cleric(
      this.name,
    {
      this.hp = maxHp,
      this.mp = maxMp,
    }
  );

  /// 셀프에이드 : mp를 소모해서, hp 회복한다.
  void selfAid() {
    mp = -10; // mp10 소모
    hp = maxHp; // 최대 hp까지 회복
  }

  /// 기도하기 : 자신의 mp 회복한다.
  /// 기도한 시간(초) : 랜덤 0 ~ 2
  /// param : int prayTime / return int result;
  int pray(int prayTime) {
    print('mp : $mp / maxMp : $maxMp');

    int result = 0;
    int point = Random().nextInt(3);

    if (mp < maxMp) result = prayTime + point;

    // maxMp 이하 검증
    if ((mp + result) > maxMp) result = maxMp - mp;

    print('회복시간: $prayTime / 회복량: $point / 최종 회복량: $result');

    return result;
  }


}
