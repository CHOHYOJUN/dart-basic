/// 예외처리
void main() {
  /// 연습문제 1, 2
  final numString = '10.5';

  /// int.tryParse() 사용
  /// tryParse() 는 성공시 정수 변환, 실패시 null 반환 ?? 연산자로 0을 반환 처리
  int num = int.tryParse(numString) ?? 0;
  print(num); // 출력: 0

  /// 기존 방식
  try {
    num = int.parse(numString);
  } catch (e) {
    num = 0;
  }

  print(num); // 출력: 0

//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ

  /// 'rethrow' 테스트
  try {
    someError2();
  } catch (e) {
    print(e);
  }

}

void someError2() {
  try {
    someError();
  } catch (e) {
    rethrow; // 에러 처리를 미룸
  }
}

void someError() {
  throw FormatException('someError()');
}
