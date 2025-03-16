// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

const Color PRIMARY_COLOR = Color(0xFF0C193D);
const Color SECONDARY_COLOR = Color(0xFF21A0FF);
const Color TERTIARY_COLOR = Color(0xFFEEC222);
const Color QUATERNARY_COLOR = Color(0xFF14234B);
const Color PRIMARY_TEXT_COLOR = Colors.white;
const Color SECONDARY_TEXT_COLOR = Colors.black;
const Color TERTIARY_TEXT_COLOR = Color(0xff93A3B0);
const Color SECONDARY_CONTAINER_COLOR = Color(0xff6D758B);
const Color PRIMARY_BORDER_COLOR = Color(0xff333E5C);
const Color SECONDARY_LIGHT_COLOR = Color(0xFF484849);
const Color SECONDARY_DARK_COLOR = Colors.white;
const Color TERTIARY_LIGHT_COLOR = Color(0xffFBCE39);
const Color TERTIARY_DARK_COLOR = Color(0xffDE9F00);
const Color BACKGROUND_COLOR = Colors.white;
const Color DELETE_COLOR = Color(0xFFE98371);
const Color RED_TEXT = Color(0xffF84747);
const Color RED_ERROR_COLOR = Color(0xFFFF5542);
const Color BROWN_CONTAINER_BACKGROUND = Color(0xff9C927B);
const Color Blue_CONTAINER_BACKGROUND = Color(0xff1881F9);

const Color PRIMARY_LIGHT_TEXT_COLOR = Colors.black;
const Color SECONDARY_LIGHT_TEXT_COLOR = Color(0xffCBCEDD);
const Color PRIMARY_DARK_TEXT_COLOR = Colors.white;

// Gradients
const LinearGradient app_yellow_gradient = LinearGradient(
  colors: [TERTIARY_DARK_COLOR, TERTIARY_COLOR],
  begin: Alignment.bottomRight,
  end: Alignment.bottomLeft,
);
const LinearGradient store_blue_gradient = LinearGradient(
  colors: [Color(0xff1D8CFF), Color(0xff28BCFF)],
  begin: Alignment.bottomLeft,
  end: Alignment.bottomRight,
);
const LinearGradient store_green_yellow_gradient = LinearGradient(
  colors: [Color(0xffF3A600), Color(0xff28FFFF)],
  begin: Alignment.bottomLeft,
  end: Alignment.bottomRight,
  stops: [
    0,
    1,
  ],
);
const LinearGradient store_blue_purple_gradient = LinearGradient(
  colors: [Color(0xffBF1DFF), Color(0xff28BFFF)],
  begin: Alignment.bottomLeft,
  end: Alignment.bottomRight,
  stops: [
    0,
    1,
  ],
);

const BoxShadow YELLOW_SHADOW = BoxShadow(
  offset: Offset(0, 0),
  spreadRadius: 0,
  blurRadius: 16,
  color: TERTIARY_COLOR,
);
const BoxShadow BLUE_SHADOW = BoxShadow(
  color: Color(0xFF257ACA), // Shadow color
  blurRadius: 16, // Match Figma's 16px blur
  spreadRadius: 0, // No spread
  offset: Offset(0, 0), // No offset for this shadow
);
