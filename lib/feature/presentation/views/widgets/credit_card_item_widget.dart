import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:payment/core/utils/styles/styles.dart';

class CreditCardItemWidget extends StatelessWidget {
  const CreditCardItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            "assets/images/credit_icon.svg",
            width: 22,
            height: 22,
          ),
          const SizedBox(width: 22),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Credit Card", style: Styles.font18),
              const SizedBox(height: 2),
              Text(
                "Mastercard **78",
                style: Styles.font18.copyWith(color: Color(0xFFB8B8B8)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
