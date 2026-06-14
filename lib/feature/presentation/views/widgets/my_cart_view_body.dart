import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/core/utils/stripe_services.dart';
import 'package:payment/core/widgets/custom_button.dart';
import 'package:payment/feature/cubit/payment_cubit.dart';
import 'package:payment/feature/data/repos/payment_repo_impl.dart';
import 'package:payment/feature/presentation/views/widgets/order_item.dart';
import 'package:payment/feature/presentation/views/widgets/payment_method_bottom_sheet.dart';
import 'package:payment/feature/presentation/views/widgets/total_price.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Expanded(child: Image.asset('assets/images/cartimage.png')),
          const SizedBox(height: 25),
          const OrderItem(title: "Order Subtotal", price: r"$42.97"),
          const SizedBox(height: 3),
          const OrderItem(title: "Discount", price: r"$0"),
          const SizedBox(height: 3),
          const OrderItem(title: "Shipping", price: r"$$8"),
          const Divider(height: 34, thickness: 1, color: Color(0xFFC7C7C7)),
          const TotalPrice(price: r"$50.97"),
          const SizedBox(height: 16),
          CustomButton(
            text: "Proceed to Payment",
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const PaymentView()),
              // );
              showModalBottomSheet(
                context: context,
                builder: (context) => BlocProvider(
                  create: (context) => PaymentCubit(
                    paymentRepo: PaymentRepoImpl(
                      stripeServices: StripeServices(),
                    ),
                  ),
                  child: PaymentMethodBottomSheet(),
                ),
              );
            },
          ),
          const SizedBox(height: 25),
        ],
      ),
    );
  }
}
