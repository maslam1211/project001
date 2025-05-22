import 'package:flutter/material.dart';

class PlaceOrderScreen extends StatelessWidget {
  static const routeName = '/place-order';

  const PlaceOrderScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Place Order"),
        centerTitle: true,
      ),
    );
  }
}
