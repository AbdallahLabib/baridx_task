import 'package:baridx_task/core/common_widgets/custom_text_fields/string_text_field.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../app_text.dart';
import 'input_formatters.dart';

class PhoneNumberTextField extends StatefulWidget {
  const PhoneNumberTextField({
    super.key,
    this.controller,
    this.isReadOnly = false,
    this.isEnabled = true,
    this.isRequired = true,
    this.hintText,
    this.hintStyle,
    this.textStyle,
    this.fillColor,
    this.borderColor,
    this.borderRadius,
    this.hasLeadingIcon = true,
    this.initialValue,
    this.onChanged,
    this.iconColor,
    this.textColor,
    this.cursorColor,
    this.cursorHeight,
    this.autovalidateMode,
    this.validator,
  });

  final TextEditingController? controller;
  final bool isRequired;
  final bool isReadOnly;
  final bool isEnabled;
  final String? hintText;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final Color? fillColor;
  final Color? borderColor;
  final Color? iconColor;
  final Color? textColor;
  final double? borderRadius;
  final bool hasLeadingIcon;
  final String? initialValue;
  final Function(String)? onChanged;
  final Color? cursorColor;
  final double? cursorHeight;
  final AutovalidateMode? autovalidateMode;
  final String? Function(String?)? validator;

  @override
  State<PhoneNumberTextField> createState() => _PhoneNumberTextFieldState();
}

class _PhoneNumberTextFieldState extends State<PhoneNumberTextField> {
  late final TextEditingController controller;
  bool _isAutoValidate = false;
  Country country = CountryParser.parseCountryCode('EG');

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    controller.text = widget.initialValue ?? "";
  }

  @override
  void didUpdateWidget(PhoneNumberTextField oldWidget) {
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
    return StringTextField(
      cursorColor: widget.cursorColor ?? Colors.white,
      controller: widget.controller ?? controller,
      keyboardType: TextInputType.phone,
      inputFormatters: [
        NoSpaceInputFormatter(),
        FixedLengthDigitFormatter(11),
        FilteringTextInputFormatter.digitsOnly,
      ],
      hintText: widget.hintText,
      hintStyle: widget.hintStyle,
      fillColor: widget.fillColor,
      borderColor: widget.borderColor,
      borderRadius: widget.borderRadius,
      contentPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 15.w),
      isReadOnly: widget.isReadOnly,
      onChanged: (value) {
        controller.text = value;
        widget.onChanged?.call(value);
      },
      prefixIcon: widget.hasLeadingIcon
          ? GestureDetector(
              onTap: () => showCountryPicker(
                context: context,
                countryListTheme: CountryListThemeData(
                  bottomSheetHeight: 600.h,
                  inputDecoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.search,
                        size: 24.sp,
                        color: Colors.black,
                      ),
                      hintText: "Search ..."),
                ),
                onSelect: (value) {
                  setState(() {
                    country = value;
                  });
                },
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    // Padding(
                    //   padding: EdgeInsets.symmetric(horizontal: 10.sp),
                    //   child: Icon(
                    //     CupertinoIcons.person,
                    //     color: context.theme.primaryColor,
                    //     size: 18.sp,
                    //   ),
                    // ),
                    AppText(
                      text: "${country.flagEmoji} +${country.phoneCode} ",
                      fontWeight: FontWeight.w500,
                      textColor: Colors.black,
                    ),
                    Icon(
                      CupertinoIcons.chevron_down,
                      color: widget.iconColor ?? Colors.black,
                      size: 18.sp,
                    )
                  ],
                ),
              ),
            )
          : null,
      validator: widget.isRequired && widget.isEnabled
          ? (value) {
              if (!_isAutoValidate) {
                setState(() {
                  _isAutoValidate = true;
                });
              }
              if (widget.validator != null) return widget.validator!(value);
              return MultiValidator(
                [
                  RequiredValidator(errorText: "Please enter your phone number"),
                  MinLengthValidator(11, errorText: "Phone number must be 11 digits"),
                  MaxLengthValidator(11, errorText: "Phone number must be 11 digits"),
                  PatternValidator(r'^[0-9]*$', errorText: "Phone number must be only digits")
                ],
              )(value);
            }
          : null,
      autovalidateMode:
          widget.autovalidateMode ?? (_isAutoValidate ? AutovalidateMode.onUserInteraction : AutovalidateMode.disabled),
    );
  }
}
