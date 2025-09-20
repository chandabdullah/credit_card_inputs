import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CreditCardNumberInput extends StatefulWidget {
  final TextEditingController controller;
  final bool showLimit; // option to show limit text
  final int maxLength;

  const CreditCardNumberInput({
    super.key,
    required this.controller,
    this.showLimit = false,
    this.maxLength = 16,
  });

  @override
  State<CreditCardNumberInput> createState() => _CreditCardNumberInputState();
}

class _CreditCardNumberInputState extends State<CreditCardNumberInput> {
  String? errorText;

  // ✅ Luhn Algorithm validation
  bool _isValidCardNumber(String input) {
    if (input.length < 12) return false;
    int sum = 0;
    bool alternate = false;
    for (int i = input.length - 1; i >= 0; i--) {
      int digit = int.parse(input[i]);
      if (alternate) {
        digit *= 2;
        if (digit > 9) digit -= 9;
      }
      sum += digit;
      alternate = !alternate;
    }
    return sum % 10 == 0;
  }

  String _formatWithSpaces(String input) {
    final buffer = StringBuffer();
    for (int i = 0; i < input.length; i++) {
      buffer.write(input[i]);
      if ((i + 1) % 4 == 0 && i + 1 != input.length) {
        buffer.write(' ');
      }
    }
    return buffer.toString();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(widget.maxLength),
      ],
      decoration: InputDecoration(
        labelText: "Card Number",
        hintText: "XXXX XXXX XXXX XXXX",
        errorText: errorText,
        counterText: widget.showLimit
            ? "${widget.controller.text.length}/${widget.maxLength}"
            : "", // hide if not needed
        border: OutlineInputBorder(),
      ),
      onChanged: (value) {
        final digits = value.replaceAll(" ", "");
        final formatted = _formatWithSpaces(digits);
        if (formatted != value) {
          widget.controller.value = TextEditingValue(
            text: formatted,
            selection: TextSelection.collapsed(offset: formatted.length),
          );
        }

        setState(() {
          errorText =
              digits.length == widget.maxLength && !_isValidCardNumber(digits)
                  ? "Invalid card number"
                  : null;
        });
      },
    );
  }
}
