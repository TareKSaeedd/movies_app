import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/movie_details_screen/data/repository/movie_details_repository.dart';
import 'package:movies_app/features/movie_details_screen/presentation/cubit/movie_details_states.dart';

import '../../../home/data/repository/history_repository.dart';

class MovieDetailsViewModel extends Cubit<MovieDetailsStates> {
  MovieDetailsRepository movieDetailsRepository;
   HistoryRepository historyRepository;
  MovieDetailsViewModel({required this.movieDetailsRepository,    required this.historyRepository,
  }) : super(MovieDetailsInitialState());


  void getMovieDetails(String movieId) async {
    emit(MovieDetailsLoadingState());
    try {
      var response = await movieDetailsRepository.getMovieDetails(movieId);
      if (response!.status == 'ok') {

        await historyRepository.addMovieToHistory( response.data!.movie!);
        emit(MovieDetailsSuccessState(movieDetails: response.data!.movie!));
      } else if (response.status != 'ok') {
        emit(MovieDetailsErorrState(message: response.statusMessage!));
      }
    } on Exception catch (e) {
      emit(MovieDetailsErorrState(message: e.toString()));
    }
  }
}


