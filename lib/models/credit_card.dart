import '../utils/validators.dart';
import 'card_type.dart';

class CreditCard {
  final String number;
  final String expiryDate;
  final String cvc;
  final String holderName;
  final CardType type;

  CreditCard({
    required this.number,
    required this.expiryDate,
    required this.cvc,
    required this.holderName,
  }) : type = detectCardType(number);

  bool get isValid =>
      validateCardNumber(number) &&
      validateExpiryDate(expiryDate) &&
      validateCVC(cvc);
}
