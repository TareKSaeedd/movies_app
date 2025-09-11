import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/constants/app_assets.dart';
import 'package:movies_app/core/constants/app_colors.dart';
import 'package:movies_app/core/constants/app_styles.dart';
import 'package:movies_app/core/widgets/custom_elevated_button.dart';
import 'package:movies_app/features/movie_details_screen/presentation/cubit/movie_details_states.dart';
import 'package:movies_app/features/movie_details_screen/presentation/cubit/movie_details_view_model.dart';
import 'package:movies_app/features/movie_details_screen/presentation/cubit/movie_suggestion_states.dart';
import 'package:movies_app/features/movie_details_screen/presentation/cubit/movie_suggestion_view_model.dart';
import 'package:movies_app/features/movie_details_screen/presentation/widgets/cast_card.dart';
import 'package:movies_app/features/movie_details_screen/presentation/widgets/count_card.dart';
import 'package:movies_app/features/movie_details_screen/presentation/widgets/genres_card.dart';
import 'package:movies_app/features/movie_details_screen/presentation/widgets/movie_card.dart';
import 'package:movies_app/features/movie_details_screen/presentation/widgets/screen_shots_widget.dart';
import 'package:movies_app/features/home/data/di/di.dart';

class MovieDetailsScreen extends StatelessWidget {
  MovieDetailsScreen({super.key});

  MovieDetailsViewModel movieDetailsViewModel = MovieDetailsViewModel(
    historyRepository: injectHistoryRepository(),
    movieDetailsRepository: injectMovieDetailsRepository(),
  );

