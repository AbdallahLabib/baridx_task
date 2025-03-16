import 'package:flutter/material.dart';

class DialogPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.3588746, size.height * 0.07272522);
    path_0.cubicTo(
        size.width * 0.3439329, size.height * 0.03988139, size.width * 0.3364606, size.height * 0.02345939, size.width * 0.3322099, size.height * 0.01777309);
    path_0.cubicTo(size.width * 0.3245452, size.height * 0.007525261, size.width * 0.3223090, size.height * 0.005758261, size.width * 0.3123207,
        size.height * 0.002054926);
    path_0.cubicTo(size.width * 0.3067784, size.height * 4.102998e-18, size.width * 0.2987697, size.height * 4.102998e-18, size.width * 0.2827496,
        size.height * 4.102998e-18);
    path_0.lineTo(size.width * 0.08746356, size.height * 4.102998e-18);
    path_0.cubicTo(size.width * 0.06029504, size.height * 4.102998e-18, size.width * 0.04671079, size.height * 4.102998e-18, size.width * 0.03599504,
        size.height * 0.006619174);
    path_0.cubicTo(size.width * 0.02170778, size.height * 0.01544474, size.width * 0.01035653, size.height * 0.03237291, size.width * 0.004438513,
        size.height * 0.05367957);
    path_0.cubicTo(size.width * -3.236802e-18, size.height * 0.06966000, size.width * -3.236802e-18, size.height * 0.08991826, size.width * -3.236802e-18,
        size.height * 0.1304348);
    path_0.lineTo(size.width * -3.236802e-18, size.height * 0.8695652);
    path_0.cubicTo(size.width * -3.236802e-18, size.height * 0.9100826, size.width * -3.236802e-18, size.height * 0.9303391, size.width * 0.004438513,
        size.height * 0.9463217);
    path_0.cubicTo(
        size.width * 0.01035653, size.height * 0.9676261, size.width * 0.02170778, size.height * 0.9845565, size.width * 0.03599504, size.height * 0.9933826);
    path_0.cubicTo(size.width * 0.04671079, size.height, size.width * 0.06029504, size.height, size.width * 0.08746356, size.height);
    path_0.lineTo(size.width * 0.9125364, size.height);
    path_0.cubicTo(size.width * 0.9397055, size.height, size.width * 0.9532886, size.height, size.width * 0.9640058, size.height * 0.9933826);
    path_0.cubicTo(
        size.width * 0.9782915, size.height * 0.9845565, size.width * 0.9896443, size.height * 0.9676261, size.width * 0.9955627, size.height * 0.9463217);
    path_0.cubicTo(size.width, size.height * 0.9303391, size.width, size.height * 0.9100826, size.width, size.height * 0.8695652);
    path_0.lineTo(size.width, size.height * 0.1304348);
    path_0.cubicTo(size.width, size.height * 0.08991826, size.width, size.height * 0.06966000, size.width * 0.9955627, size.height * 0.05367957);
    path_0.cubicTo(
        size.width * 0.9896443, size.height * 0.03237291, size.width * 0.9782915, size.height * 0.01544474, size.width * 0.9640058, size.height * 0.006619174);
    path_0.cubicTo(size.width * 0.9532886, size.height * -4.827057e-18, size.width * 0.9397055, size.height * -4.827057e-18, size.width * 0.9125364,
        size.height * -4.827057e-18);
    path_0.lineTo(size.width * 0.7142653, size.height * -4.827057e-18);
    path_0.cubicTo(size.width * 0.6982449, size.height * -4.827057e-18, size.width * 0.6902362, size.height * -4.827057e-18, size.width * 0.6846939,
        size.height * 0.002054926);
    path_0.cubicTo(
        size.width * 0.6747055, size.height * 0.005758261, size.width * 0.6724694, size.height * 0.007525261, size.width * 0.6648047, size.height * 0.01777309);
    path_0.cubicTo(
        size.width * 0.6605539, size.height * 0.02345939, size.width * 0.6530816, size.height * 0.03988139, size.width * 0.6381399, size.height * 0.07272522);
    path_0.cubicTo(
        size.width * 0.6082391, size.height * 0.1384478, size.width * 0.5568659, size.height * 0.1818143, size.width * 0.4985073, size.height * 0.1818143);
    path_0.cubicTo(
        size.width * 0.4401487, size.height * 0.1818143, size.width * 0.3887755, size.height * 0.1384478, size.width * 0.3588746, size.height * 0.07272522);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = const Color(0xffffffff).withOpacity(1.0);
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
