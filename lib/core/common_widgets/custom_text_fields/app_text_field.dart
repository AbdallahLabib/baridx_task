// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/core/helpers/themes/colors/app_colors.dart';
import '/core/extensions/context_extensions.dart';

class AppTextField extends StatelessWidget {
  AppTextField({
    super.key,
    this.labelText,
    this.focusNode,
    this.autofocus = false,
    this.hintText,
    this.controller,
    this.isEnabled = true,
    this.obscureText = false,
    this.validator,
    this.prefixIcon,
    this.maxLines,
    this.minLines,
    this.style,
    this.suffixSvg,
    this.focusColor,
    this.decoration,
    this.suffix,
    this.suffixIcon,
    this.suffixIconConstraints,
    this.readOnly = false,
    this.expands = false,
    this.keyboardType = TextInputType.text,
    this.borderColor,
    this.textColor,
    this.textAlignVertical,
    this.contentPadding,
    this.inputBorder,
    this.fillColor,
    this.hintStyle,
    this.onChanged,
    this.onFieldSubmitted,
    this.onEditingComplete,
    this.onTap,
    this.onSaved,
    this.borderRadius,
    this.hasDownArrow = false,
    this.isRequired = false,
    this.scrollPadding,
    this.cursorColor,
    this.inputFormatters,
    this.maxLength,
    this.cursorHeight,
    this.counterText,
    this.scrollController,
    this.padding,
    this.autovalidateMode,
    this.suffixIconColor,
    this.onTapOutside,
    this.errorText,
    this.contextMenuBuilder,
  });

  Color? textColor;
  final Color? borderColor;
  final Color? focusColor;
  final Color? suffixIconColor;
  final String? hintText;
  final String? labelText;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;
  final Widget? suffix;
  final Widget? suffixIcon;
  final String? suffixSvg;
  final BoxConstraints? suffixIconConstraints;
  final Widget? prefixIcon;
  final bool readOnly;
  final bool isEnabled;
  final bool hasDownArrow;
  final bool autofocus;
  final bool expands;
  final bool isRequired;
  final int? maxLines;
  final int? minLines;
  final InputDecoration? decoration;
  final EdgeInsets? contentPadding;
  final Color? fillColor;
  final bool obscureText;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final ValueChanged<String>? onChanged;
  final GestureTapCallback? onTap;
  Function(String?)? onSaved;
  final Function(String)? onFieldSubmitted;
  final Function()? onEditingComplete;
  final TextAlignVertical? textAlignVertical;
  InputBorder? inputBorder;
  double? borderRadius;
  EdgeInsets? scrollPadding;
  final Color? cursorColor;
  List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  final double? cursorHeight;
  final String? counterText;
  final ScrollController? scrollController;
  final EdgeInsetsGeometry? padding;
  final AutovalidateMode? autovalidateMode;
  final Function(PointerDownEvent)? onTapOutside;
  final String? errorText;
  final Widget Function(BuildContext, EditableTextState)? contextMenuBuilder;
  @override
  Widget build(BuildContext context) {
    if (padding != null) {
      return Padding(
        padding: padding!,
        child: _buildAppFormField(context),
      );
    }
    return _buildAppFormField(context);
  }

