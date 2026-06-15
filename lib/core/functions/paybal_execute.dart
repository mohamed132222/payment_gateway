import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:payment/core/utils/api_keys.dart';
import 'package:payment/feature/cubit/payment_cubit.dart';
import 'package:payment/feature/data/models/paybal/amount/Amount_model.dart';
import 'package:payment/feature/data/models/paybal/task_list/item_list.dart';

void paybal_execute(
  BuildContext context,
  ({AmountModel amountModel, ItemList itemList}) transactionData,
) {
  // Use rootNavigator so PayPal is pushed above the bottom sheet modal
  final navigator = Navigator.of(context, rootNavigator: true);
  final cubit = context.read<PaymentCubit>();

  navigator.push(
    MaterialPageRoute(
      builder: (_) => PaypalCheckoutView(
        sandboxMode: true,
        clientId: ApiKeys.clientId,
        secretKey: ApiKeys.paybalSecretKey,
        transactions: [
          {
            "amount": transactionData.amountModel.toJson(),
            "description": "The payment transaction description.",
            "item_list": transactionData.itemList.toJson(),
          },
        ],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          log("onSuccess: $params");
          navigator.pop();
          cubit.paypalSuccess();
        },
        onError: (error) {
          log("onError: $error");
          navigator.pop();
          cubit.paypalFailure(error.toString());
        },
        onCancel: () {
          navigator.pop();
          cubit.paypalCancelled();
        },
      ),
    ),
  );
}
