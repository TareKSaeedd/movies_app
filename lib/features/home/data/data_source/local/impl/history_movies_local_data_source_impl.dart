import 'package:movies_app/core/services/history_movie_services.dart';
import 'package:movies_app/features/home/data/data_source/local/history_movies_local_data_source.dart';
import 'package:movies_app/features/movie_details_screen/data/model/movie_details_response.dart';

class HistoryMoviesLocalDataSourceImpl implements HistoryMoviesLocalDataSource {
  HistoryMovieServices services;
  HistoryMoviesLocalDataSourceImpl({required this.services});
  @override
  Future<void> addMovieToHistory(Movie movie) {
    // TODO: implement addMovieToHistory
    return services.addMovieToHistory(movie);
  }

  @override
  Future<List<Movie>> getHistory() {
    // TODO: implement getHistory

    return services.getHistory();
  }
}
