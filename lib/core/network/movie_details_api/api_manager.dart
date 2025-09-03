import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies_app/core/network/movies_api/api_constants.dart';
import 'package:movies_app/core/network/movie_details_api/end_points.dart';
import '../../../features/home/data/model/movie_details_response.dart';

class MovieDetailsApiManager {
  Future<MovieDetailsResponse> getMovieDetails(int movieId) async {
    try {
      final url = Uri.https(
        ApiConstants.baseUrl,
        EndPoints.movieDetails,
        {
          "movie_id": movieId.toString(),
          "with_images": "true",
        },
      );

      final response = await http.get(url);

      if (response.statusCode != 200) {
        return MovieDetailsResponse(
          status: "error",
          statusMessage: "Server error: ${response.statusCode}",
          data: null,
          meta: null,
        );
      }

      final jsonMap = jsonDecode(response.body) as Map<String, dynamic>;
      if ((jsonMap['status'] ?? '') == 'ok') {
        return MovieDetailsResponse.fromJson(jsonMap);
      } else {
        return MovieDetailsResponse(
          status: "error",
          statusMessage: jsonMap['status_message']?.toString() ?? "Invalid response",
          data: null,
          meta: null,
        );
      }
    } catch (e) {
      return MovieDetailsResponse(
        status: "error",
        statusMessage: "Something went wrong: $e",
        data: null,
        meta: null,
      );
    }
  }
}
