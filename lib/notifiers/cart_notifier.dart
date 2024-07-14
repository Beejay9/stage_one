import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:stage_one/models/cart_item.dart';

class Cart with ChangeNotifier {
  Map<String, CartItem> _cartFootwears = {};

  Map<String, CartItem> get cartFootwears {
    return {..._cartFootwears};
  }

  int get totalCartItem {
    int total = 0;
    _cartFootwears.forEach(
      (key, value) {
        total = total + value.quantity;
      },
    );
    return total;
  }

  int singleCartItem(String footwearId) {
    if (_cartFootwears[footwearId]?.quantity == null) {
      return 0;
    } else {
      return _cartFootwears[footwearId]!.quantity;
    }
  }

  double get totalAmount {
    double total = 0;
    _cartFootwears.forEach((key, value) {
      total = total + value.price * value.quantity;
    });
    return total;
  }

  Future<void> addToCart(
    String footwearId,
    String name,
    int quantity,
    Color? color,
    String imageUrl,
    int size,
    double price,
  ) async {
    // // final url =
    // http.post(
    //   Uri.parse(),
    //   body: jsonEncode(
    //     {},
    //   ),
    // );

    if (_cartFootwears.containsKey(footwearId)) {
      _cartFootwears.update(
        footwearId,
        (currentCartItem) => CartItem(
          id: currentCartItem.id,
          name: currentCartItem.name,
          imageUrl: currentCartItem.imageUrl,
          color: currentCartItem.color,
          price: currentCartItem.price,
          size: currentCartItem.size,
          quantity: currentCartItem.quantity + 1,
        ),
      );
    } else {
      _cartFootwears.putIfAbsent(
        footwearId,
        () => CartItem(
          id: footwearId,
          name: name,
          imageUrl: imageUrl,
          color: color as Color,
          price: price,
          size: size,
          quantity: 1,
        ),
      );
    }
    notifyListeners();
  }

  void removeItem(String footwearId) {
    _cartFootwears.remove(footwearId);
    notifyListeners();
  }

  void removeSingleItem(String footwearId) {
    if (!_cartFootwears.containsKey(footwearId)) {
      return;
    }
    if (_cartFootwears[footwearId]!.quantity > 1) {
      _cartFootwears.update(
        footwearId,
        (value) => CartItem(
          id: value.id,
          name: value.name,
          imageUrl: value.imageUrl,
          color: value.color,
          price: value.price,
          size: value.size,
          quantity: value.quantity - 1,
        ),
      );
    } else {
      _cartFootwears.remove(footwearId);
    }
    notifyListeners();
  }

  void clearCart() {
    _cartFootwears = {};
    notifyListeners();
  }
}
