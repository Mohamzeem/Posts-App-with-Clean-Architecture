import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:posts/core/consts/app_colors.dart';

ThemeData appTheme() => ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.kBackGround,
      centerTitle: true,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColors.kBackGround,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark),
    ),
    scaffoldBackgroundColor: AppColors.kBackGround,
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
