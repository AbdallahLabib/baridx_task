import 'package:flutter/services.dart';

class FixedLengthDigitFormatter extends TextInputFormatter {
  final int maxLength;

  FixedLengthDigitFormatter(this.maxLength);

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    // Allow only digits
    String newText = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');

    // Limit to the specified maxLength
    if (newText.length > maxLength) {
      newText = newText.substring(0, maxLength);
    }

    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}

class NoSpaceInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    return newValue.copyWith(
      text: newValue.text.replaceAll(RegExp(r'\s+'), ''), // Replaces all spaces with an empty string
      selection: TextSelection.fromPosition(
        TextPosition(offset: newValue.text.replaceAll(RegExp(r'\s+'), '').length),
      ),
    );
  }
}