  MovieSuggestionViewModel movieSuggestionViewModel = MovieSuggestionViewModel(
    movieDetailsRepository: injectMovieDetailsRepository(),
  );

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    int movieId = ModalRoute.of(context)!.settings.arguments as int;
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => movieDetailsViewModel..getMovieDetails('$movieId')),
        BlocProvider(
          create: (context) => movieSuggestionViewModel..getMoviesSuggestions('$movieId'),
        ),
      ],

      child: BlocBuilder<MovieDetailsViewModel, MovieDetailsStates>(
        builder: (context, state) {
          if (state is MovieDetailsErorrState) {
            return Center(child: Text(state.message, style: AppStyles.robotoRegular20White));
          } else if (state is MovieDetailsSuccessState) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Stack(
                    children: [
                      state.movieDetails.largeCoverImage != null
                          ? CachedNetworkImage(imageUrl: state.movieDetails.largeCoverImage ?? '')
                          : Text(
                              'No cover found for this movie',
                              style: AppStyles.interMedium36White,
                            ),
                      Container(
                        width: width,
                        height: height * 0.7,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              AppColors.blackColor.withOpacity(0.0),
                              AppColors.blackColor.withOpacity(1.0),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          top: height * 0.03,
                          left: width * 0.03,
                          right: width * 0.03,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(Icons.arrow_back_ios, color: AppColors.whiteColor),
                                ),
                                IconButton(
                                  onPressed: () {
                                    // save movie
                                  },
                                  icon: Image.asset(AppAssets.saveYellowIcon),
                                ),
                              ],
                            ),
                            SizedBox(height: height * 0.18),
                            Center(child: Image.asset(AppAssets.playImage, width: width * 0.2)),
                            SizedBox(height: height * 0.2),

                            Text(
                              state.movieDetails.title ?? '',
                              style: AppStyles.robotoBold24White.copyWith(
                                decoration: TextDecoration.none,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: height * 0.02),
                            Opacity(
                              opacity: 0.5,
                              child: Text(
                                state.movieDetails.year!.toString(),
                                style: AppStyles.robotoBold20White.copyWith(
                                  decoration: TextDecoration.none,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(height: height * 0.02),
                            CustomElevatedButton(
                              onPressed: () {
                                //watch Button
                              },
                              buttonContent: Text('Watch', style: AppStyles.robotoBold20White),
                              backgroundColor: AppColors.redColor,
                              borderSideColor: AppColors.redColor,
                            ),
                            SizedBox(height: height * 0.02),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CountCard(
                                  icon: AppAssets.favoriteIcon,
                                  text: state.movieDetails.likeCount.toString(),
                                ),
                                CountCard(
                                  icon: AppAssets.watchIcon,
                                  text: state.movieDetails.runtime.toString(),
                                ),
                                CountCard(
                                  icon: AppAssets.rateIcon,
                                  text: state.movieDetails.rating.toString(),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  //Screen Shots
                  SizedBox(height: height * 0.03),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Screen Shots',
                          style: AppStyles.robotoBold24White.copyWith(
                            decoration: TextDecoration.none,
                          ),
                        ),
                        SizedBox(height: height * 0.02),
                        ScreenShotsWidget(
                          screenShot:
                              state.movieDetails.largeScreenshotImage1 ??
                              'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/450px-No_image_available.svg.png',
                        ),
                        SizedBox(height: height * 0.015),
                        ScreenShotsWidget(
                          screenShot:
                              state.movieDetails.largeScreenshotImage2 ??
                              'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/450px-No_image_available.svg.png',
                        ),
                        SizedBox(height: height * 0.015),
                        ScreenShotsWidget(
                          screenShot:
                              state.movieDetails.largeScreenshotImage3 ??
                              'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/450px-No_image_available.svg.png',
                        ),
                        SizedBox(height: height * 0.03),

                        // similler
                        Text(
                          'Similler',
                          style: AppStyles.robotoBold24White.copyWith(
                            decoration: TextDecoration.none,
                          ),
                        ),

                        BlocBuilder<MovieSuggestionViewModel, MovieSuggestionStates>(
                          builder: (context, state) {
                            if (state is MovieSuggestionSuccessState) {
                              return GridView.builder(
                                padding: EdgeInsets.only(top: height * 0.01),
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: state.suggestionMovies!.length,
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 15,
                                  crossAxisSpacing: 15,
                                  childAspectRatio: 0.65,
                                ),
                                itemBuilder: (context, index) {
                                  return MovieCard(index: index, movieId: movieId);
                                },
                              );
                            } else if (state is MovieSuggestionErrorState) {
                              return Center(child: Text(state.errorMessage));
                            } else if (state is MovieSuggestionLoadingStates) {
                              return Center(child: CircularProgressIndicator());
                            } else {
                              return SizedBox();
                            }
                          },
                        ),
                        SizedBox(height: height * 0.02),
                        //Summary
                        Text(
                          'Summary',
                          style: AppStyles.robotoBold24White.copyWith(
                            decoration: TextDecoration.none,
                          ),
                        ),
                        SizedBox(height: height * 0.02),
                        Text(
                          state.movieDetails.descriptionIntro ?? '',
                          style: AppStyles.robotoRegular16White.copyWith(
                            decoration: TextDecoration.none,
                          ),
                        ),
                        SizedBox(height: height * 0.02),

                        //Cast
                        Text(
                          'Cast',
                          style: AppStyles.robotoBold24White.copyWith(
                            decoration: TextDecoration.none,
                          ),
                        ),
                        SizedBox(height: height * 0.01),
                        CastCard(
                          image:
                              state.movieDetails.cast?[0].urlSmallImage ??
                              'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/450px-No_image_available.svg.png',
                          name: state.movieDetails.cast?[0].name ?? '',
                          charector: state.movieDetails.cast?[0].characterName ?? '',
                        ),
                        SizedBox(height: height * 0.01),
                        CastCard(
                          image:
                              state.movieDetails.cast?[1].urlSmallImage ??
                              'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/450px-No_image_available.svg.png',
                          name: state.movieDetails.cast?[1].name ?? '',
                          charector: state.movieDetails.cast?[1].characterName ?? '',
                        ),
                        SizedBox(height: height * 0.01),
                        CastCard(
                          image:
                              state.movieDetails.cast?[2].urlSmallImage ??
                              'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/450px-No_image_available.svg.png',
                          name: state.movieDetails.cast?[2].name ?? '',
                          charector: state.movieDetails.cast?[2].characterName ?? '',
                        ),
                        SizedBox(height: height * 0.01),
                        CastCard(
                          image:
                              state.movieDetails.cast?[3].urlSmallImage ??
                              'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/450px-No_image_available.svg.png',
                          name: state.movieDetails.cast?[3].name ?? '',
                          charector: state.movieDetails.cast?[3].characterName ?? '',
                        ),
                        SizedBox(height: height * 0.02),

                        //Genres
                        Text(
                          'Genres',
                          style: AppStyles.robotoBold24White.copyWith(
                            decoration: TextDecoration.none,
                          ),
                        ),
                        SizedBox(height: height * 0.01),

                        GridView.builder(
                          padding: EdgeInsets.only(top: height * 0.01),
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: state.movieDetails.genres!.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 15,
                            crossAxisSpacing: 15,
                            childAspectRatio: 3,
                          ),
                          itemBuilder: (context, index) {
                            return GenresCard(
                              genre: state.movieDetails.genres!,
                              genresIndex: index,
                            );
                          },
                        ),
                        SizedBox(height: height * 0.07),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator(color: AppColors.darkGrey));
          }
        },
      ),
    );
  }
}
