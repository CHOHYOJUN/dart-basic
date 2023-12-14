import 'dates.dart';
import 'movie_result.dart';

class MovieData {
  Dates dates;
  int page;
  List<MovieResult> results;
  int totalPages;
  int totalResults;

  MovieData({
    required this.dates,
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory MovieData.fromJson(Map<String, dynamic> json) {
    return MovieData(
      dates: Dates.fromJson(json['dates'] ?? {}),
      page: json['page'] ?? 0,
      results: (json['results'] != null
          ? List<MovieResult>.from(
          json['results'].map((result) => MovieResult.fromJson(result)))
          : []),
      totalPages: json['total_pages'] ?? 0,
      totalResults: json['total_results'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'dates': dates.toJson(),
      'page': page,
      'results': results.map((result) => result.toJson()).toList(),
      'total_pages': totalPages,
      'total_results': totalResults,
    };
  }
}