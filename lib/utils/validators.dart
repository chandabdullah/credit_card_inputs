bool validateCardNumber(String number) {
  String digits = number.replaceAll(RegExp(r'[^0-9]'), '');
  if (digits.isEmpty) return false;

  int sum = 0;
  bool alternate = false;
  for (int i = digits.length - 1; i >= 0; i--) {
    int n = int.parse(digits[i]);
    if (alternate) {
      n *= 2;
      if (n > 9) n -= 9;
    }
    sum += n;
    alternate = !alternate;
  }
  return sum % 10 == 0;
}

bool validateExpiryDate(String expiry) {
  if (!RegExp(r'^\d{2}/\d{2}$').hasMatch(expiry)) return false;
  int month = int.parse(expiry.split('/')[0]);
  int year = int.parse(expiry.split('/')[1]) + 2000;
  if (month < 1 || month > 12) return false;

  DateTime now = DateTime.now();
  DateTime exp = DateTime(year, month + 1, 0);
  return exp.isAfter(now);
}

bool validateCVC(String cvc) => RegExp(r'^\d{3,4}$').hasMatch(cvc);
