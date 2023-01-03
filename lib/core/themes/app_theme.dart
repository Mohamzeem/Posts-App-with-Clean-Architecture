import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:posts/core/consts/app_colors.dart';

ThemeData appTheme() => ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.kPrimary,
      centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColors.kWhite,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark),
    ),
    brightness: Brightness.light,
    primaryColor: AppColors.kPrimary,
    colorScheme: const ColorScheme.light(
      primary: AppColors.kPrimary,
    ),
    progressIndicatorTheme:
        const ProgressIndicatorThemeData(color: AppColors.kPrimary),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.kPrimary,
      foregroundColor: AppColors.kSecondry,
    ),
    inputDecorationTheme: InputDecorationTheme(
        floatingLabelStyle: const TextStyle(color: AppColors.kPrimary),
        iconColor: AppColors.kSecondry,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.kSecondry),
          borderRadius: BorderRadius.circular(8),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.kPrimary),
          borderRadius: BorderRadius.circular(8),
        )));
