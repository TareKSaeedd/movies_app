import 'package:movies_app/features/home/model/movie_response.dart';

abstract class MoviesRemoteDataSource {
  Future<MovieResponse?> getMovies();
}
