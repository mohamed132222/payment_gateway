import 'package:payment/feature/data/models/paybal/amount/Amount_model.dart';
import 'package:payment/feature/data/models/paybal/amount/Details.dart';
import 'package:payment/feature/data/models/paybal/task_list/item_list.dart';
import 'package:payment/feature/data/models/paybal/task_list/order_item_model.dart';
import 'package:payment/feature/data/models/product/product_model.dart';

({AmountModel amountModel, ItemList itemList}) buildPaypalTransactionData(
  dynamic total,
  dynamic subtotal,
  dynamic shipping,
  dynamic discount,
  List<ProductModel> products,
) {
  final amountModel = AmountModel(
    total: total.toStringAsFixed(2),
    currency: 'USD',

    details: Details(
      subtotal: subtotal.toStringAsFixed(2),
      shipping: shipping.toStringAsFixed(2),
      shippingDiscount: discount.toInt(),
    ),
  );

  final orders = products
      .map(
        (p) => OrderItemModel(
          name: p.name,
          quantity: p.quantity,
          price: p.price.toStringAsFixed(2),
          currency: 'USD',
        ),
      )
      .toList();

  return (amountModel: amountModel, itemList: ItemList(orders: orders));
}
