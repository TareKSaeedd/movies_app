import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/constants/app_assets.dart';
import 'package:movies_app/core/constants/app_colors.dart';
import 'package:movies_app/core/constants/app_styles.dart';

class CastCard extends StatelessWidget {
  String image;
  String charector;
  String name;
  CastCard({super.key, required this.image, required this.name, required this.charector});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: width * 0.02, vertical: height * 0.01),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.darkGreyColor,
      ),
      child: Row(
        children: [
          CachedNetworkImage(imageUrl: image, width: 60, height: 60),
          SizedBox(width: width * 0.02),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Name : $name',
                  style: AppStyles.robotoRegular20White.copyWith(decoration: TextDecoration.none),
                ),
                SizedBox(height: height * 0.01),
                Text(
                  'Character : $charector',
                  style: AppStyles.robotoRegular20White.copyWith(decoration: TextDecoration.none),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
