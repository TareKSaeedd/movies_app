import 'package:flutter/material.dart';
import '../../../../../core/constants/app_styles.dart';

class TwoTextsRow extends StatelessWidget {
  String text1;
  String text2;

   TwoTextsRow({super.key,required this.text1,required this.text2});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text1,style: AppStyles.robotoRegular14White,),
        InkWell(
            onTap: () {
              //navigate to login screen
            },
            child: Text(text2,style: AppStyles.robotoBlack14Yellow,))
      ],
    );
  }
}
