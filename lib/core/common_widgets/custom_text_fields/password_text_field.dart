import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_field_validator/form_field_validator.dart';

import 'app_text_field.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    super.key,
    required this.controller,
    this.textStyle,
    this.hintText,
    this.hintStyle,
    this.fillColor,
    this.borderColor,
    this.borderRadius,
    this.hasLeadingIcon = true,
    this.onChanged,
    this.iconColor,
    this.cursorColor,
    this.textColor,
    this.validator,
    this.focusNode,
    this.onFieldSubmitted,
    this.autovalidateMode,
    this.leadingIcon,
  });

  final TextEditingController controller;
  final FocusNode? focusNode;
  final String? hintText;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final Color? fillColor;
  final Color? borderColor;
  final Color? iconColor;
  final Color? textColor;
  final Color? cursorColor;

  final double? borderRadius;
  final bool hasLeadingIcon;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final Function(String)? onFieldSubmitted;
  final AutovalidateMode? autovalidateMode;
  final Widget? leadingIcon;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool obscureText = true;
  bool _isAutoValidate = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: AppTextField(
        focusNode: widget.focusNode,
        textColor: widget.textColor ?? Colors.black,
        controller: widget.controller,
        style: widget.textStyle,
        hintText: widget.hintText,
        hintStyle: widget.hintStyle,
        fillColor: widget.fillColor,
        borderColor: widget.borderColor,
        borderRadius: widget.borderRadius,
        cursorColor: widget.cursorColor,
        contentPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 15.w),
        obscureText: obscureText,
        maxLines: 1,
        onChanged: widget.onChanged,
        prefixIcon: widget.hasLeadingIcon
            ? widget.leadingIcon
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.sp),
                    child: Icon(
                      CupertinoIcons.lock,
                      size: 18.sp,
                      color: widget.iconColor ?? Colors.black,
                    ),
                  )
                ],
              ),
        suffixIconConstraints: BoxConstraints(maxHeight: 20.h),
        suffixIcon: GestureDetector(
          onTap: () => setState(() {
            obscureText = !obscureText;
          }),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.sp),
            child: Icon(
              obscureText ? CupertinoIcons.eye_slash : CupertinoIcons.eye,
              color: widget.iconColor ?? Colors.black,
              size: 18.sp,
            ),
          ),
        ),
        isRequired: true,
        validator: (value) {
          if (!_isAutoValidate) {
            setState(() {
              _isAutoValidate = true;
            });
          }
          if (widget.validator != null) return widget.validator!(value);
          return MultiValidator(
            [
              RequiredValidator(errorText: "This field is required"),
              MinLengthValidator(5, errorText: "password_error"),
            ],
          )(value);
        },
        autovalidateMode: widget.autovalidateMode ?? (_isAutoValidate ? AutovalidateMode.onUserInteraction : null),
      ),
    );
  }
}
