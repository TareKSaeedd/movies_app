import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/constants/app_colors.dart';
import 'package:movies_app/features/home/data/model/movie_response.dart';

class MovieCard extends StatelessWidget {
  final Movies movie;

  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    var sizeScreen = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: movie.largeCoverImage ?? '',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
            placeholder: (context, url) => Center(
              child: CircularProgressIndicator(color: AppColors.yellowColor),
            ),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),

          Positioned(
            top: sizeScreen.height * 0.01,
            left: sizeScreen.width * 0.02,
            child: Container(
              padding:  EdgeInsets.symmetric(
                horizontal: sizeScreen.width * 0.015,
                 vertical: sizeScreen.height * 0.005),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Text(
                    movie.rating?.toString() ?? "0.0",
                    style: const TextStyle(color: Colors.white, fontSize: 12),
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
  }
}
