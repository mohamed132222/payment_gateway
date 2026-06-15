/// name : "Apple"
/// quantity : 4
/// price : "10"
/// currency : "USD"

class OrderItemModel {
  OrderItemModel({this.name, this.quantity, this.price, this.currency});

  OrderItemModel.fromJson(dynamic json) {
    name = json['name'];
    quantity = json['quantity'];
    price = json['price'];
    currency = json['currency'];
  }

  String? name;
  int? quantity;
  String? price;
  String? currency;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['quantity'] = quantity;
    map['price'] = price;
    map['currency'] = currency;
    return map;
  }
}
