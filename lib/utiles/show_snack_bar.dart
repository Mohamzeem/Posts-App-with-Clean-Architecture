import 'package:flutter/material.dart';
import '../core/consts/app_colors.dart';
import '../core/widgets/custom_text_widget.dart';

class ShowSnackBar {
  void showSuccessSnackBar(
      {required BuildContext context, required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: CustomTextWidget(
            text: message,
            color: AppColors.kBlack,
            fontSize: 18,
            fontWeight: FontWeight.w300),
        backgroundColor: AppColors.kGreen,
      ),
    );
  }

  void showErrorSnackBar(
      {required BuildContext context, required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: CustomTextWidget(
            text: message,
            color: AppColors.kBlack,
            fontSize: 18,
            fontWeight: FontWeight.w300),
        backgroundColor: AppColors.kRed,
      ),
    );
  }
}
