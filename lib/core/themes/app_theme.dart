import 'package:flutter/material.dart';
import 'package:flutter_task_systems_ltd/core/utils/app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme => ThemeData();

  static ThemeData get darkTheme => ThemeData(
    scaffoldBackgroundColor: AppDarkColors.secondaryColor,
    primaryColor: AppDarkColors.primaryColor,
    secondaryHeaderColor: AppDarkColors.secondaryColor,
    splashColor: AppDarkColors.transparent,
    highlightColor: AppDarkColors.transparent,
    cardColor: AppDarkColors.thirdColor,
    shadowColor: AppDarkColors.greyColor,
    hoverColor: AppDarkColors.black12Color,
    textTheme: const TextTheme(),
  );
}
