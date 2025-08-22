import 'package:flutter/material.dart';
import 'package:movies_app/core/constants/app_colors.dart';
import 'package:movies_app/core/constants/app_styles.dart';

class DialogUtils {
  static void showLoading({required BuildContext context, required String loadingText}) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Row(
            children: [
              CircularProgressIndicator(color: AppColors.yellowColor),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(loadingText, style: AppStyles.robotoMedium16White),
              ),
            ],
          ),
        );
      },
    );
  }

  static void hideLoading({required BuildContext context}) {
    Navigator.pop(context);
  }

  static void showMessage({
    required BuildContext context,
    required String contentMsg,
    String? title,
    String? posActionName,
    String? negActionName,
    Function? posActionFunction,
    Function? negActionFunction,
    bool barrierDismissible = true,
    TextStyle? contentStyle,
  }) {
    List<Widget> actions = [];
    if (posActionName != null) {
      actions.add(
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            posActionFunction?.call();
          },
          child: Text(posActionName, style: contentStyle ?? AppStyles.robotoMedium16White),
        ),
      );
    }

    if (negActionName != null) {
      actions.add(
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            negActionFunction?.call();
          },
          child: Text(negActionName, style: contentStyle ?? AppStyles.robotoMedium16White),
        ),
      );
    }
    showDialog(
      barrierDismissible: barrierDismissible,
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(contentMsg, style: contentStyle ?? AppStyles.robotoMedium16White),
          title: Text(title ?? '', style: contentStyle ?? AppStyles.robotoMedium16White),
          actions: actions,
        );
      },
    );
  }
}
