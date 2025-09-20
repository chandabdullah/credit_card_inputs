import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utils/formatters.dart';
import '../utils/themes.dart';

class CreditCardExpiryInput extends StatelessWidget {
  final TextEditingController controller;
  final CreditCardTheme theme;
  final ValueChanged<String>? onChanged;

  const CreditCardExpiryInput({
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
        ExpiryDateFormatter(),
      ],
      decoration: InputDecoration(
        labelText: "Expiry Date",
        hintText: "MM/YY",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(theme.borderRadius),
        ),
      ),
      style: theme.inputTextStyle,
      onChanged: onChanged,
    );
  }
}
