import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final TextAlign textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final double height;
  final String? fontFamily;
  final double? fontSize;
  final Color? textColor;
  final FontWeight? fontWeight;
  final TextDecoration? decoration;

  const AppText({
    required this.text,
    this.textAlign = TextAlign.start,
    this.maxLines,
    this.overflow,
    this.textStyle,
    this.height = 1,
    this.fontFamily,
    this.fontSize = 16,
    this.textColor = Colors.white,
    this.fontWeight,
    this.decoration,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      key: key,
      overflow: overflow,
      style: textStyle ??
          TextStyle(
              height: height,
              fontFamily: fontFamily ?? 'Poppins',
              fontSize: fontSize,
              color: textColor,
              fontWeight: fontWeight,
              decoration: decoration),
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}
