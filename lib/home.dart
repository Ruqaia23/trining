import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trining/checkout.dart';
import './model/item.dart';
import 'model/cart.dart';

class Home extends StatelessWidget {
  List<Item> items = [
    Item(name: "orange", price: 20),
    Item(name: "apple", price: 19),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: <Widget>[
          Row(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.add_shopping_cart),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return Checkout();
                  }));
                },
              ),
              Padding(
                padding: const EdgeInsets.only(right: 30),
                child: Consumer<Cart>(builder: (context, Cart, child) {
                  return Text("${Cart.count}");
                }),
              ),
            ],
          )
        ],
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, i) {
          return Card(
            child: Consumer<Cart>(
              builder: (context, cart, child) {
                return ListTile(
                  title: Text("${items[i].name}"),
                  trailing: IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      cart.add(items[i]);
                    },
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
