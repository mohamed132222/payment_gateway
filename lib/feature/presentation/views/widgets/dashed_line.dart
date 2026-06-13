import 'package:flutter/material.dart';

class DashedLine extends StatelessWidget {
  const DashedLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(20, (index) {
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: Container(color: Color(0xFFB8B8B8), height: 2),
          ),
        );
      }),
    );
  }
}
