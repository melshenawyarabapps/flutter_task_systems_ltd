import 'package:flutter/material.dart';
import 'package:flutter_task_systems_ltd/core/themes/theme_extensions.dart';
import 'package:flutter_task_systems_ltd/core/utils/app_colors.dart';
import 'package:flutter_task_systems_ltd/core/utils/app_radius.dart';
import 'package:flutter_task_systems_ltd/core/utils/app_styles.dart';
import 'package:flutter_task_systems_ltd/core/utils/font_sizes.dart';

abstract class AppTheme {
  static ThemeData get lightTheme => ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppLightColors.secondaryColor,
    primaryColor: AppLightColors.primaryColor,
    secondaryHeaderColor: AppLightColors.secondaryColor,
    splashColor: AppLightColors.transparent,
    highlightColor: AppLightColors.transparent,
    cardColor: AppLightColors.thirdColor,
    shadowColor: AppLightColors.greyColor,
    hoverColor: AppLightColors.black12Color,
    appBarTheme: AppBarTheme(
      backgroundColor: AppLightColors.primaryColor,
      surfaceTintColor: AppLightColors.secondaryColor,
      centerTitle: true,
      elevation: 0,
      iconTheme: IconThemeData(color: AppLightColors.blackColor),
      titleTextStyle: AppStyles.getBoldStyle(
        color: AppLightColors.blackColor,
        fontSize: FontSizes.s18,
      ),
    ),
    extensions: [
      AppDecorations(
        cardDecoration: BoxDecoration(
          color: AppLightColors.greyColor3,
          borderRadius: AppRadius.all(AppRadius.r16),
          border: Border.all(color: AppLightColors.black10Color),
        ),
        imageDecoration: BoxDecoration(
          borderRadius: AppRadius.all(AppRadius.r12),
          border: Border.all(color: AppLightColors.black10Color),
        ),
        bigCardDecoration: BoxDecoration(
          color: AppLightColors.secondaryColor,
          borderRadius: AppRadius.vertical(AppRadius.r32),
        ),
      ),
      FavoriteColors(
        active: AppLightColors.redColor,
        inactive: AppLightColors.black54Color,
        activeBackground: AppLightColors.redColor10,
        inactiveBackground: AppLightColors.black10Color,
        activeBorder: AppLightColors.black10Color,
        inactiveBorder: AppLightColors.black10Color,
      ),
      ConnectivityColors(
        onlineColor: AppLightColors.greenColor,
        offlineColor: AppLightColors.redColor,
        onlineBackgroundColor: AppLightColors.greenColor.withValues(alpha: 0.2),
        offlineBackgroundColor: AppLightColors.redColor.withValues(alpha: 0.2),
        onlineBorderColor: AppLightColors.greenColor,
        offlineBorderColor: AppLightColors.redColor,
      ),
      ShimmerColors(
        baseColor: AppLightColors.greyColor2,
        highlightColor: AppLightColors.greyColor3,
        placeholderColor: AppLightColors.greyColor2,
        placeholderDecoration: BoxDecoration(
          color: AppLightColors.greyColor2,
          borderRadius: AppRadius.all(AppRadius.r6),
        ),
      ),
    ],
    textTheme: TextTheme(
      bodyLarge: AppStyles.getBoldStyle(
        color: AppLightColors.blackColor,
        fontSize: FontSizes.s14,
      ),
      bodyMedium: AppStyles.getSemiBoldStyle(
        color: AppLightColors.thirdColor,
        fontSize: FontSizes.s14,
      ),
      bodySmall: AppStyles.getMediumStyle(
        color: AppLightColors.black54Color,
        fontSize: FontSizes.s12,
      ),
    ),
    dividerTheme: DividerThemeData(color: AppLightColors.black26Color),
  );

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
        bigCardDecoration: BoxDecoration(
          color: AppDarkColors.secondaryColor,
          borderRadius: AppRadius.vertical(AppRadius.r32),
        ),
      ),
      FavoriteColors(
        active: AppDarkColors.redColor,
        inactive: AppDarkColors.whiteColor,
        activeBackground: AppDarkColors.redColor10,
        inactiveBackground: AppDarkColors.white10Color,
        activeBorder: AppDarkColors.white10Color,
        inactiveBorder: AppDarkColors.white10Color,
      ),
      ConnectivityColors(
        onlineColor: AppDarkColors.greenColor,
        offlineColor: AppDarkColors.redColor,
        onlineBackgroundColor: AppDarkColors.greenColor.withValues(alpha: 0.2),
        offlineBackgroundColor: AppDarkColors.redColor.withValues(alpha: 0.2),
        onlineBorderColor: AppDarkColors.greenColor,
        offlineBorderColor: AppDarkColors.redColor,
      ),
      ShimmerColors(
        baseColor: AppDarkColors.greyColor2,
        highlightColor: AppDarkColors.white10Color,
        placeholderColor: AppDarkColors.white10Color,
        placeholderDecoration: BoxDecoration(
          color: AppDarkColors.white10Color,
          borderRadius: AppRadius.all(AppRadius.r6),
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
    dividerTheme: DividerThemeData(color: AppDarkColors.white24Color),
  );
}
