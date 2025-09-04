import 'package:flutter/material.dart';

import '../../../../../../../core/constants/app_assets.dart';
import '../../../../../../../core/constants/app_colors.dart';
import '../../../../../../../core/constants/app_styles.dart';

class InfoItem extends StatelessWidget {
  final String iconPath;
  final String value;

  InfoItem({super.key , required this.iconPath, required this.value});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return  Container(
      padding: EdgeInsets.symmetric(horizontal: width*0.05, vertical: height*0.01),
      decoration: BoxDecoration(
        color: AppColors.darkGreyColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Image.asset(iconPath),
          SizedBox(width: width*0.05),
          Text(
            value,
            style: AppStyles.robotoBold24White,
          ),
        ],
      ),
    );
  }
}
