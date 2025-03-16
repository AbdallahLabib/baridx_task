import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_field_validator/form_field_validator.dart';

import 'app_text_field.dart';
import 'input_formatters.dart';

class NumberTextField extends StatefulWidget {
  const NumberTextField({
    super.key,
    this.isReadOnly = false,
    this.isRequired = true,
    this.isEnabled = true,
    this.initialValue,
    this.textStyle,
    this.hasLeadingIcon = false,
    this.hintText,
    this.onChanged,
    this.validator,
    this.autovalidateMode,
  });
  final bool isReadOnly;
  final bool isRequired;
  final bool isEnabled;
  final String? initialValue;
  final TextStyle? textStyle;
  final bool hasLeadingIcon;
  final String? hintText;
  final Function(num value)? onChanged;
  final String? Function(String?)? validator;
  final AutovalidateMode? autovalidateMode;
  @override
  State<NumberTextField> createState() => _NumberTextFieldState();
}

class _NumberTextFieldState extends State<NumberTextField> {
  final controller = TextEditingController();
  bool _isAutoValidate = false;

  @override
  void initState() {
    super.initState();
    controller.text = widget.initialValue ?? "";
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: controller,
      hintText: widget.hintText,
      isEnabled: widget.isEnabled,
      style: widget.textStyle ?? const TextStyle(color: Colors.black),
      inputFormatters: [
        NoSpaceInputFormatter(),
        FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*$')),
      ],
      autovalidateMode:
          widget.autovalidateMode ?? (_isAutoValidate ? AutovalidateMode.onUserInteraction : AutovalidateMode.disabled),
      readOnly: widget.isReadOnly,
      onChanged: (value) {
        if (value.isEmpty) return;
        widget.onChanged?.call(num.parse(value.trim()));
      },
      keyboardType: TextInputType.number,
      prefixIcon: widget.hasLeadingIcon
          ? Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.sp),
              child: Icon(CupertinoIcons.person, color: Colors.black, size: 18.sp),
            )
          : null,
      isRequired: widget.isRequired,
      validator: widget.isRequired
          ? (value) {
              if (!_isAutoValidate) {
                setState(() {
                  _isAutoValidate = true;
                });
              }
              if (widget.validator != null) return widget.validator!(value);
              return MultiValidator(
                [
                  RequiredValidator(errorText: "This field is required"),
                  PatternValidator(r'^[0-9]*$', errorText: "only_numbers"),
                ],
              )(value);
            }
          : null,
    );
  }
}
