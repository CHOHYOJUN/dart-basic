import 'dart:io';
import 'package:csv/csv.dart';

void main() {
  exAsync();
}

/// 비동기 예제
/// csv 라이브러리 사용
void exAsync() async {
  String path = 'lib/12_13/assets/';
  String fileName = 'simple.csv';

  try {
    // 파일 열기
    File file = openFile(path: path, fileName: fileName);

    // 파일 여부 확인
    bool isFile = await file.exists();
    if (!isFile) {
      throw FileSystemException('파일이 존재하지 않습니다.');
    }

    // 2중 배열 리스트 -- [[1, 홍길동, 30], [2, 한석봉, 20]]
    List<List<dynamic>> csvTable = await convertCsvList(file: file);

    // 내용 수정 여부
    bool isUpdate = false;

    // 수정된 새로운 2중 배열 리스트
    List<List<dynamic>> newCsvTable = csvTable.map((row) {
      return row
          .asMap()
          .map((index, name) {
            if (index == 1 && name == '한석봉') {
              // 1 열에서 조건 찾기
              isUpdate = true; // 수정 성공
              return MapEntry(index, '김석봉'); // 이름 변경
            } else {
              return MapEntry(index, name); // 그대로 유지
            }
          })
          .values.toList(); // Map 객체 리스트 반환
    }).toList(); // 리스트 반환

    // 새 파일 작성
    if (isUpdate) {
      // 2중 배열 리스트 -> csv 형식 문자열로 변환
      String csvString = generateCsvString(csvTable: newCsvTable);

      // 수정한 내용 작성할 파일
      File newFile = openFile(path: path, fileName: 'sample_copy.csv');

      // 파일에 수정한 내용 작성
      bool isWrite = await writeFile(file: newFile, content: csvString);

      if (isWrite) {
        print('파일 쓰기 성공');
      }
    }
  } catch (e) {
    print('예외가 발생했습니다: $e');
  }
}

/// 파일 열기
File openFile({required String path, required String fileName}) => File(path + fileName);

/// 파일 읽기 -> 문자열 추출(csv 문자열) -> 2중 배열 리스트 변환
Future<List<List<dynamic>>> convertCsvList({required File file}) async {
  try {
    List<String> lines = await file.readAsLines();
    String csvContent = lines.join('\n');
    return CsvToListConverter(eol: '\n').convert(csvContent);
  } catch (e) {
    throw Exception('CSV 파일을 읽는 중에 예외가 발생했습니다: $e');
  }
}

/// 2중배열 리스트 -> csv 문자열 변환
String generateCsvString({required List<List<dynamic>> csvTable}) => ListToCsvConverter().convert(csvTable);


/// csv 문자열 -> 파일 쓰기
Future<bool> writeFile({required File file, required String content}) async {
  try {
    await file.writeAsString(content);
    return true;
  } catch (e) {
    throw Exception('CSV 파일을 작성 중에 예외가 발생했습니다: $e');
  }
}
