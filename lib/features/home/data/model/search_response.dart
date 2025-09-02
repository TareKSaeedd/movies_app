import 'movie_response.dart';

class SearchResponse {
  final List<Movies> movies;

  SearchResponse({required this.movies});

  factory SearchResponse.fromJson(Map<String, dynamic> json) {
    final movieResponse = MovieResponse.fromJson(json);
    return SearchResponse(
      movies: movieResponse.data?.movies ?? [],
    );
  }
}