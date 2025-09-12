import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_app/core/network/favorites_api/favorites_api_end_points.dart';

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
  Future<void> deleteFavorite({
    required String token,
    required String movieId,
  }) async {
    final url = Uri.https(
      FavoritesApiEndPoints.baseUrl,
      "${FavoritesApiEndPoints.deleteFavoriteEndPoint}/$movieId",
    );

    final response = await http.delete(
      url,
      headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json",
      }

    );

    if (response.statusCode != 200 && response.statusCode != 204) {
      throw Exception(
        "Failed to delete favorite, statusCode: ${response.statusCode}",
      );
    }
  }


  Future<bool> checkIsFavorite({
    required String token,
    required String movieId,
  }) async {
    final url = Uri.https(
      FavoritesApiEndPoints.baseUrl,
      FavoritesApiEndPoints.isFavoriteEndPoint,
      {"moviedId": movieId},
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
      return decoded["data"] as bool;
    } else {
      throw Exception(
        "Failed to check favorite status, statusCode: ${response.statusCode}",
      );
    }
  }

}




