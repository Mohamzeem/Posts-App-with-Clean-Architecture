import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:posts/core/consts/app_colors.dart';
import '../../../../../core/widgets/custom_text_widget.dart';

class ErrorMessageWidget extends StatelessWidget {
  const ErrorMessageWidget({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return CustomTextWidget(
        text: message,
        color: AppColors.kPrimary,
        fontSize: 18,
        fontWeight: FontWeight.w300);
  }
}
