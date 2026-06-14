import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment/core/errors/failure.dart';
import 'package:payment/core/utils/stripe_services.dart';
import 'package:payment/feature/data/models/payment_intent_request/payment_intent_request.dart';
import 'package:payment/feature/data/repos/payment_repo.dart';

class PaymentRepoImpl extends PaymentRepo {
  final StripeServices stripeServices;

  PaymentRepoImpl({required this.stripeServices});

  @override
  Future<Either<Failure, void>> makePayment({
    required CreatePaymentIntentRequest request,
  }) async {
    try {
      await stripeServices.makePayment(request: request);
      return const Right(null);
    } on StripeException catch (e) {
      return Left(
        ServerFailure(
          errorMessage: e.error.localizedMessage ?? 'Payment Failed',
        ),
      );
    } catch (e, stackTrace) {
      debugPrint(stackTrace.toString());

      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
