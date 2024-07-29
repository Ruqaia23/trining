import 'package:flutter/material.dart';
import 'item.dart';

class Cart with ChangeNotifier {
  List<Item> _items = [];
  double _total = 0.0;
  void add(Item item) {
    _items.add(item);
    _total += item.price;
    notifyListeners();
  }

  void remove(Item item) {
    _items.remove(item);
    _total -= item.price;
    notifyListeners();
  }

  int get count {
    return _items.length;
  }

  double get totalprice {
    return _total;
  }

  List<Item> get basketitem {
    return _items;
  }
}
