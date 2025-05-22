import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;
  final String imageUrl;

  CartItem({
    required this.id,
    required this.title,
    required this.price,
    required this.quantity,
    required this.imageUrl,
  });
}

class Cart with ChangeNotifier {
  final Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total = total + cartItem.price * cartItem.quantity;
    });
    return total;
  }

  void addItem(String id, double price, String title, String imageUrl) {
    if (_items.containsKey(id)) {
      _items.update(
        id,
        (existing) => CartItem(
          id: existing.id,
          price: existing.price,
          quantity: existing.quantity + 1,
          title: existing.title,
          imageUrl: existing.imageUrl, 
        ),
      );
      print("$title is added to cart multiple");
    } else {
      _items.putIfAbsent(
        id,
        () => CartItem(
          id: DateTime.now().toString(),
          price: price,
          quantity: 1,
          title: title,
          imageUrl: imageUrl, 
        ),
      );
      print("$title is added to cart");
    }
    notifyListeners();
  }

  void removeItem(String id) {
    _items.remove(id);
    notifyListeners();
  }
}
