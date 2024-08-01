import 'package:flutter/material.dart';
import 'item.dart';

class Cart with ChangeNotifier {
  List<Item> items = [];
  double _total = 0.0;

  Cart() {
    items = [
      Item(id: 0, name: "orange", price: 20, quantity: 1),
      Item(id: 1, name: "apple", price: 19, quantity: 1),
      Item(id: 2, name: "lemon", price: 5, quantity: 1),
      Item(id: 3, name: "Mango", price: 40, quantity: 1),
    ];
    _updateTotal();
  }

  void add(Item item) {
    final existingItemIndex = items.indexWhere((i) => i.id == item.id);
    if (existingItemIndex >= 0) {
      items[existingItemIndex].quantity = item.quantity;
    } else {
      items.add(item);
    }
    _updateTotal();
  }

  void increaseQuantity(Item item) {
    final existingItemIndex = items.indexWhere((i) => i.id == item.id);
    if (existingItemIndex >= 0) {
      items[existingItemIndex].quantity++;
      _updateTotal();
    }
  }

  void decreaseQuantity(Item item) {
    final existingItemIndex = items.indexWhere((i) => i.id == item.id);
    if (existingItemIndex >= 0) {
      if (items[existingItemIndex].quantity > 1) {
        items[existingItemIndex].quantity--;
        _updateTotal();
      } else {
        items.removeAt(existingItemIndex);
        _updateTotal();
      }
    }
  }

  void remove(Item item) {
    items.removeWhere((i) => i.id == item.id);
    _updateTotal();
  }

  void _updateTotal() {
    _total = items.fold(0, (sum, i) => sum + i.price * i.quantity);
    notifyListeners();
  }

  int get count {
    return items.length;
  }

  double get totalprice {
    return _total;
  }

  List<Item> get basketItems {
    return items;
  }
}
