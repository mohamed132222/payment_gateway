class InitPaymentSheetRequest {
  final String merchantDisplayName;
  final String clientSecret;

  final String customerId;
  final String ephemeralKeySecret;

  InitPaymentSheetRequest({
    this.merchantDisplayName = 'Mohamed',
    required this.clientSecret,
    required this.customerId,
    required this.ephemeralKeySecret,
  });
}
