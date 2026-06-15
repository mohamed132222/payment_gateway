import 'package:flutter/material.dart';
import 'package:payment/core/utils/styles/styles.dart';
import 'package:payment/feature/data/models/product/product_model.dart';
import 'package:payment/feature/presentation/views/widgets/quantity_control.dart';

class CartProductItem extends StatelessWidget {
  const CartProductItem({
    super.key,
    required this.product,
    required this.onIncrement,
    required this.onDecrement,
  });

  final ProductModel product;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.07),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              color: product.color.withOpacity(0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Icon(
                Icons.shopping_bag_outlined,
                size: 36,
                color: product.color,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.name, style: Styles.font18w600),
                const SizedBox(height: 4),
                Text(
                  '\$${product.price.toStringAsFixed(2)}',
                  style: Styles.font16w400.copyWith(color: Colors.grey[600]),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '\$${product.itemTotal.toStringAsFixed(2)}',
                style: Styles.font18w600,
              ),
              const SizedBox(height: 8),
              QuantityControl(
                quantity: product.quantity,
                onIncrement: onIncrement,
                onDecrement: onDecrement,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
