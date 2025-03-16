import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_theme.dart';
import 'colors/app_colors.dart';
import 'colors/app_colors_constants.dart';
import 'colors/app_light_colors.dart';

class AppLightTheme extends AppTheme {
  final AppColors _colorsLight = AppLightColors();

  @override
  ThemeData get theme => ThemeData(
      useMaterial3: false,
      fontFamily: AppTheme.fontFamily,
      colorScheme: colorScheme,
      textTheme: textTheme,
      brightness: Brightness.light,
      scaffoldBackgroundColor: _colorsLight.scaffoldBackground);

  @override
  ColorScheme get colorScheme => ColorScheme(
        primary: _colorsLight.primaryColor,
        onPrimary: _colorsLight.secondaryTextColor,
        secondary: _colorsLight.secondaryColor,
        onSecondary: _colorsLight.primaryIconColor,
        error: AppColors.snackBarRedError,
        onError: AppColors.snackBarGreenSuccess,
        surface: _colorsLight.primaryBorderColor,
        onSurface: _colorsLight.selectedBorderColor,
        tertiary: _colorsLight.tertiaryColor,
        onTertiary: _colorsLight.textFieldFillColor,
        primaryContainer: _colorsLight.primaryContainerColor,
        secondaryContainer: _colorsLight.secondaryContainerColor,
        tertiaryContainer: _colorsLight.selectedContainerColor,
        outline: _colorsLight.secondaryBorderColor,
        inversePrimary: _colorsLight.primaryTextColor,
        onSurfaceVariant: _colorsLight.hintTextColor,
        scrim: _colorsLight.tertiaryTextColor,
        brightness: Brightness.light,
      );

  @override
  TextTheme get textTheme => TextTheme(
        displaySmall: TextStyle(fontSize: 35.sp, fontWeight: FontWeight.w600, color: PRIMARY_TEXT_COLOR),
        headlineLarge: TextStyle(fontSize: 33.sp, fontWeight: FontWeight.w700, color: PRIMARY_TEXT_COLOR),
        headlineMedium: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.w400, color: PRIMARY_TEXT_COLOR),
        headlineSmall: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w700, color: PRIMARY_TEXT_COLOR),
        titleLarge: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w600, color: PRIMARY_TEXT_COLOR),
        titleMedium: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500, color: PRIMARY_TEXT_COLOR),
        titleSmall: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w400, color: PRIMARY_TEXT_COLOR),
        labelLarge: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500, color: PRIMARY_TEXT_COLOR),
        labelMedium: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w400, color: PRIMARY_TEXT_COLOR),
        labelSmall: TextStyle(fontSize: 9.sp, fontWeight: FontWeight.w300, color: PRIMARY_TEXT_COLOR),
        bodyLarge: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600, color: PRIMARY_TEXT_COLOR),
        bodyMedium: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500, color: PRIMARY_TEXT_COLOR),
        bodySmall: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400, color: PRIMARY_TEXT_COLOR),
      );
}
