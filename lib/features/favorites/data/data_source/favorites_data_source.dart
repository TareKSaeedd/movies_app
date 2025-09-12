
import '../../../movie_details_screen/data/model/movie_details_response.dart';
import '../model/favorites_model.dart';

abstract class FavoritesDataSource {
  Future<List<FavoritesModel>> getAllFavorites({required String token});
  Future<void> addMovieToFavorites({required Movie movie});
}
