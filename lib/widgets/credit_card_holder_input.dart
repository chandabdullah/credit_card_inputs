import 'package:flutter/material.dart';
import '../utils/themes.dart';

class CreditCardHolderInput extends StatelessWidget {
  final TextEditingController controller;
  final CreditCardTheme theme;
  final ValueChanged<String>? onChanged;

  const CreditCardHolderInput({
    super.key,
    required this.controller,
    this.theme = const CreditCardTheme(),
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      textCapitalization: TextCapitalization.characters,
      decoration: InputDecoration(
        labelText: "Card Holder",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(theme.borderRadius),
        ),
      ),
      style: theme.inputTextStyle,
      onChanged: onChanged,
    );
  }
}
