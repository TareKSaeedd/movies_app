import 'package:flutter/material.dart';
import 'package:movies_app/core/constants/app_colors.dart';
import 'package:movies_app/core/constants/app_styles.dart';

typedef OnValidator = String? Function(String?)?;

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    super.key,
    this.colorBorderSide = AppColors.darkGreyColor,
    this.cursorColor,
    this.hintText,
    this.fillColor = AppColors.darkGreyColor,
    this.hintStyle,
    this.labelText,
    this.labelStyle,
    this.prefixIcon,
    this.sufficIcon,
    required this.controller,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.obscuringCharacter = '•',
    this.maxLines = 1,
  });
  Color colorBorderSide;
  Color? cursorColor;
  String? hintText;
  String? labelText;
  TextStyle? hintStyle;
  TextStyle? labelStyle;
  Widget? prefixIcon;
  Widget? sufficIcon;
  TextEditingController controller;
  OnValidator? validator;
  TextInputType? keyboardType;
  bool obscureText;
  String obscuringCharacter;
  int maxLines;
  Color? fillColor;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.darkGreyColor,
        enabledBorder: builtOutlinedInputBorder(colorBorderSide: colorBorderSide),
        focusedBorder: builtOutlinedInputBorder(colorBorderSide: colorBorderSide),
        errorBorder: builtOutlinedInputBorder(colorBorderSide: AppColors.redColor),
        focusedErrorBorder: builtOutlinedInputBorder(colorBorderSide: AppColors.redColor),
        hintText: hintText,
        hintStyle: hintStyle ?? AppStyles.robotoRegular16White,
        labelText: labelText,
        labelStyle: labelStyle ?? AppStyles.robotoRegular16White,
        prefixIcon: prefixIcon,
        suffixIcon: sufficIcon,
        errorStyle: AppStyles.robotoRegular16White.copyWith(color: AppColors.redColor),
      ),
      style: hintStyle,
      cursorColor: cursorColor,
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      obscureText: obscureText,
      obscuringCharacter: obscuringCharacter,
      maxLines: maxLines,
    );
  }

  OutlineInputBorder builtOutlinedInputBorder({required Color colorBorderSide}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: colorBorderSide, width: 1),
    );
  }
}
