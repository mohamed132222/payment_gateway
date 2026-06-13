import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PaymentItem extends StatelessWidget {
  const PaymentItem({
    super.key,
    this.isActive = false,
    required this.imagePath,
    this.onTap,
  });

  final bool isActive;
  final String imagePath;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        fixedSize: const Size(103, 62),
        shadowColor: isActive ? Color(0xFF34A853) : Colors.transparent,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(
            width: 1.50,
            color: isActive ? Color(0xFF34A853) : Colors.grey,
          ),
        ),
      ),
      child: SvgPicture.asset(imagePath),
    );
  }
}
