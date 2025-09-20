import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utils/themes.dart';

class CreditCardCVCInput extends StatelessWidget {
  final TextEditingController controller;
  final CreditCardTheme theme;
  final ValueChanged<String>? onChanged;

  const CreditCardCVCInput({
    super.key,
    required this.controller,
    this.theme = const CreditCardTheme(),
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: true,
      keyboardType: TextInputType.number,
      maxLength: 4,
      decoration: InputDecoration(
        labelText: "CVC",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(theme.borderRadius),
        ),
      ),
      style: theme.inputTextStyle,
      onChanged: onChanged,
    );
  }
}
