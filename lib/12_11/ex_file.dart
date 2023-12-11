import 'dart:io';

void main()  {
  try {
    // open
    final myFile = File('save.txt');

    print(myFile.existsSync());

    // 쓰기
    myFile.writeAsStringSync('test');

    // 쓰기 - 기존 + 추가
    myFile.writeAsStringSync('추가 메세지', mode: FileMode.append); // 내용 추가

    // 읽기
    final arrString1 = myFile.readAsLinesSync();

    print('arrString1 : ${arrString1.length}');

    print(arrString1);

  } catch (e) {
    print(e);
  }
}
