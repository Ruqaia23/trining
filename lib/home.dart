import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trining/bottomsheet.dart';
import 'package:trining/checkout.dart';
import './model/item.dart';
import 'model/cart.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        actions: <Widget>[
          Consumer<Cart>(
            builder: (context, cart, child) {
              return Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) =>
                            BottomSheetttt(item: cart.items.first),
                      );
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.add_shopping_cart),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Checkout()),
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: Text("${cart.count}"),
                  ),
                ],
              );
            },
          ),
        ],
      ),
      body: Consumer<Cart>(
        builder: (context, cart, child) {
          return ListView.builder(
            itemCount: cart.items.length,
            itemBuilder: (context, i) {
              final item = cart.items[i];
              return Card(
                child: ListTile(
                  title: Text(item.name),
                  subtitle: Text("\$${item.price.toStringAsFixed(2)}"),
                  trailing: IconButton(
                    icon: Icon(Icons.cancel),
                    onPressed: () => Provider.of<Cart>(context, listen: false)
                        .remove(cart.basketItems[i]),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
