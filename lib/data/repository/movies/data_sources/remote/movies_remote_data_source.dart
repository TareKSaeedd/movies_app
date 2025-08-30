import 'package:movies_app/features/home/data/model/movie_response.dart';

abstract class MoviesRemoteDataSource {
  Future<MovieResponse?> getMovies();
}
