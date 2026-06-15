import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment/core/errors/failure.dart';
import 'package:payment/core/utils/stripe_services.dart';
import 'package:payment/feature/data/models/stripe/payment_intent_request/payment_intent_request.dart';
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
          errorMessage: e.error.localizedMessage ?? 'Payment failed',
        ),
      );
    } on DioException catch (e) {
      final message = _dioErrorMessage(e);
      return Left(ServerFailure(errorMessage: message));
    } catch (e, stackTrace) {
      debugPrint(stackTrace.toString());
      return Left(ServerFailure(errorMessage: 'Something went wrong'));
    }
  }

  String _dioErrorMessage(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return 'Connection timed out. Check your internet and try again.';
      case DioExceptionType.connectionError:
        return 'No internet connection. Please try again.';
      default:
        return e.response?.data?['error']?['message'] ??
            'Network error. Please try again.';
    }
  }
}
