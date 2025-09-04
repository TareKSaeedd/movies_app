import 'package:flutter/material.dart';
import 'package:movies_app/core/constants/app_colors.dart';
import 'package:movies_app/core/constants/app_styles.dart';

class GenresCard extends StatelessWidget {
  String genre;
   GenresCard({super.key, required this.genre});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.01,
      width: width * 0.12,
      
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.darkGreyColor
      ),
      child: Center(
        child: Text(genre , style: AppStyles.robotoRegular16White.copyWith(
          decoration: TextDecoration.none
        ),),
      ),
    );
  }
}