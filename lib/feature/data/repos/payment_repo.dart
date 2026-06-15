import 'package:dartz/dartz.dart';
import 'package:payment/core/errors/failure.dart';
import 'package:payment/feature/data/models/stripe/payment_intent_request/payment_intent_request.dart';

abstract class PaymentRepo {
  Future<Either<Failure, void>> makePayment({
    required CreatePaymentIntentRequest request,
  });
}
