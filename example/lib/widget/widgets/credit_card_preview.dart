import 'package:flutter/material.dart';
import '../models/card_type.dart';

class CreditCardPreview extends StatelessWidget {
  final String number;
  final String expiryDate;
  final String holderName;
  final CardType type;

  const CreditCardPreview({
    super.key,
    required this.number,
    required this.expiryDate,
    required this.holderName,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200, // give fixed height
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.deepPurple,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            type.toString().split('.').last.toUpperCase(),
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
          const Spacer(),
          Text(
            number,
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(expiryDate, style: const TextStyle(color: Colors.white)),
              Text(
                holderName.toUpperCase(),
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
