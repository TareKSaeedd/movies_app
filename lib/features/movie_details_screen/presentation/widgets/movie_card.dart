import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/constants/app_colors.dart';
import 'package:movies_app/core/constants/app_styles.dart';
import 'package:movies_app/features/home/data/di/di.dart';
import 'package:movies_app/features/movie_details_screen/presentation/cubit/movie_details_states.dart';
import 'package:movies_app/features/movie_details_screen/presentation/cubit/movie_details_view_model.dart';

class MovieCard extends StatefulWidget {
  final int index;
  final int movieId;

  const MovieCard({super.key, required this.index, required this.movieId});

  @override
  State<MovieCard> createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> {
  MovieDetailsViewModel viewModel = MovieDetailsViewModel(
    movieDetailsRepository: injectMovieDetailsRepository(),
  );

  @override
  void initState() {
    viewModel.getMoviesSuggestions(widget.movieId.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var sizeScreen = MediaQuery.of(context).size;
    return BlocBuilder<MovieDetailsViewModel, MovieDetailsStates>(
      builder: (context, state) {
        if (state is MovieSuggestionSuccessState) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Stack(
              children: [
                CachedNetworkImage(
                  imageUrl:
                      state.suggestionMovies![widget.index].mediumCoverImage ??
                      'https://upload.wikimedia.org/wikipedia/commons/a/ac/No_image_available.svg',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                  placeholder: (context, url) =>
                      Center(child: CircularProgressIndicator(color: AppColors.yellowColor)),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),

                // Image.asset(AppAssets.movie),
                Positioned(
                  top: sizeScreen.height * 0.01,
                  left: sizeScreen.width * 0.02,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: sizeScreen.width * 0.015,
                      vertical: sizeScreen.height * 0.005,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Text(
                          // movie.rating?.toString() ?? "0.0",
                          '8.6',
                          style: AppStyles.robotoMedium15White.copyWith(
                            decoration: TextDecoration.none,
                          ),
                        ),
                        SizedBox(width: sizeScreen.width * 0.01),
                        const Icon(Icons.star, color: Colors.amber, size: 14),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        } else if (state is MovieDetailsErorrState) {
          return Center(child: Text(state.message));
        } else {
          return Center(child: CircularProgressIndicator(color: AppColors.darkGrey));
        }
      },
    );
  }
}

/*


  MovieDetailsViewModel viewModel = MovieDetailsViewModel(
    movieDetailsRepository: injectMovieDetailsRepository(),
  );

  @override
  void initState() {
    viewModel.getMoviesSuggestions(widget.movieId);
    super.initState();
  }

*/
