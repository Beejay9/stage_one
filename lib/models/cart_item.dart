import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String name;
  final int size;
  final String imageUrl;
  final Color color;
  final double price;
  int quantity;

  CartItem({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.color,
    required this.size,
    required this.quantity,
  });
}