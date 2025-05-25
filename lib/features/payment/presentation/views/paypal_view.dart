import 'package:flutter/material.dart';

class PaypalView extends StatelessWidget {
  const PaypalView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: const Column(
        children: [
          Text('paypal screen')
        ],
      ),
    );
  }
}
