import 'package:movies_app/model/movie_response.dart';

abstract class HomeTabRepository{
  Future<MovieResponse?> getMovies();

}