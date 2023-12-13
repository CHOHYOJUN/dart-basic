void main() {
  exAsync();
}

/// 타임아웃 처리 - 예제
void exAsync() async {

  try {
    String success = await timeoutFuture().timeout(Duration(seconds: 4));
    print(success); // 'ok' 메세지 출력
  } catch (error) {
    print('timeout'); // 'timeout' 메시지 출력
  }

}

Future<String> timeoutFuture() async {
  await Future.delayed(Duration(seconds: 3));
  return 'ok';
}
