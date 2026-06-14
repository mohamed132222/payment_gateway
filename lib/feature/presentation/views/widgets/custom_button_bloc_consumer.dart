import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/core/widgets/custom_button.dart';
import 'package:payment/feature/cubit/payment_cubit.dart';
import 'package:payment/feature/cubit/payment_state.dart';
import 'package:payment/feature/data/models/payment_intent_request/payment_intent_request.dart';
import 'package:payment/feature/presentation/views/thank_view.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PaymentSuccess) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const ThankView()),
          );
        }
        if (state is PaymentFailure) {
          Navigator.pop(context);
          SnackBar snackBar = SnackBar(content: Text(state.message));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        return CustomButton(
          onPressed: state is PaymentLoading
              ? null
              : () {
                  final request = CreatePaymentIntentRequest(
                    amount: "1000",
                    currency: 'usd',
                    customerId: "cus_UheDlBCokTh6bo",
                  );

                  context.read<PaymentCubit>().makePayment(request);
                },
          text: "Continue",
          isLoading: state is PaymentLoading,
        );
      },
    );
  }
}
