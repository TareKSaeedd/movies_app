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
          child: Image.asset(
            imageUrl,
            height: height * 0.29,
            width: width * 0.45,
            fit: BoxFit.fill,
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
