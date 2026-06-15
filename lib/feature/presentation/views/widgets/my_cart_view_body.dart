import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/core/utils/stripe_services.dart';
import 'package:payment/core/widgets/custom_button.dart';
import 'package:payment/feature/cubit/payment_cubit.dart';
import 'package:payment/feature/data/models/product/product_model.dart';
import 'package:payment/feature/data/repos/payment_repo_impl.dart';
import 'package:payment/feature/presentation/views/widgets/cart_product_item.dart';
import 'package:payment/feature/presentation/views/widgets/order_item.dart';
import 'package:payment/feature/presentation/views/widgets/payment_method_bottom_sheet.dart';
import 'package:payment/feature/presentation/views/widgets/total_price.dart';

class MyCartViewBody extends StatefulWidget {
  const MyCartViewBody({super.key});

  @override
  State<MyCartViewBody> createState() => _MyCartViewBodyState();
}

class _MyCartViewBodyState extends State<MyCartViewBody> {
  final String _clientName = 'Sam Louis';
  final double _shipping = 8.0;
  final double _discount = 0.0;

  final List<ProductModel> _products = [
    ProductModel(name: 'Apple', price: 10.0, color: Colors.red, quantity: 5),
    ProductModel(
      name: 'Pineapple',
      price: 50.0,
      color: Colors.orange,
      quantity: 3,
    ),
  ];

  double get _subtotal => _products.fold(0, (sum, p) => sum + p.itemTotal);

  double get _total => _subtotal + _shipping - _discount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(height: 12),
          Expanded(
            child: ListView.separated(
              itemCount: _products.length,
              separatorBuilder: (_, _) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final product = _products[index];
                return CartProductItem(
                  product: product,
                  onIncrement: () => setState(() => product.quantity++),
                  onDecrement: () {
                    if (product.quantity > 1) {
                      setState(() => product.quantity--);
                    }
                  },
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          OrderItem(
            title: "Order Subtotal",
            price: '\$${_subtotal.toStringAsFixed(2)}',
          ),
          const SizedBox(height: 3),
          OrderItem(
            title: "Discount",
            price: '-\$${_discount.toStringAsFixed(2)}',
          ),
          const SizedBox(height: 3),
          OrderItem(
            title: "Shipping",
            price: '\$${_shipping.toStringAsFixed(2)}',
          ),
          const Divider(height: 34, thickness: 1, color: Color(0xFFC7C7C7)),
          TotalPrice(price: '\$${_total.toStringAsFixed(2)}'),
          const SizedBox(height: 16),
          CustomButton(
            text: "Proceed to Payment",
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => BlocProvider(
                  create: (context) => PaymentCubit(
                    paymentRepo: PaymentRepoImpl(
                      stripeServices: StripeServices(),
                    ),
                  ),
                  child: PaymentMethodBottomSheet(
                    products: _products,
                    total: _total,
                    subtotal: _subtotal,
                    shipping: _shipping,
                    discount: _discount,
                    clientName: _clientName,
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 25),
        ],
      ),
    );
  }
}
