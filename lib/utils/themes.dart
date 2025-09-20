import 'package:flutter/material.dart';

class CreditCardTheme {
  final Color borderColor;
  final Color errorColor;
  final double borderRadius;
  final TextStyle inputTextStyle;

  const CreditCardTheme({
    this.borderColor = Colors.grey,
    this.errorColor = Colors.red,
    this.borderRadius = 8,
    this.inputTextStyle = const TextStyle(fontSize: 16),
  });
}
