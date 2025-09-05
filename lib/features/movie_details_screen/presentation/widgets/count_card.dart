import 'package:flutter/material.dart';
import 'package:movies_app/core/constants/app_colors.dart';
import 'package:movies_app/core/constants/app_styles.dart';

class CountCard extends StatelessWidget {
  String icon;
  String text;
   CountCard({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      width: width * 0.295,
      height: height * 0.045,
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.02,
        vertical: height * 0.01
      ),
      decoration: BoxDecoration(
        color: AppColors.darkGreyColor,
        borderRadius: BorderRadius.circular(15),

      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(icon,width: width * 0.06,),
          SizedBox(width: width * 0.035,),
          Text(text,style: AppStyles.robotoBold20White.copyWith(
                        decoration: TextDecoration.none
                      ),)
        ],
      ),
    );
  }
}