import 'package:flutter/material.dart';

class CustomColorStyle extends ThemeExtension<CustomColorStyle> {
  Color? primary;
  Color? secondary;
  Color? secondaryLight;
  Color? tertiary;
  Color? quaternary;
  Color? greenLight;
  Color? reedLight;
  Color? gray;
  Color? grayTwo;
  Color? disabled;
  Color? soft;
  Color? star;
  Color? success;
  Color? error;
  Color? border;
  Color? white;


  CustomColorStyle({
    required this.primary,
    required this.secondary,
    required this.secondaryLight,
    required this.tertiary,
    required this.quaternary,
    required this.greenLight,
    required this.reedLight,
    required this.gray,
    required this.grayTwo,
    required this.disabled,
    required this.soft,
    required this.star,
    required this.success,
    required this.error,
    required this.border,
    required this.white,
  });

  @override
  CustomColorStyle copyWith() {
    return CustomColorStyle(
      primary: primary,
      secondary: secondary,
      secondaryLight: secondaryLight,
      tertiary: tertiary,
      quaternary: quaternary,
      greenLight: greenLight,
      reedLight: reedLight,
      gray: gray,
      grayTwo: grayTwo,
      disabled: disabled,
      soft: soft,
      star: star,
      success: success,
      error: error,
      border: border,
      white: white
    );
  }

  @override
  CustomColorStyle lerp(
    covariant ThemeExtension<CustomColorStyle>? other,
    double t,
  ) {
    if (other == null) return this;

    if (other is CustomColorStyle) {
      return CustomColorStyle(
        primary: Color.lerp(primary, other.primary, t),
        secondary: Color.lerp(primary, other.secondary, t),
        secondaryLight: Color.lerp(primary, other.secondaryLight, t),
        tertiary: Color.lerp(tertiary, other.tertiary, t),
        quaternary: Color.lerp(quaternary, other.quaternary, t),
        greenLight: Color.lerp(greenLight, other.greenLight, t),
        reedLight: Color.lerp(reedLight, other.reedLight, t),
        gray: Color.lerp(gray, other.gray, t),
        grayTwo: Color.lerp(grayTwo, other.grayTwo, t),
        disabled: Color.lerp(disabled, other.disabled, t),
        soft: Color.lerp(soft, other.soft, t),
        star: Color.lerp(star, other.star, t),
        success: Color.lerp(success, other.success, t),
        error: Color.lerp(error, other.error, t),
        border: Color.lerp(border, other.border, t),
        white: white,
      );
    }

    return this;
  }
}
