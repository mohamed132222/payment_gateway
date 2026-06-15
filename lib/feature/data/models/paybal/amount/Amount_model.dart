import 'Details.dart';

/// total : "100"
/// currency : "USD"
/// details : {"subtotal":"100","shipping":"0","shipping_discount":0}

class AmountModel {
  AmountModel({
    required this.total,
    required this.currency,
    required this.details,
  });

  final String? total;
  final String? currency;
  final Details? details;

  factory AmountModel.fromJson(Map<String, dynamic> json) => AmountModel(
    total: json["total"],
    currency: json["currency"],
    details: Details.fromJson(json["details"]),
  );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['total'] = total;
    map['currency'] = currency;
    if (details != null) {
      map['details'] = details?.toJson();
    }
    return map;
  }
}
