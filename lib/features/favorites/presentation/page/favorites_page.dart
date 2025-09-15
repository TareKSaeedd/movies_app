import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/constants/app_assets.dart';

import '../../../../core/constants/app_styles.dart';
import '../cubit/favorites_states.dart';
import '../cubit/favorites_view_model.dart';
import '../widget/favorites_movies_grid.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  void initState() {
    context.read<FavoritesViewModel>().getAllFavorites();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesViewModel, FavoritesStates>(
      builder: (context, state) {
        if (state is FavoritesLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is FavoritesErrorState) {
          return Center(child: Text(state.message, style: AppStyles.robotoRegular16Yellow));
        } else if (state is FavoritesSuccessState) {
          final movies = state.movies;
          if (movies.isEmpty) {
            return _emptyMoviesWidget();
          }
          return FavoritesMoviesGrid(movies: movies);
        } else {
          return const SizedBox();
        }
      },
    );
  }
}

Widget _emptyMoviesWidget() => Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Image.asset(AppAssets.nonSearchTabIcon),
    SizedBox(height: 10),
    Text("No Favorites Movies Found", style: AppStyles.robotoRegular16Yellow),
  ],
);
