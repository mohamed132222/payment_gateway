import 'package:flutter/material.dart';

class ProductModel {
  ProductModel({
    required this.name,
    required this.price,
    required this.color,
    this.quantity = 1,
  });

  final String name;
  final double price;
  final Color color;
  int quantity;

  double get itemTotal => price * quantity;
}
