import 'package:flutter/material.dart';

class CheckIcon extends StatelessWidget {
  const CheckIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 50,

      backgroundColor: Color(0XffD9D9D9),
      child: CircleAvatar(
        radius: 40,
        backgroundColor: Color(0xFF34A853),
        child: Icon(Icons.check, color: Colors.white, size: 50),
      ),
    );
  }
}
