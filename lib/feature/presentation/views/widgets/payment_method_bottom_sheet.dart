import 'package:flutter/material.dart';
import 'package:payment/feature/presentation/views/widgets/custom_button_bloc_consumer.dart';
import 'package:payment/feature/presentation/views/widgets/payment_method_listview.dart';

class PaymentMethodBottomSheet extends StatelessWidget {
  const PaymentMethodBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const PaymentMethodsListView(),
          const SizedBox(height: 24),
          CustomButtonBlocConsumer(),
        ],
      ),
    );
  }
}
