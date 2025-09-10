import 'package:movies_app/features/movie_details_screen/data/model/movie_details_response.dart';

abstract class HistoryRepository {
  Future<void> addMovieToHistory(Movie movie);
  Future<List<Movie>> getHistory();
}
