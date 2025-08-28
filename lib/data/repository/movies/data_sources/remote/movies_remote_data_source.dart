import 'package:movies_app/model/movie_response.dart';

abstract class MoviesRemoteDataSource{
   Future<MovieResponse?>  getMovies();

}