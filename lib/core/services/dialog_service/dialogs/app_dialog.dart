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
          height: 550.h + MediaQuery.of(context).systemGestureInsets.bottom,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 50.h),
                child: Container(
                  height: 485.h,
                  width: 330.w,
                  decoration: BoxDecoration(
                    color: const Color(0xffBB9651).withOpacity(0.32),
                    borderRadius: BorderRadius.circular(30.r),
                    border: Border.all(color: const Color(0xffA67F38), width: 2.sp),
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
                    textColor: Colors.black,
                  ),
                  10.heightBox,
                  AppText(
                    text: dialogModel.description ?? "",
                    textStyle: context.textTheme.bodyMedium,
                    overflow: TextOverflow.ellipsis,
                    fontSize: 12.sp,
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
              textColor: context.customColorStyle?.gray,
              textSize: dialogModel.secondaryFontSize ?? context.textTheme.headlineSmall!.fontSize,
              borderColor: dialogModel.secondaryButtonColor ?? context.customColorStyle?.gray,
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
            buttonColor: dialogModel.primaryButtonColor ?? context.customColorStyle?.primary,
            borderColor: dialogModel.primaryButtonColor ?? context.customColorStyle?.primary,
            textColor: context.customColorStyle?.white,
            textSize: dialogModel.primaryFontSize ?? context.textTheme.headlineSmall!.fontSize,
          ),
        ],
      ),
    );
  }
}
