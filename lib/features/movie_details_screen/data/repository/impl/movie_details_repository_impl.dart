import 'package:movies_app/features/movie_details_screen/data/data_source/remote/movie_details_remote_data_source.dart';
import 'package:movies_app/features/movie_details_screen/data/model/movie_details_response.dart';
import 'package:movies_app/features/movie_details_screen/data/model/movie_suggestions_response.dart';
import 'package:movies_app/features/movie_details_screen/data/repository/movie_details_repository.dart';

class MovieDetailsRepositoryImpl implements MovieDetailsRepository {
  MovieDetailsRemoteDatasource movieDetailsRemoteDatasource;

  MovieDetailsRepositoryImpl({required this.movieDetailsRemoteDatasource});
  @override
  Future<MovieDetailsResponse?> getMovieDetails(String movieId) {
    return movieDetailsRemoteDatasource.getMovieDetails(movieId);
  }

  @override
  Future<MovieSuggestionsResponse> getMovieSuggestion(String movieId) {
    return movieDetailsRemoteDatasource.getMovieSuggestion(movieId);
  }
}
