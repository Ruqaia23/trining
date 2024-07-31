import 'package:flutter/material.dart';

class Item {
  final int id;
  final String prodectId;
  final String name;
  final int price;
  int quantity;

  Item({
    required this.id,
    required this.name,
    required this.price,
    this.quantity = 1,
    this.prodectId = '',
  });
}
