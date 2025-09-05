import 'package:movies_app/features/movie_details_screen/data/model/movie_details_response.dart';
import 'package:movies_app/features/movie_details_screen/data/model/movie_suggestions_response.dart';

abstract class MovieDetailsRemoteDatasource {
  Future<MovieDetailsResponse?> getMovieDetails(String movieId);
  Future<MovieSuggestionsResponse> getMovieSuggestion(String movieId);
}
