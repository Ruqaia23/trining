import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:trining/model/item.dart';
import 'model/cart.dart';

class Checkout extends StatefulWidget {
  const Checkout({Key? key}) : super(key: key);

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Checkout"),
      ),
      body: Consumer<Cart>(
        builder: (context, cart, child) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cart.basketItems.length,
                  itemBuilder: (context, i) {
                    return Card(
                      child: ListTile(
                        title: Text("${cart.basketItems[i].name}"),
                        trailing: IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: () {
                            cart.remove(cart.basketItems[i]);
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
              Consumer<Cart>(builder: (context, value, child) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: ReusableWidgit(
                          title: "total items",
                          value: "${cart.count}  ".toString()),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: ReusableWidgit(
                          title: "total Price",
                          value: "${cart.totalprice}  ".toString() + "" + r"$"),
                    )
                  ],
                );
              }),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Container(
                  height: 50,
                  width: 300,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ))),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Thank you!'),
                          duration: Duration(seconds: 2),
                          backgroundColor: Colors.blue,
                        ),
                      );
                    },
                    child: Text('Checkout'),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class ReusableWidgit extends StatelessWidget {
  final String title, value;
  const ReusableWidgit({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text(title), Text(value)],
        ));
  }
}
