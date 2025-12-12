import 'package:flutter/material.dart';
import 'package:flutter_task_systems_ltd/core/themes/theme_extensions.dart';
import 'package:flutter_task_systems_ltd/core/utils/app_colors.dart';
import 'package:flutter_task_systems_ltd/core/utils/app_radius.dart';
import 'package:flutter_task_systems_ltd/core/utils/app_styles.dart';
import 'package:flutter_task_systems_ltd/core/utils/font_sizes.dart';

abstract class AppTheme {
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
    appBarTheme: AppBarTheme(
      backgroundColor: AppDarkColors.primaryColor,
      surfaceTintColor: AppDarkColors.secondaryColor,
      centerTitle: true,
      elevation: 0,
      iconTheme: IconThemeData(color: AppDarkColors.whiteColor),
      titleTextStyle: AppStyles.getBoldStyle(
        color: AppDarkColors.whiteColor,
        fontSize: FontSizes.s18,
      ),
    ),
    extensions: [
      AppDecorations(
        cardDecoration: BoxDecoration(
          color: AppDarkColors.greyColor2,
          borderRadius: AppRadius.all(AppRadius.r16),
          border: Border.all(color: AppDarkColors.white10Color),
        ),
        imageDecoration: BoxDecoration(
          borderRadius: AppRadius.all(AppRadius.r12),
          border: Border.all(color: AppDarkColors.white10Color),
        ),
      ),
    ],
    textTheme: TextTheme(
      bodyLarge: AppStyles.getBoldStyle(
        color: AppDarkColors.whiteColor,
        fontSize: FontSizes.s14,
      ),
      bodyMedium: AppStyles.getSemiBoldStyle(
        color: AppDarkColors.thirdColor,
        fontSize: FontSizes.s14,
      ),
      bodySmall: AppStyles.getMediumStyle(
        color: AppDarkColors.white60Color,
        fontSize: FontSizes.s12,
      ),
    ),
  );
}
