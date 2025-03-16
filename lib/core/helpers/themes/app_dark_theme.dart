import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_theme.dart';
import 'colors/app_colors.dart';
import 'colors/app_colors_constants.dart';
import 'colors/app_dark_colors.dart';

class AppDarkTheme extends AppTheme {
  final AppColors _colorsDark = AppDarkColors();

  @override
  ThemeData get theme => ThemeData(
        useMaterial3: false,
        fontFamily: AppTheme.fontFamily,
        colorScheme: colorScheme,
        textTheme: textTheme,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: _colorsDark.scaffoldBackground,
      );

  @override
  ColorScheme get colorScheme => ColorScheme(
        primary: _colorsDark.primaryColor,
        onPrimary: _colorsDark.secondaryTextColor,
        secondary: _colorsDark.secondaryColor,
        onSecondary: _colorsDark.primaryIconColor,
        error: AppColors.snackBarRedError,
        onError: AppColors.snackBarGreenSuccess,
        surface: _colorsDark.primaryBorderColor,
        onSurface: _colorsDark.selectedBorderColor,
        tertiary: _colorsDark.tertiaryColor,
        onTertiary: _colorsDark.textFieldFillColor,
        primaryContainer: _colorsDark.primaryContainerColor,
        secondaryContainer: _colorsDark.secondaryContainerColor,
        tertiaryContainer: _colorsDark.selectedContainerColor,
        outline: _colorsDark.secondaryBorderColor,
        inversePrimary: _colorsDark.primaryTextColor,
        onSurfaceVariant: _colorsDark.hintTextColor,
        scrim: _colorsDark.tertiaryTextColor,
        brightness: Brightness.dark,
      );

  @override
  TextTheme get textTheme => TextTheme(
        displaySmall: TextStyle(fontSize: 35.sp, fontWeight: FontWeight.w600, color: PRIMARY_DARK_TEXT_COLOR),
        headlineLarge: TextStyle(fontSize: 33.sp, fontWeight: FontWeight.w700, color: PRIMARY_DARK_TEXT_COLOR),
        headlineMedium: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.w400, color: PRIMARY_DARK_TEXT_COLOR),
        headlineSmall: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w400, color: PRIMARY_DARK_TEXT_COLOR),
        titleLarge: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w600, color: PRIMARY_DARK_TEXT_COLOR),
        titleMedium: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500, color: PRIMARY_DARK_TEXT_COLOR),
        titleSmall: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w400, color: PRIMARY_DARK_TEXT_COLOR),
        labelLarge: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500, color: PRIMARY_DARK_TEXT_COLOR),
        labelMedium: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w400, color: PRIMARY_DARK_TEXT_COLOR),
        labelSmall: TextStyle(fontSize: 9.sp, fontWeight: FontWeight.w300, color: PRIMARY_DARK_TEXT_COLOR),
        bodyLarge: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600, color: PRIMARY_DARK_TEXT_COLOR),
        bodyMedium: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500, color: PRIMARY_DARK_TEXT_COLOR),
        bodySmall: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400, color: PRIMARY_DARK_TEXT_COLOR),
      );
}
