import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/feature/cubit/payment_state.dart';
import 'package:payment/feature/data/models/stripe/payment_intent_request/payment_intent_request.dart';
import 'package:payment/feature/data/repos/payment_repo.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit({required this.paymentRepo}) : super(PaymentInitial());
  final PaymentRepo paymentRepo;

  Future<void> makePayment(CreatePaymentIntentRequest request) async {
    emit(PaymentLoading());
    var data = await paymentRepo.makePayment(request: request);
    data.fold(
      (l) => emit(PaymentFailure(message: l.errorMessage)),
      (r) => emit(PaymentSuccess()),
    );
  }

  void initiatePaypalPayment() {
    emit(PaypalPaymentInitiated());
  }

  void paypalSuccess() {
    emit(PaymentSuccess());
  }

  void paypalFailure(String message) {
    emit(PaymentFailure(message: message));
  }

  void paypalCancelled() {
    emit(PaymentFailure(message: 'Payment cancelled'));
  }

  @override
  void onChange(Change<PaymentState> change) {
    log(change.toString());
    super.onChange(change);
  }
}
