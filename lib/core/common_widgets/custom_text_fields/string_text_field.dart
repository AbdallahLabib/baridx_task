import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';

import 'app_text_field.dart';

class StringTextField extends StatefulWidget {
  const StringTextField({
    super.key,
    this.isReadOnly = false,
    this.isRequired = true,
    this.initialValue,
    this.hasTrailingIcon = false,
    this.maxLines,
    this.textStyle,
    this.hintText,
    this.hintStyle,
    this.fillColor,
    this.borderColor,
    this.borderRadius,
    this.hasLeadingIcon = false,
    this.onChanged,
    this.onTap,
    this.onSaved,
    this.onFieldSubmitted,
    this.onEditingComplete,
    this.scrollPadding,
    this.validator,
    this.autovalidateMode,
    this.isEnabled = true,
    this.prefixIcon,
    this.focusNode,
    this.controller,
    this.inputBorder,
    this.onTapOutside,
    this.suffixIcon,
    this.suffix,
    this.suffixIconColor,
    this.contentPadding,
    this.padding,
    this.leadingImg,
    this.cursorColor,
    this.keyboardType,
    this.inputFormatters,
  });

  final bool isReadOnly;
  final bool isRequired;
  final String? initialValue;
  final bool hasLeadingIcon;
  final bool hasTrailingIcon;
  final int? maxLines;
  final String? hintText;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final Color? fillColor;
  final Color? borderColor;
  final Color? cursorColor;
  final double? borderRadius;
  final Function(String value)? onChanged;
  final void Function()? onTap;
  final Function(String?)? onSaved;
  final Function(String)? onFieldSubmitted;
  final EdgeInsets? scrollPadding;
  final EdgeInsets? contentPadding;
  final EdgeInsets? padding;
  final String? Function(String? validationMessage)? validator;
  final AutovalidateMode? autovalidateMode;
  final bool isEnabled;
  final Widget? prefixIcon;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final InputBorder? inputBorder;
  final Function(PointerDownEvent)? onTapOutside;
  final Function()? onEditingComplete;
  final Widget? suffixIcon;
  final Widget? suffix;
  final Color? suffixIconColor;
  final String? leadingImg;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  @override
  State<StringTextField> createState() => _StringTextFieldState();
}

class _StringTextFieldState extends State<StringTextField> {
  late final TextEditingController controller;
  bool _isAutoValidate = false;
  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    controller.text = widget.initialValue ?? "";
  }

  @override
  void didUpdateWidget(StringTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialValue != widget.initialValue) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        controller.text = widget.initialValue ?? "";
      });
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      padding: widget.padding,
      inputFormatters: widget.inputFormatters,
      controller: widget.controller ?? controller,
      focusNode: widget.focusNode,
      scrollPadding: widget.scrollPadding,
      contentPadding: widget.contentPadding,
      readOnly: widget.isReadOnly,
      isEnabled: widget.isEnabled,
      onTapOutside: widget.onTapOutside,
      style: widget.textStyle ?? const TextStyle(color: Colors.black),
      hintText: widget.hintText,
      hintStyle: widget.hintStyle,
      fillColor: widget.fillColor,
      borderColor: widget.borderColor,
      cursorColor: widget.cursorColor,
      borderRadius: widget.borderRadius,
      textAlignVertical: TextAlignVertical.top,
      maxLines: widget.maxLines,
      onTap: widget.onTap,
      onSaved: widget.onSaved,
      minLines: widget.maxLines,
      onEditingComplete: widget.onEditingComplete,
      onChanged: (value) {
        controller.text = value;
        widget.onChanged?.call(value);
      },
      onFieldSubmitted: widget.onFieldSubmitted,
      prefixIcon: widget.prefixIcon,
      suffixIcon: widget.suffixIcon,
      suffix: widget.suffix,
      suffixIconColor: widget.suffixIconColor,
      isRequired: widget.isRequired,
      keyboardType: widget.keyboardType ?? TextInputType.text,
      validator: widget.isRequired && widget.isEnabled
          ? (value) {
              if (!_isAutoValidate) {
                setState(() {
                  _isAutoValidate = true;
                });
              }
              if (widget.validator != null) return widget.validator!(value);

              return RequiredValidator(errorText: "This field is required")(value);
            }
          : null,
      autovalidateMode: widget.autovalidateMode ?? (_isAutoValidate ? AutovalidateMode.onUserInteraction : null),
    );
  }
}
