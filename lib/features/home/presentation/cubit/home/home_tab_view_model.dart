import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/data/repository/movies/repository/home_tab_repository.dart';
import 'package:movies_app/features/home/presentation/cubit/home/home_tab_states.dart';
import '../../../data/model/movie_response.dart';

class HomeTabViewModel extends Cubit<HomeTabStates> {
  HomeTabViewModel({required this.moviesRepository}) : super(HomeTabLoadingState());
  HomeTabRepository moviesRepository;

  void getMovies() async {
    try {
      emit(HomeTabLoadingState());
      var response = await moviesRepository.getMovies();
      if (response?.status != 'ok') {
        emit(HomeTabErrorState(errorMessage: response!.statusMessage!));
      }
      if (response?.status == 'ok') {
        emit(HomeTabSuccessState(moviesList: response!.data!.movies ?? [], selectedIndex: 0));
      }
    } catch (e) {
      emit(HomeTabErrorState(errorMessage: e.toString()));
    }
  }

  void changeSelectedIndex({required int index, required List<Movies?> moviesList}) {
    emit(HomeTabSuccessState(moviesList: moviesList, selectedIndex: index));
  }
}
