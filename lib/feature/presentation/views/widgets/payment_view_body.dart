import 'package:flutter/material.dart';
import 'package:payment/core/widgets/custom_button.dart';
import 'package:payment/feature/presentation/views/thank_view.dart';
import 'package:payment/feature/presentation/views/widgets/custom_credit.dart';
import 'package:payment/feature/presentation/views/widgets/payment_method_listview.dart';

class PaymentViewBody extends StatefulWidget {
  const PaymentViewBody({super.key});

  @override
  State<PaymentViewBody> createState() => _PaymentViewBodyState();
}

class _PaymentViewBodyState extends State<PaymentViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(child: SizedBox(height: 20)),
        const SliverToBoxAdapter(
          child: Center(child: PaymentMethodsListView()),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 34)),
        SliverToBoxAdapter(
          child: CustomCredit(
            formKey: formKey,
            autovalidateMode: autovalidateMode,
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 16,
                bottom: 16.0,
                left: 20,
                right: 20,
              ),
              child: CustomButton(
                text: "Pay",
                onPressed: () {
                  if (formKey.currentState?.validate() ?? false) {
                    formKey.currentState?.save();
                    // If you want to proceed to ThankView after payment logic:
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ThankView(),
                      ),
                    );
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
