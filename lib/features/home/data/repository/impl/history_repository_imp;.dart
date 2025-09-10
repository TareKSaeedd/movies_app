import 'package:movies_app/features/home/data/repository/history_repository.dart';
import 'package:movies_app/features/movie_details_screen/data/model/movie_details_response.dart';
import '../../data_source/local/history_movies_local_ds.dart';

class HistoryRepositoryImpl implements HistoryRepository {
  final HistoryMoviesLocalDs localDs;
  HistoryRepositoryImpl({required this.localDs});

  @override
  Future<void> addMovieToHistory(Movie movie) {
    return localDs.addMovieToHistory(movie);
  }

  @override
  Future<List<Movie>> getHistory() {
    return localDs.getHistory();
  }
}
