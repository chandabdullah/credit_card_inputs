import 'package:example/widget/credit_card_inputs.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Credit Card Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Credit Card Inputs Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Controllers
  final numberCtrl = TextEditingController();
  final expiryCtrl = TextEditingController();
  final cvcCtrl = TextEditingController();
  final holderCtrl = TextEditingController();

  String cardNumber = '';
  String expiry = '';
  String cvc = '';
  String holder = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Card Form
              CreditCardForm(
                numberController: numberCtrl,
                expiryController: expiryCtrl,
                cvcController: cvcCtrl,
                holderController: holderCtrl,
              ),
              const SizedBox(height: 20),

              // Submit Button
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    cardNumber = numberCtrl.text;
                    expiry = expiryCtrl.text;
                    cvc = cvcCtrl.text;
                    holder = holderCtrl.text;
                  });
                },
                child: const Text("Save Card"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
