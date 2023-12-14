import 'dart:io';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

void main() {
  downloadAndSaveImage();
}

void downloadAndSaveImage() async {
  String path = 'lib/12_14/assets/';
  String fileName = 'icon.ico';
  String url = '행ttps://alimipro.com/favicon.ico'; // https://alimipro.com/favicon.ico
  String fallbackUrl = 'https://static.typingclub.com/m/corp2/img/favicon.png';

  try {
    print('다운로드 시작');
    DateTime startTime = DateTime.now();

    String imageUrl = await getValidImageUrl(url, fallbackUrl);
    Uint8List imageBytes = await downloadImage(imageUrl);

    if (imageBytes != null) {

      await saveImageToFile(imageBytes, path + fileName);
      DateTime endTime = DateTime.now();
      Duration duration = endTime.difference(startTime);

      print('다운로드 끝');
      print('===========');
      print('소요 시간: ${formatDuration(duration)}');
      print('용량: ${imageBytes.length} bytes');
      print('이미지 다운로드 성공 ${path + fileName}에 저장.');

    } else {
      print('이미지 다운로드 실패');
    }
  } catch (e) {
    print('이미지 다운로드 및 저장 중 오류가 발생했습니다: $e');
  }
}

/// 이미지 URL에서 다운로드 시도. 유효하지 않을 경우 대체 URL로 다운로드 실행.
/// 다운로드에 실패할 경우 예외 처리.
Future<String> getValidImageUrl(String url, String fallbackUrl) async {
  if (await canDownloadImage(url)) {
    return url;
  } else {
    print('유효하지 않은 URL입니다.');
    print('대체 URL로 다운로드를 시도합니다.');
    if (await canDownloadImage(fallbackUrl)) {
      return fallbackUrl;
    } else {
      throw Exception('대체 URL로 이미지 다운로드 실패: $fallbackUrl');
    }
  }
}

/// URL에서 이미지를 다운로드 할 수 있는지 확인.
/// 다운로드 가능한 경우 true를 반환, 그렇지 않은 경우 false를 반환.
Future<bool> canDownloadImage(String url) async {
  try {
    final response = await http.head(Uri.parse(url));
    return response.statusCode == 200;
  } catch (e) {
    return false;
  }
}

/// URL에서 이미지를 다운로드하여 Uint8List 형태로 반환
/// 다운로드에 실패할 경우 예외처리
Future<Uint8List> downloadImage(String imageUrl) async {
  final response = await http.get(Uri.parse(imageUrl));

  if (response.statusCode == 200) {
    return response.bodyBytes;
  } else {
    throw Exception('이미지 다운로드 실패: ${response.statusCode}');
  }

}

/// Uint8List 형태의 이미지를 파일로 저장
Future<void> saveImageToFile(Uint8List imageBytes, String savePath) async {
  await File(savePath).writeAsBytes(imageBytes);
}

/// Duration을 "H:mm:ss.S" 형식의 문자열로 변환하여 반환
String formatDuration(Duration duration) {
  final formatter = DateFormat('H:mm:ss.S');
  return formatter.format(DateTime(0).add(duration));
}
