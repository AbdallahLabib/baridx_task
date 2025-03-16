import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_colors_constants.dart';

class AppLightColors extends AppColors {
  @override
  Color get primaryColor => PRIMARY_COLOR;

  @override
  Color get secondaryColor => SECONDARY_COLOR;

  @override
  Color get tertiaryColor => TERTIARY_COLOR;

  @override
  Color get quaternaryColor => QUATERNARY_COLOR;

  @override
  Color get primaryContainerColor => const Color(0xff1A1D36);

  @override
  Color get secondaryContainerColor => const Color(0xff6D758B);

  @override
  Color get tertiaryContainerColor => const Color(0xff162142);

  @override
  Color get selectedContainerColor => const Color(0xffE0F2F1);
  // Same for Light and Dark
  @override
  Color get primaryBorderColor => Colors.white.withOpacity(0.16);
  // outline
  @override
  Color get secondaryBorderColor => const Color(0xff5B617A);
  // onSurface
  @override
  Color get selectedBorderColor => const Color(0xff1C274C).withOpacity(0.2);

  @override
  Color get primaryTextColor => PRIMARY_TEXT_COLOR;

  @override
  Color get secondaryTextColor => SECONDARY_TEXT_COLOR;
  // scrim
  @override
  Color get tertiaryTextColor => TERTIARY_TEXT_COLOR;

  @override
  Color get hintTextColor => const Color(0xffA8A8A8);

  @override
  Color get primaryIconColor => Colors.white;

  @override
  Color get backgroundColor => PRIMARY_COLOR;

  @override
  Color get scaffoldBackground => BACKGROUND_COLOR;

  @override
  Color get textFieldFillColor => BACKGROUND_COLOR;
}
