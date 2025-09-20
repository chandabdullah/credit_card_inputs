enum CardType { visa, masterCard, americanExpress, discover, other }

CardType detectCardType(String cardNumber) {
  if (cardNumber.startsWith(RegExp(r'4'))) {
    return CardType.visa;
  } else if (cardNumber.startsWith(RegExp(r'5[1-5]'))) {
    return CardType.masterCard;
  } else if (cardNumber.startsWith(RegExp(r'3[47]'))) {
    return CardType.americanExpress;
  } else if (cardNumber.startsWith('6')) {
    return CardType.discover;
  } else {
    return CardType.other;
  }
}
