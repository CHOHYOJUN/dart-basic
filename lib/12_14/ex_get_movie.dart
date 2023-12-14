import 'dart:convert';
import 'package:http/http.dart' as http;
import 'entity/movie_data.dart';
import 'entity/movie_result.dart';
import 'entity/dates.dart';

void main() async {

  /// 연습문제1
  // exhttp1();

  /// 연습문제2
  exhttp2();

}

/// 연습문제1
void exhttp1() async{
  String url ='https://api.themoviedb.org/3/movie/upcoming?api_key=a64533e7ece6c72731da47c9c8bc691f&language=ko-KR&page=1';
  MovieData movieData = await fetchMovies(upcoming: url);

  // 객체 json 타입 출력
  // print(movieData.toJson());

  // json 타입 문자열
  var jsonString = jsonEncode(movieData.toJson());
  print(jsonString);
}

/// 연습문제2
void exhttp2() async{
  // 839369  : 메이 디셈버
  String movieId = (839369).toString();
  String url ='https://api.themoviedb.org/3/movie/${movieId}?api_key=a64533e7ece6c72731da47c9c8bc691f&language=ko-KR&page=1';
  MovieResult movieResult = await searchByMovieId(movieIdUrl: url);


  print(movieResult);
}

// ID로 데이터 검색
Future<MovieResult> searchByMovieId({required String movieIdUrl}) async {
  final response = await http.get(Uri.parse(movieIdUrl));
  if (response.statusCode == 200) {
    String jsonString = response.body;
    print(jsonString);

    Map<String, dynamic> jsonData = jsonDecode(jsonString) as Map<String, dynamic>;
    MovieResult movieDetailInfo = MovieResult.fromJson(jsonData);
    return movieDetailInfo;
  } else {
    throw Exception('영화 로드 실패: ${response.statusCode}');
  }
}

// 전체 데이터 가져오기
Future<MovieData> fetchMovies({required String upcoming}) async {
  final response = await http.get(Uri.parse(upcoming));
  if (response.statusCode == 200) {
    String jsonString = response.body;
    Map<String, dynamic> jsonData = jsonDecode(jsonString) as Map<String, dynamic>;
    MovieData movieData = MovieData.fromJson(jsonData);
    return movieData;
  } else {
    throw Exception('영화 로드 실패: ${response.statusCode}');
  }
}
