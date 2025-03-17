import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common_widgets/app_size_boxes.dart';
import '../../../common_widgets/app_svg_image.dart';
import '../../../extensions/context_extensions.dart';

import '../../../common_widgets/app_button.dart';
import '../../../common_widgets/app_text.dart';

class ErrorDialog extends StatelessWidget {
  const ErrorDialog({required this.message, this.onTap, super.key});
  final String message;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        height: 400.h,
        decoration:
            BoxDecoration(color: const Color.fromARGB(255, 21, 30, 38), borderRadius: BorderRadius.circular(20.r)),
        padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 10.sp),
        child: Column(
          children: [
            20.heightBox,
            AppText(
              text: "",
              textStyle: TextStyle(
                color: Colors.white,
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Divider(color: Color(0xff3A3B3C)),
            30.heightBox,
            const AppSVGImage(image: "assets/warning.svg"),
            30.heightBox,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.w),
              child: AppText(
                text: message,
                textStyle: TextStyle(
                  color: const Color(0xffCBCEDD),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
                maxLines: 3,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            40.heightBox,
            AppButton(
              width: 100.w,
              height: 38.h,
              borderRadius: 40.r,
              onTap: onTap ?? context.pop,
              padding: EdgeInsets.zero,
              text: 'OK',
              type: ButtonType.active,
              buttonColor: const Color(0xFF0C193D),
              borderColor: const Color(0xFF0C193D),
              textStyle: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w700, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
