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
        SliverToBoxAdapter(child: SizedBox(height: 20)),
        SliverToBoxAdapter(
          child: Center(
            child: PaymentMethodsListView(
              onTap: (index) {
                setState(() {
                  autovalidateMode = AutovalidateMode.disabled;
                });
              },
            ),
          ),
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
                top: 8,
                bottom: 8.0,
                left: 20,
                right: 20,
              ),
              child: CustomButton(
                text: "Pay",
                onPressed: () {
                  if (formKey.currentState?.validate() ?? false) {
                    // Process payment
                    formKey.currentState?.save();
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ThankView(
                          clientName: '',
                          total: 2000,
                          transactionTime: DateTime.now(),
                        ),
                      ),
                    );
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 20)),
      ],
    );
  }
}
