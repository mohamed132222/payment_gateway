/// subtotal : "100"
/// shipping : "0"
/// shipping_discount : 0

class Details {
  Details({this.subtotal, this.shipping, this.shippingDiscount});

  Details.fromJson(dynamic json) {
    subtotal = json['subtotal'];
    shipping = json['shipping'];
    shippingDiscount = json['shipping_discount'];
  }

  String? subtotal;
  String? shipping;
  int? shippingDiscount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['subtotal'] = subtotal;
    map['shipping'] = shipping;
    map['shipping_discount'] = shippingDiscount;
    return map;
  }
}
