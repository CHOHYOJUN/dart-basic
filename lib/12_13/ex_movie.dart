import 'dart:convert';

Future<String> getMovieInfo() async {
  await Future.delayed(Duration(seconds: 2));
  final mockData = {
    'title': 'Star Wars',
    'director': 'George Lucas',
    'year': 1977,
  };

  return jsonEncode(mockData);
}

void main() {
  () async {
    print('감독: ${jsonDecode(await getMovieInfo())['director']}'); // George Lucas
  }();
}

class Movie {
  String _title;
  String _director;
  int _year;

  Movie({
    required String title,
    required String director,
    required int year,
  })  : _title = title,
        _director = director,
        _year = year;

  Map<String, dynamic> toJson() {
    return {
      'title': _title,
      'director': _director,
      'year': _year,
    };
  }

  factory Movie.fromJson(Map<String, dynamic> map) {
    return Movie(
      title: map['title'] as String,
      director: map['director'] as String,
      year: map['year'] as int,
    );
  }

  int get year => _year;

  set year(int value) {
    _year = value;
  }

  String get director => _director;

  set director(String value) {
    _director = value;
  }

  String get title => _title;

  set title(String value) {
    _title = value;
  }

  @override
  String toString() {
    return 'Movie{title: $_title, director: $_director, year: $_year}';
  }
}
