import 'package:movies_app/features/home/model/movie_response.dart';

abstract class HomeTabRepository {
  Future<MovieResponse?> getMovies();
}
