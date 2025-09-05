import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ScreenShotsWidget extends StatelessWidget {
  String screenShot;
  ScreenShotsWidget({super.key, required this.screenShot});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadiusGeometry.circular(16),
      child: CachedNetworkImage(imageUrl: screenShot),
    );
  }
}

//borderRadius: BorderRadiusGeometry.circular(16),
