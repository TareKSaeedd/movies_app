import 'package:movies_app/core/network/movies_api/api_manager.dart';
import 'package:movies_app/features/movie_details_screen/data/data_source/remote/movie_details_remote_data_source.dart';
import 'package:movies_app/features/movie_details_screen/data/model/movie_details_response.dart';
import 'package:movies_app/features/movie_details_screen/data/model/movie_suggestions_response.dart';

class MovieDetailsRemoteDataSourceImpl implements MovieDetailsRemoteDatasource {
  ApiManager apiManager;

  MovieDetailsRemoteDataSourceImpl({required this.apiManager});
  @override
  Future<MovieDetailsResponse?> getMovieDetails(String movieId) async {
    var response = await apiManager.getMovieDetails(movieId);
    return response;
  }

  @override
  Future<MovieSuggestionsResponse> getMovieSuggestion(String movieId) async {
    var response = await apiManager.getMovieSuggestions(movieId);
    return response;
  }
}
