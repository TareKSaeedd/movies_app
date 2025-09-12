import 'package:movies_app/features/favorites/data/model/favorites_model.dart';

import '../../../movie_details_screen/data/model/movie_details_response.dart';

abstract class FavoritesRepository {
  Future<List<FavoritesModel>> getAllFavorites({required String token});
  Future<void> addMovieToFavorites({required Movie movie});

}
