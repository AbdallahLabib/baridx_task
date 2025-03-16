import 'package:flutter/material.dart';

import '../helpers/themes/colors/app_colors.dart';
import '../helpers/themes/colors/custom_color.dart';

extension BuildContextExtension on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
  ThemeData get theme => Theme.of(this);
  AppColors get colors => AppColors.of(this);
  TextStyle get defaultTextStyle => DefaultTextStyle.of(this).style;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  CustomColorStyle? get customColorStyle => theme.extension<CustomColorStyle>();
  void pop() => Navigator.of(this).pop();

  double get sw => MediaQuery.of(this).size.width;
  double get sh => MediaQuery.of(this).size.height;
}
