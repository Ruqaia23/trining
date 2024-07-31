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
  int quantity = 1;

  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) {
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemCount:
              1, // Assuming you are adding only one item in the bottom sheet
          itemBuilder: (context, i) {
            return Container(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("ID: ${value.items[i].id}"),
                  Text("Name: ${value.items[i].name}"),
                  Text("Price: \$${value.items[i].price.toStringAsFixed(2)}"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          setState(() {
                            if (quantity > 1) {
                              quantity--;
                            }
                          });
                        },
                      ),
                      Text("$quantity"),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          setState(() {
                            quantity++;
                          });
                        },
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      value.add(Item(
                        id: value.items[i].id,
                        name: value.items[i].name,
                        price: value.items[i].price,
                        quantity: quantity,
                      ));
                      Navigator.pop(context);
                    },
                    child: Text("Add to Cart"),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
