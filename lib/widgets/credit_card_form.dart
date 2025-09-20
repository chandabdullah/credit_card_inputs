import 'package:flutter/material.dart';
import '../utils/themes.dart';
import 'credit_card_number_input.dart';
import 'credit_card_expiry_input.dart';
import 'credit_card_cvc_input.dart';
import 'credit_card_holder_input.dart';

class CreditCardForm extends StatelessWidget {
  final TextEditingController numberController;
  final TextEditingController expiryController;
  final TextEditingController cvcController;
  final TextEditingController holderController;
  final CreditCardTheme theme;

  const CreditCardForm({
    super.key,
    required this.numberController,
    required this.expiryController,
    required this.cvcController,
    required this.holderController,
    this.theme = const CreditCardTheme(),
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CreditCardNumberInput(controller: numberController, theme: theme),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: CreditCardExpiryInput(
                controller: expiryController,
                theme: theme,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: CreditCardCVCInput(
                controller: cvcController,
                theme: theme,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        CreditCardHolderInput(controller: holderController, theme: theme),
      ],
    );
  }
}
