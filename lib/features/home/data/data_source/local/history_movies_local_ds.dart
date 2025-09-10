

import '../../../../movie_details_screen/data/model/movie_details_response.dart';

abstract class HistoryMoviesLocalDs {
  Future<void> addMovieToHistory(Movie movie);
  Future<List<Movie>> getHistory();
}
