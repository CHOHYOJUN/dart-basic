import 'dart:io';
/// 파일조작
void main() {


  String path = 'lib/12_11/asset/';
  String fileName1 = 'file1.txt';
  String fileName2 = 'file2.txt';

  try {
    copy(source: path + fileName1, target: path + fileName2);
  } catch (e) {
    print(e);
  }
}

/// 연습문제1 - 복사하는 함수 작성
void copy({required String source, required String target}) {
  try {
    File file1 = File(source);

    if (!file1.existsSync()) throw Exception('복사할 파일이 존재하지 않습니다.');

    List<String> file1Content = file1.readAsLinesSync();
    if (file1Content.isEmpty) throw Exception('파일의 내용이 없습니다.');

    File file2 = File(target);

    file1.copySync(file2.path);
    print('파일 복사가 완료 되었습니다.');
  } catch (e) {
    print(e);
  }
}
