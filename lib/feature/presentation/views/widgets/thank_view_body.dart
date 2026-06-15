import 'package:flutter/material.dart';
import 'package:payment/feature/presentation/views/widgets/check_icon.dart';
import 'package:payment/feature/presentation/views/widgets/dashed_line.dart';
import 'package:payment/feature/presentation/views/widgets/thank_card.dart';

class ThankViewBody extends StatelessWidget {
  const ThankViewBody({
    super.key,
    required this.clientName,
    required this.total,
    required this.transactionTime,
  });

  final String clientName;
  final double total;
  final DateTime transactionTime;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 32, right: 32, bottom: 27),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          ThankCard(
            clientName: clientName,
            total: total,
            transactionTime: transactionTime,
          ),
          Positioned(
            left: -20,
            bottom: MediaQuery.of(context).size.height * 0.2,
            child: const CircleAvatar(backgroundColor: Colors.white),
          ),
          Positioned(
            right: -20,
            bottom: MediaQuery.of(context).size.height * 0.2,
            child: const CircleAvatar(backgroundColor: Colors.white),
          ),
          Positioned(
            left: 20 + 8,
            right: 20 + 8,
            bottom: MediaQuery.of(context).size.height * 0.2 + 20,
            child: DashedLine(),
          ),
          const Positioned(left: 0, right: 0, top: -50, child: CheckIcon()),
        ],
      ),
    );
  }
}
