import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../features/movie_details_screen/data/model/movie_details_response.dart';

class HistoryMovieServices {
  static const String key = "history_movies";

  Future<void> addMovieToHistory(Movie movie) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> movies = prefs.getStringList(key) ?? [];

    String movieJson = jsonEncode(movie.toJson());


    if (!movies.contains(movieJson)) {
      movies.add(movieJson);
      await prefs.setStringList(key, movies);
    }
  }

  Future<List<Movie>> getHistory() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> moviesJson = prefs.getStringList(key) ?? [];

    return moviesJson
        .map((movieStr) => Movie.fromJson(jsonDecode(movieStr)))
        .toList();
  }
}
