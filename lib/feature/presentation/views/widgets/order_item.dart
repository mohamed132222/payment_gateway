import 'package:flutter/material.dart';
import 'package:payment/core/utils/styles/styles.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({super.key, required this.title, required this.price});

  final String title, price;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title, style: Styles.font18),
        Spacer(),
        Text(price, style: Styles.font18),
      ],
    );
  }
}
