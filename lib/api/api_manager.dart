import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies_app/api/api_constants.dart';
import 'package:movies_app/api/end_points.dart';
import 'package:movies_app/model/movie_response.dart';

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
      if ( json['status'] == 'ok') {
        return MovieResponse.fromJson(json);
      } else {
        return MovieResponse(
          status: "error",
          statusMessage: json['status_message'] ?? "Invalid response",
          data: null,
        );
      }
    } catch (e) {
      return MovieResponse(
        status: "error",
        statusMessage: "Something went wrong: $e",
        data: null,
      );
    }
  }
}
