import 'package:flutter/material.dart';
import 'package:payment/feature/data/models/product/product_model.dart';
import 'package:payment/feature/presentation/views/widgets/custom_button_bloc_consumer.dart';
import 'package:payment/feature/presentation/views/widgets/payment_method_listview.dart';

class PaymentMethodBottomSheet extends StatefulWidget {
  const PaymentMethodBottomSheet({
    super.key,
    required this.products,
    required this.total,
    required this.subtotal,
    required this.shipping,
    required this.discount,
    required this.clientName,
  });

  final List<ProductModel> products;
  final double total;
  final double subtotal;
  final double shipping;
  final double discount;
  final String clientName;

  @override
  State<PaymentMethodBottomSheet> createState() =>
      _PaymentMethodBottomSheetState();
}

class _PaymentMethodBottomSheetState extends State<PaymentMethodBottomSheet> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          PaymentMethodsListView(
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
          ),
          const SizedBox(height: 24),
          CustomButtonBlocConsumer(
            selectedIndex: selectedIndex,
            products: widget.products,
            total: widget.total,
            subtotal: widget.subtotal,
            shipping: widget.shipping,
            discount: widget.discount,
            clientName: widget.clientName,
          ),
        ],
      ),
    );
  }
}
