import 'package:baridx_task/core/extensions/context_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_field_validator/form_field_validator.dart';

import 'app_text_field.dart';

class EmailTextField extends StatefulWidget {
  const EmailTextField({
    super.key,
    required this.controller,
    this.textStyle,
    this.hintText,
    this.hintStyle,
    this.fillColor,
    this.borderColor,
    this.cursorColor,
    this.borderRadius,
    this.hasLeadingIcon = true,
    this.onChanged,
    this.focusNode,
    this.leadingIcon,
    this.onFieldSubmitted,
    this.validator,
    this.iconColor,
    this.autovalidateMode,
    this.contextMenuBuilder,
  });

  final TextEditingController controller;
  final TextStyle? textStyle;
  final String? hintText;
  final TextStyle? hintStyle;
  final Color? fillColor;
  final Color? borderColor;
  final Color? cursorColor;
  final Color? iconColor;
  final double? borderRadius;
  final bool hasLeadingIcon;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final FocusNode? focusNode;
  final Widget? leadingIcon;
  final String? Function(String?)? validator;
  final AutovalidateMode? autovalidateMode;
  final Widget Function(BuildContext, EditableTextState)? contextMenuBuilder;
  @override
  State<EmailTextField> createState() => _EmailTextFieldState();
}

class _EmailTextFieldState extends State<EmailTextField> {
  bool _isAutoValidate = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: AppTextField(
        contextMenuBuilder: widget.contextMenuBuilder,
        controller: widget.controller,
        style: widget.textStyle,
        focusNode: widget.focusNode,
        hintText: widget.hintText,
        hintStyle: widget.hintStyle,
        fillColor: widget.fillColor,
        borderColor: widget.borderColor,
        borderRadius: widget.borderRadius,
        cursorColor: widget.cursorColor,
        textAlignVertical: TextAlignVertical.top,
        contentPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 10.w),
        onChanged: widget.onChanged,
        onFieldSubmitted: widget.onFieldSubmitted,
        prefixIcon: widget.leadingIcon ??
            (widget.hasLeadingIcon
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.sp),
                        child: Icon(
                          CupertinoIcons.person,
                          color: widget.iconColor ?? context.theme.primaryColor,
                          size: 18.sp,
                        ),
                      )
                    ],
                  )
                : null),
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
              EmailValidator(errorText: "This email is not valid"),
            ],
          )(value);
        },
        autovalidateMode: widget.autovalidateMode ?? (_isAutoValidate ? AutovalidateMode.onUserInteraction : null),
      ),
    );
  }
}