  Widget _buildAppFormField(BuildContext context) {
    textColor = textColor ?? context.colors.primaryTextColor;
    inputBorder = inputBorder ??
        OutlineInputBorder(
          borderSide: BorderSide(color: borderColor ?? Colors.grey.shade400),
          borderRadius: BorderRadius.circular(borderRadius ?? 6.r),
        );
    return TextFormField(
      contextMenuBuilder: contextMenuBuilder ??
          (context, editableTextState) {
            return contextMenuBuilderFunction(context, editableTextState);
          },
      scrollController: scrollController,
      scrollPadding: scrollPadding ?? EdgeInsets.zero,
      controller: controller,
      textAlignVertical: textAlignVertical ?? TextAlignVertical.center,
      focusNode: focusNode,
      readOnly: readOnly,
      expands: expands,
      obscureText: obscureText,
      enabled: isEnabled,
      validator: isRequired ? validator : null,
      autovalidateMode: autovalidateMode ?? AutovalidateMode.disabled,
      autofocus: autofocus,
      inputFormatters: inputFormatters,
      maxLength: maxLength,
      style: style ??
          TextStyle(
            fontFamily: 'Lucial',
            fontWeight: FontWeight.w500,
            fontSize: 14.sp,
            color: textColor,
          ),
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      onTap: onTap,
      onTapOutside: onTapOutside ??
          (_) {
            FocusScope.of(context).unfocus();
            focusNode?.unfocus();
          },
      onSaved: onSaved,
      onEditingComplete: onEditingComplete,
      maxLines: maxLines,
      minLines: minLines,
      keyboardType: keyboardType,
      cursorColor: Colors.black,
      cursorHeight: cursorHeight ?? 17.sp,
      decoration: decoration ??
          InputDecoration(
            counterText: counterText,
            isDense: true,
            errorText: errorText,
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            fillColor: fillColor ?? Colors.white,
            floatingLabelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14.sp,
              color: context.colors.primaryTextColor,
            ),
            labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14.sp,
              color: context.colors.primaryTextColor,
            ),
            labelText: labelText,
            contentPadding: contentPadding,
            focusedErrorBorder: inputBorder?.copyWith(
              borderSide: const BorderSide(color: AppColors.snackBarRedError),
            ),
            enabledBorder: inputBorder,
            enabled: isEnabled,
            border: inputBorder,
            focusedBorder: inputBorder?.copyWith(
              borderSide: BorderSide(color: borderColor ?? Colors.grey.shade400),
            ),
            disabledBorder: inputBorder,
            hintText: hintText,
            hintStyle: hintStyle ??
                TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: context.colors.hintTextColor,
                ),
            suffix: suffix,
            suffixIcon: hasDownArrow
                ? Icon(
                    CupertinoIcons.chevron_down,
                    size: 16.sp,
                  )
                : suffixIcon,
            suffixIconColor: suffixIconColor,
            suffixIconConstraints: suffixIconConstraints,
            prefixIcon: prefixIcon,
            alignLabelWithHint: true,
            filled: true,
            errorMaxLines: 2,
          ),
    );
  }

  Widget contextMenuBuilderFunction(BuildContext context, EditableTextState editableTextState) {
    final Offset adjustedPrimaryAnchor = Offset(
      editableTextState.contextMenuAnchors.primaryAnchor.dx,
      editableTextState.contextMenuAnchors.primaryAnchor.dy - 10, // Shift up by 10 pixels
    );

    final Offset? adjustedSecondaryAnchor = editableTextState.contextMenuAnchors.secondaryAnchor != null
        ? Offset(
            editableTextState.contextMenuAnchors.secondaryAnchor!.dx,
            editableTextState.contextMenuAnchors.secondaryAnchor!.dy - 10, // Shift up by 20 pixels
          )
        : null;
    return AdaptiveTextSelectionToolbar(
      anchors: TextSelectionToolbarAnchors(
        primaryAnchor: adjustedPrimaryAnchor,
        secondaryAnchor: adjustedSecondaryAnchor,
      ),
      children: editableTextState.contextMenuButtonItems
          .where((item) => _getLabelFromType(item.type).isNotEmpty) // Filter out unwanted items
          .map(
        (ContextMenuButtonItem item) {
          return TextButton(
            style: TextButton.styleFrom(
              shape: const RoundedRectangleBorder(),
              backgroundColor: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
            ),
            onPressed: item.onPressed,
            child: Text(
              _getLabelFromType(item.type), // Extract label text
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
              ),
            ),
          );
        },
      ).toList(),
    );
  }

  String _getLabelFromType(ContextMenuButtonType type) {
    switch (type) {
      case ContextMenuButtonType.share:
        return "share";
      case ContextMenuButtonType.copy:
        return 'Copy';
      case ContextMenuButtonType.paste:
        return 'Paste';
      case ContextMenuButtonType.cut:
        return 'Cut';
      case ContextMenuButtonType.selectAll:
        return 'Select All   ';

      default:
        return '';
    }
  }
}
