import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../extensions/context_extensions.dart';
import '/core/common_widgets/app_size_boxes.dart';
import 'app_svg_image.dart';
import 'app_text.dart';

enum ButtonType {
  active,
  secondary,
  tertiary,
  text,
  disabled,
}

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    this.center = false,
    this.text,
    this.textColor = Colors.white,
    this.padding,
    this.margin,
    this.type = ButtonType.active,
    this.onTap,
    this.isLoading = false,
    this.isSmall = false,
    this.leadingIcon,
    this.leading,
    this.trailing,
    this.trailingIcon,
    this.textStyle,
    this.buttonColor,
    this.borderColor = Colors.transparent,
    this.borderRadius = 32,
    this.width,
    this.height,
    this.mainAxisAlignment,
    this.textToTrailingWidth,
    this.leadingToTextWidth,
    this.child,
    this.boxShadow,
    this.textSize,
    this.textWeight,
    this.gradient,
  });
  final bool center;
  final String? text;
  final Color? textColor;
  final double? textSize;
  final FontWeight? textWeight;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final ButtonType type;
  final GestureTapCallback? onTap;
  final bool isLoading;
  final bool isSmall;
  final String? leadingIcon;
  final Widget? leading;
  final Widget? trailing;
  final String? trailingIcon;
  final TextStyle? textStyle;
  final Color? buttonColor;
  final Color? borderColor;
  final double? borderRadius;
  final double? width;
  final double? height;
  final MainAxisAlignment? mainAxisAlignment;
  final double? textToTrailingWidth;
  final double? leadingToTextWidth;
  final Widget? child;
  final List<BoxShadow>? boxShadow;
  final Gradient? gradient;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: GestureDetector(
        onTap: type != ButtonType.disabled ? onTap : null,
        child: Container(
            height: height,
            width: width,
            padding: padding ?? EdgeInsets.symmetric(vertical: isSmall ? 7.h : 12.h, horizontal: isSmall ? 12.w : 16.w),
            decoration: BoxDecoration(
              boxShadow: boxShadow,
              gradient: gradient,
              color: buttonColor ?? type.getFilledColor(context),
              borderRadius: borderRadius != null
                  ? BorderRadius.circular(borderRadius!.r)
                  : BorderRadius.all(Radius.circular(32.r)),
              border: Border.all(color: borderColor ?? type.getBorderColor(context)),
            ),
            child: isLoading
                ? Center(
                    child: SizedBox(
                        height: 20.h,
                        width: 20.w,
                        child: const Center(child: CircularProgressIndicator(color: Colors.white))),
                  )
                : _buildLayout(context)),
      ),
    );
  }

  Widget _buildLayout(BuildContext context) {
    if (trailingIcon != null || leadingIcon != null || leading != null || trailing != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.spaceBetween,
        children: [
          if (leadingIcon != null || leading != null) leading ?? _buildIcon(leadingIcon!),
          SizedBox(width: leadingToTextWidth ?? 4.sp),
          child ?? _buildText(context),
          SizedBox(width: textToTrailingWidth ?? 4.sp),
          4.widthBox,
          if (trailingIcon != null || trailing != null) trailing ?? _buildIcon(trailingIcon!),
        ],
      );
    }
    return Center(
      child: child ?? _buildText(context),
    );
  }

  AppSVGImage _buildIcon(String icon) => AppSVGImage(
        image: icon,
        width: isSmall ? 16.sp : 20.sp,
        height: isSmall ? 16.sp : 20.sp,
      );

  AppText _buildText(BuildContext context) {
    return AppText(
      text: text ?? "",
      textAlign: center ? TextAlign.center : TextAlign.start,
      decoration: TextDecoration.none,
      textStyle: getTextStyle(context),
    );
  }

  TextStyle getTextStyle(BuildContext context) {
    if (textStyle != null) return textStyle!;

    return TextStyle(
      color: textColor ?? type.getTextColor(context),
      fontSize: textSize ?? 14.sp,
      fontWeight: textWeight ?? FontWeight.w500,
      fontFamily: 'Poppins',
    );
  }
}

extension ButtonTypeExtension on ButtonType {
  Color getFilledColor(BuildContext context) {
    switch (this) {
      case ButtonType.active:
        return const Color(0xffDE9F00); //context.theme.primaryColor;
      case ButtonType.secondary:
        return const Color(0xffDE9F00); //Colors.transparent;
      case ButtonType.tertiary:
        return context.theme.hoverColor;
      case ButtonType.text:
        return Colors.transparent;
      case ButtonType.disabled:
        return context.theme.disabledColor;
    }
  }

  Color getBorderColor(BuildContext context) {
    switch (this) {
      case ButtonType.active:
        return context.theme.primaryColor;
      case ButtonType.secondary:
        return context.theme.primaryColor;
      case ButtonType.tertiary:
        return context.theme.hoverColor;
      case ButtonType.text:
        return Colors.transparent;
      case ButtonType.disabled:
        return context.theme.disabledColor;
    }
  }

  Color? getTextColor(BuildContext context) {
    switch (this) {
      case ButtonType.active:
        return context.colors.secondaryColor;
      case ButtonType.secondary:
        return context.theme.primaryColor;
      case ButtonType.tertiary:
        return context.theme.primaryColor;
      case ButtonType.text:
        return null;
      case ButtonType.disabled:
        return context.theme.colorScheme.surface;
    }
  }
}
