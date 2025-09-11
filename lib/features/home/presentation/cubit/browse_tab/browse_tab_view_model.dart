import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repository/browse_tab_repository.dart';
import 'browse_tab_states.dart';

class BrowseTabViewModel extends Cubit<BrowseTabState> {
  final BrowseTabRepository repository;

  int selectedIndex = 0;
  List<String> genres = [];

  BrowseTabViewModel({required this.repository}) : super(BrowseInitialState());

  Future<void> getGenres() async {
    emit(BrowseLoadingState());
    try {
      final fetchedGenres = await repository.getGenres();
      genres = fetchedGenres;
      if (genres.isNotEmpty) {
        await changeSelectedGenre(0);
      } else {
        emit(BrowseSuccessState(genres: [], movies: [], selectedIndex: 0));
      }
    } catch (e) {
      emit(BrowseErrorState(errorMessage: e.toString()));
    }
  }

  Future<void> changeSelectedGenre(int index) async {
    selectedIndex = index;
    emit(BrowseLoadingState());
    try {
      final movies = await repository.getMoviesByGenre(genres[selectedIndex]);
      emit(
        BrowseSuccessState(
          genres: genres,
          movies: movies,
          selectedIndex: selectedIndex,
        ),
      );
    } catch (e) {
      emit(BrowseErrorState(errorMessage: e.toString()));
    }
  }
}
