import 'package:movies_app/features/home/data/model/movie_response.dart';

abstract class BrowseTabRepository {
  Future<List<String>> getGenres();

  Future<List<Movies?>> getMoviesByGenre(String genre);
}
