import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trining/model/cart.dart';
import 'package:trining/model/item.dart';

class BottomSheetttt extends StatefulWidget {
  final Item item;
  const BottomSheetttt({Key? key, required this.item}) : super(key: key);

  @override
  State<BottomSheetttt> createState() => _BottomSheettttState();
}

class _BottomSheettttState extends State<BottomSheetttt> {
  final _idController = TextEditingController();
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _quantityController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _idController.text = widget.item.id.toString();
    _nameController.text = widget.item.name;
    _priceController.text = widget.item.price.toString();
    _quantityController.text = widget.item.quantity.toString();
  }

  @override
  void dispose() {
    _idController.dispose();
    _nameController.dispose();
    _priceController.dispose();
    _quantityController.dispose();
    super.dispose();
  }

  void _handleAddOrUpdateItem(Cart cart) {
    final id = int.tryParse(_idController.text);
    final name = _nameController.text;
    final price = double.tryParse(_priceController.text);
    final quantity = int.tryParse(_quantityController.text);

    if (id != null && name.isNotEmpty && price != null && quantity != null) {
      final newItem = Item(id: id, name: name, price: 00, quantity: quantity);

      final existingItemIndex = cart.items.indexWhere((i) => i.id == id);
      if (existingItemIndex >= 0) {
        cart.items[existingItemIndex].quantity = quantity;
      } else {
        cart.add(newItem);
      }

      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please enter valid values")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, cart, child) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _idController,
                decoration: InputDecoration(
                  hintText: "ID",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 15),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  hintText: "Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
              SizedBox(height: 15),
              TextField(
                controller: _priceController,
                decoration: InputDecoration(
                  hintText: "Price",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
              ),
              SizedBox(height: 15),
              TextField(
                controller: _quantityController,
                decoration: InputDecoration(
                  hintText: "Quantity",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 15),
              ElevatedButton(
                onPressed: () => _handleAddOrUpdateItem(cart),
                child: Text("OK"),
              ),
            ],
          ),
        );
      },
    );
  }
}
