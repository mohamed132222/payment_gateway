import 'package:flutter/material.dart';
import 'package:payment/core/utils/styles/styles.dart';

class PaymentItemInfo extends StatelessWidget {
  const PaymentItemInfo({super.key, required this.title, required this.info});

  final String title, info;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: Styles.font18),
        Text(info, style: Styles.font18),
      ],
    );
  }
}
