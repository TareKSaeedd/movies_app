import 'package:flutter/material.dart';
import 'package:movies_app/core/constants/app_colors.dart';
import 'package:movies_app/core/constants/app_styles.dart';

AppBar buildCustomAppBar({required title,required void Function()? onTap}){
  return AppBar(
    backgroundColor: AppColors.blackColor,
      title: Text(title,style: AppStyles.robotoRegular16Yellow,),
      centerTitle: true,
      leading: InkWell(
          onTap: onTap,
          child: Icon(Icons.arrow_back,color: AppColors.yellowColor,size: 21,)),

    );
}