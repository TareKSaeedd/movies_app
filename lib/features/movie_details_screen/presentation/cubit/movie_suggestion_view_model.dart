import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/movie_details_screen/data/repository/movie_details_repository.dart';
import 'package:movies_app/features/movie_details_screen/presentation/cubit/movie_suggestion_states.dart';

class MovieSuggestionViewModel extends Cubit<MovieSuggestionStates> {
  MovieDetailsRepository movieDetailsRepository;
  MovieSuggestionViewModel({required this.movieDetailsRepository})
    : super(MovieSuggestionLoadingStates());

  void getMoviesSuggestions(String movieId) async {
    try {
      var response = await movieDetailsRepository.getMovieSuggestion(movieId);
      if (response.status == 'ok') {
        emit(MovieSuggestionSuccessState(suggestionMovies: response.data!.movies));
      } else if (response.status != 'ok') {
        emit(MovieSuggestionErrorState(errorMessage: response.statusMessage!));
      }
    } on Exception catch (e) {
      emit(MovieSuggestionErrorState(errorMessage: e.toString()));
    }
  }
}
