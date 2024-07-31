import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trining/bottomsheet.dart'; // Ensure this is the correct import
import 'package:trining/checkout.dart'; // Ensure this is the correct import
import './model/item.dart';
import 'model/cart.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Cart'),
          actions: <Widget>[
            Row(
              children: <Widget>[
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
                  child: Consumer<Cart>(builder: (context, cart, child) {
                    return Text("${cart.count}");
                  }),
                ),
              ],
            )
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: Consumer<Cart>(
                builder: (context, Valuee, child) {
                  return ListView.builder(
                    itemCount: Valuee.items.length,
                    itemBuilder: (context, i) {
                      final item = Valuee.items[i];
                      return Card(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                            ListTile(
                              title: Text("${item.name}  "),
                              trailing: IconButton(
                                icon: Icon(Icons.add),
                                onPressed: () {
                                  var selectedItem;
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (context) => BottomSheetttt(
                                      item: selectedItem,
                                    ),
                                  );
                                },
                              ),
                            ),
                            Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 5),
                                    child: Text("${item.price}  ".toString() +
                                        "" +
                                        r"$"),
                                  ),
                                  Container(
                                    child: Text(""),
                                  )
                                ])
                          ]));
                    },
                  );
                },
              ),
            )
          ],
        ));
  }
}
