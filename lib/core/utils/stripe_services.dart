//paymentIntentObject create paymentIntent (amount required, currency required)
//init payment sheet (paymentIntentClientSecret)
//present payment sheet  presentPaymentSheet()
import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment/core/utils/api_keys.dart';
import 'package:payment/core/utils/strip_api_services.dart';
import 'package:payment/feature/data/models/ephemeral_model/Ephemeral_keys_model.dart';
import 'package:payment/feature/data/models/init_payment_sheet_request/init_payment_sheet_request.dart';
import 'package:payment/feature/data/models/payment_intent_request/payment_intent_request.dart';
import 'package:payment/feature/data/models/payment_intent_response/PaymentIntentModel.dart';

class StripeServices {
  StripApiServices stripApiServices = StripApiServices();

  /// create payment intent on the server
  Future<PaymentIntentModel> createPaymentIntent(
    CreatePaymentIntentRequest request,
  ) async {
    var response = await stripApiServices.post(
      url: 'https://api.stripe.com/v1/payment_intents',
      data: request.toJson(),
      token: ApiKeys.secretKey,
      contentType: Headers.formUrlEncodedContentType,
    );
    var paymentIntentModel = PaymentIntentModel.fromJson(response.data);
    return paymentIntentModel;
  }

  /// init payment sheet (paymentIntentClientSecret)
  Future initPaymentSheet({
    required InitPaymentSheetRequest initPaymentSheetRequest,
  }) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: initPaymentSheetRequest.clientSecret,
        merchantDisplayName: initPaymentSheetRequest.merchantDisplayName,
        customerEphemeralKeySecret: initPaymentSheetRequest.ephemeralKeySecret,
        customerId: initPaymentSheetRequest.customerId,
        // style: ThemeMode.dark,
      ),
    );
  }

  /// present payment sheet
  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment({required CreatePaymentIntentRequest request}) async {
    var paymentIntent = await createPaymentIntent(request);
    var ephemeralKeysModel = await createEphemeralKey(
      customerId: paymentIntent.customer!,
    );
    InitPaymentSheetRequest initPaymentSheetRequest = InitPaymentSheetRequest(
      clientSecret: paymentIntent.clientSecret!,
      customerId: paymentIntent.customer!,
      ephemeralKeySecret: ephemeralKeysModel.secret!,
      merchantDisplayName: 'Mohamed',
    );
    await initPaymentSheet(initPaymentSheetRequest: initPaymentSheetRequest);
    await displayPaymentSheet();
  }

  Future<EphemeralKeysModel> createEphemeralKey({
    required String customerId,
  }) async {
    var response = await stripApiServices.post(
      url: 'https://api.stripe.com/v1/ephemeral_keys',

      data: {'customer': customerId},
      token: ApiKeys.secretKey,

      headers: {
        'Authorization': 'Bearer ${ApiKeys.secretKey}',
        "Stripe-Version": "2026-05-27.dahlia",
        "Content-Type": "application/x-www-form-urlencoded",
      },
    );
    var ephemeralKeysModel = EphemeralKeysModel.fromJson(response.data);
    return ephemeralKeysModel;
  }
}
