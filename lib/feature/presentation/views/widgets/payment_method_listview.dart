import 'package:flutter/material.dart';
import 'package:payment/feature/presentation/views/widgets/payment_item.dart';

class PaymentMethodsListView extends StatefulWidget {
  const PaymentMethodsListView({super.key});

  @override
  State<PaymentMethodsListView> createState() => _PaymentMethodsListViewState();
}

class _PaymentMethodsListViewState extends State<PaymentMethodsListView> {
  final List<String> paymentMethods = [
    "assets/images/card1.svg",
    "assets/images/card2.svg",
    "assets/images/card3.svg",
  ];

  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: PaymentItem(
            isActive: activeIndex == index,
            imagePath: paymentMethods[index],
            onTap: () {
              setState(() {
                activeIndex = index;
              });
            },
          ),
        ),
        itemCount: paymentMethods.length,
      ),
    );
  }
}
