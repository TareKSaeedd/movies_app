import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies_app/core/network/movies_api/api_constants.dart';
import 'package:movies_app/core/network/movies_api/end_points.dart';
import 'package:movies_app/features/movie_details_screen/data/model/movie_details_response.dart';
import 'package:movies_app/features/home/data/model/movie_response.dart';
import 'package:movies_app/features/home/data/model/search_response.dart';
import 'package:movies_app/features/movie_details_screen/data/model/movie_suggestions_response.dart';

class ApiManager {
  Future<MovieResponse?> getMovies() async {
    try {
      final url = Uri.https(ApiConstants.baseUrl, EndPoints.movieApi);
      final response = await http.get(url);

      if (response.statusCode != 200) {
        return MovieResponse(
          status: "error",
          statusMessage: 'Server error: ${response.statusCode}',
          data: null,
        );
      }

      final json = jsonDecode(response.body);
      if (json['status'] == 'ok') {
        return MovieResponse.fromJson(json);
      } else {
        return MovieResponse(
          status: "error",
          statusMessage: json['status_message'] ?? "Invalid response",
          data: null,
        );
      }
    } catch (e) {
      return MovieResponse(status: "error", statusMessage: "Something went wrong: $e", data: null);
    }
  }

  Future<SearchResponse?> searchMovies(String? query) async {
    try {
      final url = Uri.https(ApiConstants.baseUrl, EndPoints.movieApi, {
        "query_term": query,
        "sort_by": "rating",
        "limit": "50",
      });

      final response = await http.get(url);
      if (response.statusCode != 200) {
        return SearchResponse(movies: []);
      }

      final json = jsonDecode(response.body);
      final movieResponse = MovieResponse.fromJson(json);

      if (movieResponse.status == 'ok') {
        return SearchResponse(movies: movieResponse.data?.movies ?? []);
      } else {
        return SearchResponse(movies: []);
      }
    } catch (e) {
      return SearchResponse(movies: []);
    }
  }

  Future<MovieDetailsResponse> getMovieDetails(String movieId) async {
    try {
      Uri url = Uri.https(ApiConstants.baseUrl, EndPoints.movieDetailsApi, {
        'movie_id': movieId,
        'with_images': 'true',
        'with_cast': 'true',
      });
      var response = await http.get(url);
      var json = jsonDecode(response.body);
      return MovieDetailsResponse.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }

  Future<MovieSuggestionsResponse> getMovieSuggestions(String movieId) async {
    try {
      Uri url = Uri.https(ApiConstants.baseUrl, EndPoints.movieSuggestionApi, {
        'movie_id': movieId,
      });
      var response = await http.get(url);
      var json = jsonDecode(response.body);
      return MovieSuggestionsResponse.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }
}
