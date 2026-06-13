import 'package:flutter/material.dart';
import 'package:payment/core/utils/styles/styles.dart';

class TotalPrice extends StatelessWidget {
  const TotalPrice({super.key, required this.price});

  final String price;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('Total', style: Styles.font24),
        const Spacer(),
        Text(price, style: Styles.font24),
      ],
    );
  }
}
