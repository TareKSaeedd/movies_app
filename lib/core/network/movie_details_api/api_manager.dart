import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../features/home/data/model/movie_details_response.dart';
import '../movie_details_api/api_constants.dart';
import '../movie_details_api/end_points.dart';

class ApiManger {
  static Future<MovieDetailsResponse> getMovieDetailsByMovieId(String movieId) async {
    Uri url = Uri.https(
      ApiConstants.baseUrl,
      EndPoints.movieDetailsApi,
      {
        'movie_id': movieId,
        'with_images': 'true',
      },
    );

    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        return MovieDetailsResponse.fromJson(json);
      } else {
        throw Exception('Failed to load movie details: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching movie details: $e');
    }
  }
}
