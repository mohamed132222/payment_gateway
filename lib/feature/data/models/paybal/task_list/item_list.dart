import 'order_item_model.dart';

/// items : [{"name":"Apple","quantity":4,"price":"10","currency":"USD"},{"name":"Pineapple","quantity":5,"price":"12","currency":"USD"}]

class ItemList {
  ItemList({this.orders});

  ItemList.fromJson(dynamic json) {
    if (json['items'] != null) {
      orders = [];
      json['items'].forEach((v) {
        orders?.add(OrderItemModel.fromJson(v));
      });
    }
  }

  List<OrderItemModel>? orders;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (orders != null) {
      map['items'] = orders?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
