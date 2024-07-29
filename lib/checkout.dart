import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model/cart.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("checkout"),
        ),
        body: Consumer<Cart>(
          builder: (context, cart, child) {
            return ListView.builder(
                itemCount: cart.basketitem.length,
                itemBuilder: (context, i) {
                  return Card(
                    child: ListTile(
                      title: Text("${cart.basketitem[i].name}"),
                      trailing: IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          cart.remove(cart.basketitem[i]);
                        },
                      ),
                    ),
                  );
                });
          },
        ));
  }
}
