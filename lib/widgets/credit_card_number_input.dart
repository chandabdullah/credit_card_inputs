import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utils/formatters.dart';
import '../utils/validators.dart';
import '../utils/themes.dart';

class CreditCardNumberInput extends StatelessWidget {
  final TextEditingController controller;
  final CreditCardTheme theme;
  final ValueChanged<String>? onChanged;

  const CreditCardNumberInput({
    super.key,
    required this.controller,
    this.theme = const CreditCardTheme(),
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        CardNumberFormatter(),
      ],
      decoration: InputDecoration(
        labelText: "Card Number",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(theme.borderRadius),
        ),
      ),
      style: theme.inputTextStyle,
      onChanged: onChanged,
    );
  }
}
