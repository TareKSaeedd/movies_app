import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_app/core/network/favorites_api/favorites_api_end_points.dart';
import 'package:movies_app/features/movie_details_screen/data/model/movie_details_response.dart';

import '../../../features/favorites/data/model/favorites_model.dart';

class FavoritesApiManager {
  Future<List<FavoritesModel>> getAllFavorites({required String token}) async {
    final url = Uri.https(
      FavoritesApiEndPoints.baseUrl,
      FavoritesApiEndPoints.getAllFavoritesEndPoint,
    );
    final response = await http.get(
      url,
      headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json",
      },
    );

    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);
      final List moviesJson = decoded["data"];
      return moviesJson.map((json) => FavoritesModel.fromJson(json)).toList();
    } else {
      throw Exception(
        "Failed to fetch favorites, statusCode: ${response.statusCode}",
      );
    }
  }

 Future<void>  addMovieToFavorites({required Movie movie}) async {
   final url = Uri.https(
     FavoritesApiEndPoints.baseUrl,
     FavoritesApiEndPoints.addMovieToFavoriteEndPoint,
   );
   final token = FavoritesApiEndPoints.addMovieToFavoriteToken;
   final body = {
     'movieId': movie.id,
     'name': movie.title,
     'rating': movie.rating,
     "imageURL": movie.url,
     "year": movie.year
   };
   final response = await http.post(
     url,
     headers: {
       "Content-Type": "application/json",
       "Authorization": "Bearer $token",
     },
     body: jsonEncode(body),
   );

   if (response.statusCode >= 200 && response.statusCode < 300) {
     final json = jsonDecode(response.body);
     return json;
   } else {
     throw Exception(
         "Failed to add favorite");
   }

 }
}
