import 'package:flutter/material.dart';

import '../../../../../../../core/navigation/app_routes.dart';
import '../../data/model/favorites_model.dart';
import 'movie_grid_item.dart';

class FavoritesMoviesGrid extends StatelessWidget {
  final List<FavoritesModel> movies;
  const FavoritesMoviesGrid({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: width * 0.04, vertical: height * 0.02),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.7,
        crossAxisSpacing: width * 0.05,
        mainAxisSpacing: height * 0.02,
      ),
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(
            AppRoutes.detailsScreenPageRouteName,
            arguments: int.parse(movies[index].movieId),
          );
        },
        child: MovieGridItem(
          imageUrl: movies[index].imageURL ?? "",
          rateValue: movies[index].rating.toString(),
        ),
      ),
      itemCount: movies.length,
    );
  }
}
