import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/movie_details_screen/data/repository/movie_details_repository.dart';
import 'package:movies_app/features/movie_details_screen/presentation/cubit/movie_details_states.dart';

class MovieDetailsViewModel extends Cubit<MovieDetailsStates> {
  MovieDetailsRepository movieDetailsRepository;
  MovieDetailsViewModel({required this.movieDetailsRepository}) : super(MovieDetailsInitialState());

  void getMovieDetails(String movieId) async {
    emit(MovieDetailsLoadingState());
    try {
      var response = await movieDetailsRepository.getMovieDetails(movieId);
      if (response!.status == 'ok') {
        emit(MovieDetailsSuccessState(movieDetails: response.data!.movie!));
      } else if (response.status != 'ok') {
        emit(MovieDetailsErorrState(message: response.statusMessage!));
      }
    } on Exception catch (e) {
      emit(MovieDetailsErorrState(message: e.toString()));
    }
  }

  void getMoviesSuggestions(String movieId) async {
    try {
      var response = await movieDetailsRepository.getMovieSuggestion(movieId);
      if (response.status == 'ok') {
        print("Suggestions movies: ${response.data?.movies?.map((m) => m.mediumCoverImage)}");
        emit(MovieSuggestionSuccessState(suggestionMovies: response.data!.movies));
      } else if (response.status != 'ok') {
        emit(MovieDetailsErorrState(message: response.statusMessage!));
      }
    } on Exception catch (e) {
      emit(MovieDetailsErorrState(message: e.toString()));
    }
  }
}
