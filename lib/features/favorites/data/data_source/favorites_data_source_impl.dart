import 'package:movies_app/core/network/favorites_api/favorites_api_manger.dart';
import 'package:movies_app/features/favorites/data/data_source/favorites_data_source.dart';
import 'package:movies_app/features/favorites/data/model/add_to_favorites_request.dart';
import 'package:movies_app/features/favorites/data/model/add_to_favorites_response.dart';
import 'package:movies_app/features/favorites/data/model/favorites_model.dart';

class FavoritesDataSourceImpl implements FavoritesDataSource {
  FavoritesApiManager apiManager;
  FavoritesDataSourceImpl({required this.apiManager});

  @override
  Future<List<FavoritesModel>> getAllFavorites({required String token}) {
    return apiManager.getAllFavorites(token: token);
  }

  @override
  Future<bool> checkIsFavorite({required String token, required String movieId}) {
    return apiManager.checkIsFavorite(token: token, movieId: movieId);
  }

  @override
  Future<void> deleteFavorite({required String token, required String movieId}) {
    return apiManager.deleteFavorite(token: token, movieId: movieId);
  }

  @override
  Future<AddToFavoritesResponse> addToFavorites({
    required String token,
    required AddToFavoritesRequest favoriteRequest,
  }) {
    return apiManager.addToFavorites(token: token, favoriteRequest: favoriteRequest);
  }
}
