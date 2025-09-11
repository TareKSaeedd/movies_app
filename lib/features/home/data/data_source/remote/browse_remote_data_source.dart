import 'package:movies_app/features/home/data/model/movie_response.dart';

abstract class BrowseRemoteDataSource {
  Future<MovieResponse?> getMoviesByGenre(String genre);

  Future<List<String>> getGenres();
}
