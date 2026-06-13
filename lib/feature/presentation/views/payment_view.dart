import 'package:flutter/material.dart';
import 'package:payment/core/widgets/custom_appbar.dart';
import 'package:payment/feature/presentation/views/widgets/payment_view_body.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        title: "Payment Details",
        onPressed: () => Navigator.pop(context),
      ),
      body: PaymentViewBody(),
    );
  }
}
