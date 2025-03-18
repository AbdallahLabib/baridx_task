import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/core/extensions/context_extensions.dart';
import '/core/common_widgets/app_size_boxes.dart';
import '../../../common_widgets/app_button.dart';
import '../../../common_widgets/app_text.dart';
import 'dialog_model.dart';

class AppDialog extends StatelessWidget {
  const AppDialog({required this.dialogModel, super.key});
  final DialogModel dialogModel;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
        child: SizedBox(
          height: 300.h + MediaQuery.of(context).systemGestureInsets.bottom,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 50.h),
                child: Container(
                  height: 220.h,
                  width: 330.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30.r),
                    border: Border.all(color: Colors.white, width: 2.sp),
                  ),
                  child: _buildBody(context),
                ),
              ),
              dialogModel.topImage ?? const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: dialogModel.padding ?? const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          dialogModel.body ??
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  40.heightBox,
                  AppText(
                    text: dialogModel.title ?? "",
                    textColor: Colors.green,
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  15.heightBox,
                  AppText(
                    text: dialogModel.description ?? "",
                    textStyle: context.textTheme.bodyMedium,
                    overflow: TextOverflow.ellipsis,
                    fontSize: 14.sp,
                  ),
                  24.heightBox,
                ],
              ),
          const Spacer(),
          _buildActions(context),
          25.heightBox,
        ],
      ),
    );
  }

  Widget _buildActions(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          if (dialogModel.dialogType == DialogType.action) ...[
            AppButton(
              onTap: dialogModel.onSecondaryTapped ?? context.pop,
              text: dialogModel.secondaryText!,
              type: ButtonType.secondary,
              textColor: Colors.grey,
              textSize: dialogModel.secondaryFontSize ?? context.textTheme.headlineSmall!.fontSize,
              borderColor: dialogModel.secondaryButtonColor ?? Colors.grey,
            ),
            8.widthBox,
          ],
          AppButton(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            width: MediaQuery.of(context).size.width,
            textWeight: FontWeight.w700,
            boxShadow: dialogModel.boxShadow,
            height: 50.h,
            onTap: dialogModel.onPrimaryTapped ?? context.pop,
            text: dialogModel.primaryText,
            type: ButtonType.active,
            buttonColor: dialogModel.primaryButtonColor ?? Colors.green,
            borderColor: dialogModel.primaryButtonColor ?? Colors.green,
            textColor: Colors.white,
            textSize: dialogModel.primaryFontSize ?? context.textTheme.headlineSmall!.fontSize,
          ),
        ],
      ),
    );
  }
}
