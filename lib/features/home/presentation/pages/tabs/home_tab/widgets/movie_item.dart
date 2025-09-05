import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/navigation/app_routes.dart';
import '../../../../../../../../../../../core/constants/app_colors.dart';
import '../../../../../data/model/movie_response.dart';
import '../home_tab.dart';

class MovieItem extends StatelessWidget {
  MovieItem({
    super.key,
    this.controller,
    required this.itemCount,
    required this.moviesList,
    required this.width,
    required this.height,
  });
  ScrollController? controller;
  final int itemCount;
  final double width;
  final double height;
  final List<Movies?> moviesList;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: width * 0.03),
      child: SizedBox(
        height: height * 0.23,
        child: ListView.separated(
          controller: controller,
          scrollDirection: Axis.horizontal,
          itemCount: itemCount,
          separatorBuilder: (context, index) {
            return SizedBox(width: width * 0.03);
          },
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(
                  context,
                ).pushNamed(AppRoutes.detailsScreenPageRouteName, arguments: moviesList[index]!.id);
              },
              child: Container(
                width: width * 0.33,
                height: height * 0.51,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: CachedNetworkImage(
                        imageUrl: moviesList[index]!.mediumCoverImage ?? '',
                        width: width,
                        height: height,
                        fit: BoxFit.fill,
                        placeholder: (context, url) => Center(
                          child: CircularProgressIndicator(color: AppColors.darkGreyColor),
                        ),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                    Positioned(
                      top: height * 0.01,
                      left: width * 0.01,
                      child: generateRatingWidget(
                        width,
                        height,
                        moviesList[index]!.rating.toString(),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
