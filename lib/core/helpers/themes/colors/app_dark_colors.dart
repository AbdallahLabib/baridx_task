import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppDarkColors extends AppColors {
  @override
  Color get primaryColor => Colors.black;

  @override
  Color get secondaryColor => Colors.white;

  @override
  Color get tertiaryColor => const Color(0xffDE9F00);

  @override
  Color get primaryContainerColor => Colors.grey[800]!;

  @override
  Color get secondaryContainerColor => const Color(0xff656565);

  @override
  Color get selectedContainerColor => Colors.grey[500]!;
  // surface
  @override
  Color get primaryBorderColor => const Color(0xffE1E1E1);
  // outline
  @override
  Color get secondaryBorderColor => const Color(0xff9D9D9D);
  // onSurface
  @override
  Color get selectedBorderColor => const Color(0xff9D9D9D);

  @override
  Color get primaryTextColor => Colors.white;

  @override
  Color get secondaryTextColor => Colors.white;
  // scrim
  @override
  Color get tertiaryTextColor => Colors.white;

  @override
  Color get hintTextColor => Colors.white;

  @override
  Color get primaryIconColor => Colors.white;

  @override
  Color get backgroundColor => Colors.black;

  @override
  Color get scaffoldBackground => const Color(0xff2E2E2E);

  @override
  Color get textFieldFillColor => const Color(0xff2E2E2E);

  @override
  Color get quaternaryColor => Colors.black;

  @override
  Color get tertiaryContainerColor => throw UnimplementedError();
}
