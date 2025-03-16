import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension SizeBoxExtension on num {
  Widget get widthBox => SizedBox(width: toDouble().w);

  Widget get heightBox => SizedBox(height: toDouble().h);
}
