import 'package:flutter/material.dart';

import 'package:house_tech/web/models/product.dart';

class CartProvider with ChangeNotifier {
  List<Product> _cartItems = [];

  List<Product> get cartItems => _cartItems;

  void addCartItem(Product cartItem) {
    _cartItems.add(cartItem);
    notifyListeners();
  }

  void removeCartItem(Product cartItem) {
    _cartItems.remove(cartItem);
    notifyListeners();
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }
}
