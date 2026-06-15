import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/core/functions/build_paybal_transaction.dart';
import 'package:payment/core/functions/paybal_execute.dart';
import 'package:payment/core/widgets/custom_button.dart';
import 'package:payment/feature/cubit/payment_cubit.dart';
import 'package:payment/feature/cubit/payment_state.dart';
import 'package:payment/feature/data/models/product/product_model.dart';
import 'package:payment/feature/data/models/stripe/payment_intent_request/payment_intent_request.dart';
import 'package:payment/feature/presentation/views/thank_view.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({
    super.key,
    required this.selectedIndex,
    required this.products,
    required this.total,
    required this.subtotal,
    required this.shipping,
    required this.discount,
    required this.clientName,
  });

  final int selectedIndex;
  final List<ProductModel> products;
  final double total;
  final double subtotal;
  final double shipping;
  final double discount;
  final String clientName;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PaymentSuccess) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => ThankView(
                clientName: clientName,
                total: total,
                transactionTime: DateTime.now(),
              ),
            ),
          );
        }
        if (state is PaymentFailure) {
          if (Navigator.canPop(context)) Navigator.pop(context);
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
        if (state is PaypalPaymentInitiated) {
          final transactionData = buildPaypalTransactionData(
            total,
            subtotal,
            shipping,
            discount,
            products,
          );
          paybal_execute(context, transactionData);
        }
      },
      builder: (context, state) {
        return CustomButton(
          onPressed: state is PaymentLoading
              ? null
              : () {
                  if (selectedIndex == 0) {
                    // toJson() appends "00" so pass the whole-dollar amount
                    final amount = total.toInt().toString();
                    context.read<PaymentCubit>().makePayment(
                      CreatePaymentIntentRequest(
                        amount: amount,
                        currency: 'usd',
                        customerId: "cus_UheDlBCokTh6bo",
                      ),
                    );
                  } else if (selectedIndex == 1) {
                    context.read<PaymentCubit>().initiatePaypalPayment();
                  } else if (selectedIndex == 2) {
                    debugPrint("Paymob selected");
                  }
                },
          text: "Continue",
          isLoading: state is PaymentLoading,
        );
      },
    );
  }
}
