import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/features/my_app/cubit/app_cubit.dart';
import 'app_dark_colors.dart';
import 'app_light_colors.dart';

abstract class AppColors {
  // These are 2 objects that define the specific color palettes for dark and light themes.
  // These two classes extends AppColors
  static final AppDarkColors _dark = AppDarkColors();
  static final AppLightColors _light = AppLightColors();

  // These are colors that doesn't depend on theme
  static const Color snackBarRedError = Color(0xffBF1C00);
  static const Color primary10 = Color(0xffEBF6F9);
  static const Color primary50 = Color(0xffE8F0FE);
  static const Color primary500 = Color(0xFF448BA2);
  static const Color primary700 = Color(0xFF306272);
  static const Color secondary800 = Color(0xFF73112F);
  static const Color borderColor = Color(0xFFCCCCCC);

  // This for the BuildContext
  static AppColors of(BuildContext context) =>
      context.read<AppCubit>().state.themeData == ThemeMode.dark ? _dark : _light;

// These abstract color properties define the various color options that must be implemented in AppDarkColors and AppLightColors. Each concrete class (AppDarkColors and AppLightColors) will provide specific values for these colors based on the current theme.
  Color get primaryColor;
  Color get secondaryColor;
  Color get tertiaryColor;
  Color get quaternaryColor;
  Color get primaryTextColor;
  Color get secondaryTextColor;
  Color get tertiaryTextColor;
  Color get primaryContainerColor;
  Color get secondaryContainerColor;
  Color get tertiaryContainerColor;
  Color get selectedContainerColor;
  Color get primaryBorderColor;
  Color get secondaryBorderColor;
  Color get selectedBorderColor;
  Color get primaryIconColor;
  Color get textFieldFillColor;
  Color get hintTextColor;
  Color get backgroundColor;
  Color get scaffoldBackground;
}
