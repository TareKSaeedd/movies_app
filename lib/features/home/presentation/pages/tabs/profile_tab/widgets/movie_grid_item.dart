import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'rating_widget.dart';

class MovieGridItem extends StatelessWidget {
  final String imageUrl;
  final String rateValue;
  const MovieGridItem({
    super.key,
    required this.imageUrl,
    required this.rateValue,
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child:  CachedNetworkImage(
            imageUrl: imageUrl,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
            placeholder: (context, url) => Container(
              color: Colors.grey.shade800,
            ),
            errorWidget: (context, url, error) => Container(
              color: Colors.grey.shade900,
              child: const Icon(Icons.broken_image, color: Colors.white),
            ),
          ),
        ),
        Positioned(
          top: height * 0.01,
          left: width * 0.02,
          child: RatingWidget(rateValue: rateValue),
        ),
      ],
    );
  }
}
