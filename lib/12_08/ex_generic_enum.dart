
/// [ Dart 제네릭, 열거형 enum 연습문제 1,2 ]
// - StrongBox() 생성할때 KeyType 을 생성자로 지정 한다.
// - get() 할때 생성자로 주입한 KeyType의 카운트를 ++ 또는 -- 한다.
// - get() 사용횟수에 도달하지 않았을 경우 null을 리턴한다. // 사용횟수에 도달하면 해당 키타입을 리턴한다.
// - put() 에 KeyType을 주입해서, 그 이후론 get()할때 해당 KeyType의 사용횟수를 가산 or 감산 한다.

void main() {

  StrongBox sb = StrongBox(keyType: KeyType.padlock);

  print(sb); print('get(): ${sb.get()}'); print(sb); print('');

  //---- put 테스트
  // -- button
  sb.put(KeyType.button);
  print(sb); print('get(): ${sb.get()}'); print(sb); print('');

  //-- dial
  sb.put(KeyType.dial);
  print(sb); print('get(): ${sb.get()}'); print(sb); print('');

  //-- finger
  sb.put(KeyType.finger);
  print(sb); print('get(): ${sb.get()}'); print(sb); print('');


  //-- 도달 테스트
  print('횟수 도달--');
  sb._fingerCount = 1;
  print(sb); print('get(): ${sb.get()}'); print(sb); print('');
  print(sb); print('get(): ${sb.get()}'); print(sb); print('');

}

/// KeyType enum 구현
enum KeyType {
  padlock(maxCount: 1024),
  button(maxCount: 10000),
  dial(maxCount: 30000),
  finger(maxCount: 100000);

  final int maxCount;

  const KeyType({required this.maxCount});
}

///  StrongBox class 구현
class StrongBox<E extends KeyType> {
  KeyType _keyType;

  // 사용 횟수
  int _padlockCount = KeyType.padlock.maxCount;
  int _buttonCount = KeyType.button.maxCount;
  int _dialCount = KeyType.dial.maxCount;
  int _fingerCount = KeyType.finger.maxCount;

  StrongBox({
    required KeyType keyType,
  }) : _keyType = keyType;


  KeyType? get() {
    KeyType? resultKeyType; // 초기값 null

    /// 0 보다 작으면(0포함=true) , 카운트를 감산하고, 그렇지 않으면 해당 타입을 리턴한다.
    switch (_keyType) {
      case KeyType.padlock:
        padlockCount >= 1 ? padlockCount-- : resultKeyType = _keyType;
        break;
      case KeyType.button:
        buttonCount >= 1 ? buttonCount-- : resultKeyType = _keyType;
        break;
      case KeyType.dial:
        dialCount >= 1 ? buttonCount-- : resultKeyType = _keyType;
        break;
      case KeyType.finger:
        fingerCount >= 1 ? fingerCount-- : resultKeyType = _keyType;
        break;
    }
    return resultKeyType;
  }

  // ----

  void put(KeyType keyType) {
    _keyType = keyType;
  }

  int get fingerCount => _fingerCount;

  set fingerCount(int value) {
    _fingerCount = value;
  }

  int get dialCount => _dialCount;

  set dialCount(int value) {
    _dialCount = value;
  }

  int get buttonCount => _buttonCount;

  set buttonCount(int value) {
    _buttonCount = value;
  }

  int get padlockCount => _padlockCount;

  set padlockCount(int value) {
    _padlockCount = value;
  }

  // --

  @override
  String toString() {
    return 'StrongBox{_keyType: $_keyType, _padlockCount: $_padlockCount, _buttonCount: $_buttonCount, _dialCount: $_dialCount, _fingerCount: $_fingerCount}';
  }
}
