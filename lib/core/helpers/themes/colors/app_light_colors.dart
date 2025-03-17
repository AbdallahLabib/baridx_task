import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppLightColors extends AppColors {
  @override
  Color get primaryColor => Colors.white;

  @override
  Color get secondaryColor => const Color(0xFF21A0FF);

  @override
  Color get tertiaryColor => const Color(0xFFEEC222);

  @override
  Color get quaternaryColor => const Color(0xFF14234B);

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
  Color get primaryTextColor => Colors.white;

  @override
  Color get secondaryTextColor => Colors.black;
  // scrim
  @override
  Color get tertiaryTextColor => const Color(0xff93A3B0);

  @override
  Color get hintTextColor => const Color(0xffA8A8A8);

  @override
  Color get primaryIconColor => Colors.white;

  @override
  Color get backgroundColor => const Color(0xFF0C193D);

  @override
  Color get scaffoldBackground => Colors.white;

  @override
  Color get textFieldFillColor => Colors.white;
}
