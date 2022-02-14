import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:listac/cartmodel.dart';
import 'package:listac/cartpage.dart';
import 'package:listac/category.dart';
import 'package:scoped_model/scoped_model.dart';
//import 'package:scoped_model/scoped_model/main.dart';

void main() => runApp(MyApp(
      model: CartModel(),
    ));

class MyApp extends StatelessWidget {
  final CartModel model;

  const MyApp({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ScopedModel<CartModel>(
      model: model,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shopping Cart',
        home: CategoryPage(),
        routes: {'/cart': (context) => CartPage()},
      ),
    );
  }
}
