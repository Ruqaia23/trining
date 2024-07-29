import 'package:flutter/material.dart';
import 'package:trining/home.dart';
import 'package:provider/provider.dart';
import 'package:trining/model/cart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return Cart();
      },
      child: MaterialApp(
        debugShowMaterialGrid: false,
        debugShowCheckedModeBanner: false,
        title: "Smart Home",
        home: Home(),
      ),
    );
  }
}
