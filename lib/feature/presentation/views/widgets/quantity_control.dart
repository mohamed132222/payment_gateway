import 'package:flutter/material.dart';
import 'package:payment/core/utils/styles/styles.dart';
import 'package:payment/feature/presentation/views/widgets/circle_button.dart';

class QuantityControl extends StatelessWidget {
  const QuantityControl({
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
  });

  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleButton(icon: Icons.remove, onTap: onDecrement),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text('$quantity', style: Styles.font18w600),
        ),
        CircleButton(icon: Icons.add, onTap: onIncrement),
      ],
    );
  }
}
