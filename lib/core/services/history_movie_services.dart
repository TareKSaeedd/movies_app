import 'dart:convert';
import 'package:movies_app/core/network/auth_api/shared_pref_network.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../features/movie_details_screen/data/model/movie_details_response.dart';

class HistoryMovieServices {
  // static const String key = "history_movies";

  static int? historyMoviesNumber;

  Future<void> addMovieToHistory(Movie movie) async {
    final prefs = await SharedPreferences.getInstance();
    String? key = await SharedPrefNetwork.getCurrentUserToken();
    List<String> movies = prefs.getStringList(key!) ?? [];

    String movieJson = jsonEncode(movie.toJson());

    if (!movies.contains(movieJson)) {
      movies.add(movieJson);
      await prefs.setStringList(key, movies);
    }
  }

  Future<List<Movie>> getHistory() async {
    final prefs = await SharedPreferences.getInstance();
    String? key = await SharedPrefNetwork.getCurrentUserToken();
    List<String> moviesJson = prefs.getStringList(key!) ?? [];

    historyMoviesNumber = moviesJson
        .map((movieStr) => Movie.fromJson(jsonDecode(movieStr)))
        .toList()
        .length;

    return moviesJson.map((movieStr) => Movie.fromJson(jsonDecode(movieStr))).toList();
  }
}
