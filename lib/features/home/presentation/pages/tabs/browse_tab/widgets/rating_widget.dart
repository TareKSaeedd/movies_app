import 'package:flutter/material.dart';

import '../../../../../../../core/constants/app_colors.dart';
import '../../../../../../../core/constants/app_styles.dart';

class RatingWidget extends StatelessWidget {
  final String rateValue;
  const RatingWidget({super.key, required this.rateValue});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: width * 0.02, vertical: height * 0.001),
      decoration: BoxDecoration(
        color: AppColors.darkGreyColor.withValues(alpha: 0.7),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(rateValue, style: AppStyles.robotoRegular16White),
          SizedBox(width: width * 0.01),
          Icon(Icons.star, color: AppColors.yellowColor),
        ],
      ),
    );
  }
}
