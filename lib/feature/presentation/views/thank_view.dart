import 'package:flutter/material.dart';
import 'package:payment/core/widgets/custom_appbar.dart';
import 'package:payment/feature/presentation/views/widgets/thank_view_body.dart';

class ThankView extends StatelessWidget {
  const ThankView({
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
    return Scaffold(
      appBar: buildAppBar(
        onPressed: () => Navigator.of(
          context,
          rootNavigator: true,
        ).popUntil((route) => route.isFirst),
      ),
      body: ThankViewBody(
        clientName: clientName,
        total: total,
        transactionTime: transactionTime,
      ),
    );
  }
}
