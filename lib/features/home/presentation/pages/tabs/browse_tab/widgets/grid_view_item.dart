import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'rating_widget.dart';

class GridViewItem extends StatelessWidget {
  final String imageUrl;
  final String rateValue;
  const GridViewItem({
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
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            height: height * 0.29,
            width: width * 0.45,
            fit: BoxFit.fill,
            placeholder: (context, url) =>
            const Center(
              child: CircularProgressIndicator(),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
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

