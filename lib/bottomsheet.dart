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

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, cart, child) {
        return ListView.builder(
          itemCount: 1,
          itemBuilder: (context, i) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                          decoration: InputDecoration(
                            hintText: "ID",
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        TextField(
                          decoration: InputDecoration(
                            hintText: "Name",
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        TextField(
                          decoration: InputDecoration(
                            hintText: "Price",
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        TextField(
                          decoration: InputDecoration(
                            hintText: "quantity",
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Consumer<Cart>(builder: (context, cart, child) {
                          return ElevatedButton(
                            onPressed: () {
                              final existingItemIndex = cart.items
                                  .indexWhere((i) => i.id == widget.item.id);
                              if (existingItemIndex >= 0) {
                                cart.items[existingItemIndex].quantity +=
                                    quantity;
                              } else {
                                cart.add(Item(
                                  id: cart.items[i].id,
                                  name: cart.items[i].name,
                                  price: cart.items[i].price,
                                  quantity: quantity,
                                ));
                              }
                              Navigator.pop(context);
                            },
                            child: Text("ok"),
                          );
                        })
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
