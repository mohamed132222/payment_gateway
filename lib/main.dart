import 'package:flutter/material.dart';

import 'feature/presentation/views/my_cart_view.dart';

void main() {
  runApp(CheckoutApp());
}

class CheckoutApp extends StatelessWidget {
  const CheckoutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: MyCartView());
  }
}
